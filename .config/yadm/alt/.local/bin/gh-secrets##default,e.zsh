#!/bin/zsh
emulate -L zsh
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  git secret push [--topic TOPIC] [--org ORG] [--env PATH] [--keyid KEYID] [--dry-run] [--debug]

Defaults are read from:
  ~/.config/git/config (preferred) or ~/.gitconfig (fallback)

Files:
  Secrets are read from ~/.config/git/<topic>.env unless overridden with --env

Config keys:
  [secrets]
    defaultOrg = <orgOrUser>
    defaultTopic = <topic>
    signingKey = <keyid>      # optional, otherwise uses git user.signingKey

  Per-key GPG overrides (optional):
    secrets.gpg.<keyid>.passphraseVarName = <ENV_VAR_NAME>
    secrets.gpg.<keyid>.secretVarName     = <ENV_VAR_NAME>

Debug:
  Pass --debug or set GH_SECRETS_DEBUG=1 to enable tracing (set -x).

Notes:
  Each non-empty, non-comment line in the env file must be KEY=VALUE.
USAGE
}

die() { print -u2 -- "error: $*"; exit 1; }

CONFIG_PRIMARY="${XDG_CONFIG_HOME:-$HOME/.config}/git/config"
CONFIG_FALLBACK="$HOME/.gitconfig"

git_config_get() {
  local key="$1"
  local out=""
  if command git config --file "$CONFIG_PRIMARY" --get "$key" >/dev/null 2>&1; then
    out="$(command git config --file "$CONFIG_PRIMARY" --get "$key")"
  else
    out="$(command git config --file "$CONFIG_FALLBACK" --get "$key" 2>/dev/null || true)"
  fi
  print -r -- "$out"
}

trim_ws() {
  # Trim leading/trailing whitespace (portable approach; avoids nested zsh expansions).
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  print -r -- "$s"
}

set_secret() {
  local repo="$1"
  local name="$2"
  local body="$3"
  local dry_run="$4"

  if (( dry_run == 1 )); then
    print -u2 -- "DRY: gh secret set ${name} --app actions --body <redacted> --repo ${repo}"
    return 0
  fi

  command gh secret set "$name" --app actions --body "$body" --repo "$repo" >/dev/null
}

enable_debug() {
  # Keep xtrace opt-in: it can expose arguments/values. We already redact the gh key body in dry-run.
  PS4='+%N:%i> '
  set -x
}

main() {
  local topic=""
  local org=""
  local env_path=""
  local keyid=""
  local dry_run=0
  local debug=0

  # Support early debug enablement.
  if [[ "${GH_SECRETS_DEBUG:-0}" != 0 ]]; then
    debug=1
  fi

  while (( $# > 0 )); do
    case "$1" in
      --debug) debug=1; shift;;
      --topic) topic="${2:-}"; shift 2;;
      --org) org="${2:-}"; shift 2;;
      --env) env_path="${2:-}"; shift 2;;
      --keyid) keyid="${2:-}"; shift 2;;
      --dry-run) dry_run=1; shift;;
      -h|--help) usage; return 0;;
      *) die "unknown arg: $1";;
    esac
  done

  (( debug )) && enable_debug

  org="${org:-$(git_config_get secrets.defaultOrg)}"
  topic="${topic:-$(git_config_get secrets.defaultTopic)}"

  [[ -n "${org}" ]] || die "missing org; set secrets.defaultOrg or pass --org"
  [[ -n "${topic}" ]] || die "missing topic; set secrets.defaultTopic or pass --topic"

  env_path="${env_path:-${XDG_CONFIG_HOME:-$HOME/.config}/git/${topic}.env}"
  [[ -f "$env_path" ]] || die "env file not found: $env_path"

  if [[ -z "${keyid}" ]]; then
    keyid="$(git_config_get secrets.signingKey)"
  fi
  if [[ -z "${keyid}" ]]; then
    keyid="$(command git config --get user.signingKey 2>/dev/null || true)"
  fi
  [[ -n "${keyid}" ]] || die "missing signing key; set user.signingKey (or secrets.signingKey) or pass --keyid"

  local KEY_SECRET_NAME
  KEY_SECRET_NAME="$(git_config_get "secrets.gpg.${keyid}.secretVarName")"
  KEY_SECRET_NAME="${KEY_SECRET_NAME:-GPG_SIGNING_KEY_ASCII_ARMORED}"

  local gpg_passphrase_var
  gpg_passphrase_var="$(git_config_get "secrets.gpg.${keyid}.passphraseVarName")"

  local gpg_passphrase=""
  if [[ -n "${gpg_passphrase_var}" ]]; then
    gpg_passphrase="$(command printenv "$gpg_passphrase_var" 2>/dev/null || true)"
    [[ -n "${gpg_passphrase}" ]] || die "secrets.gpg.${keyid}.passphraseVarName is set to '${gpg_passphrase_var}', but that env var is empty/unset"
  fi

  local armor_key
  if [[ -n "${gpg_passphrase}" ]]; then
    # Use loopback pinentry so --passphrase works.
    armor_key="$(command gpg --batch --pinentry-mode loopback --passphrase "$gpg_passphrase" --armor --export-secret-keys "$keyid")"
  else
    # Fall back to gpg-agent for passphrase entry/caching.
    armor_key="$(command gpg --batch --armor --export-secret-keys "$keyid")"
  fi

  local repos_raw
  repos_raw="$(command gh repo list "$org" --no-archived --topic "$topic" --json name,owner --jq '.[] | [ .owner.login, .name ] | join("/")')"
  [[ -n "${repos_raw}" ]] || die "no repos found for org=${org} topic=${topic}"

  local -a repos
  repos=()
  local repo
  while IFS= read -r repo; do
    [[ -n "$repo" ]] || continue
    repos+=("$repo")
  done <<< "$repos_raw"

  for repo in "${repos[@]}"; do
    [[ -n "$repo" ]] || continue
    set_secret "$repo" "$KEY_SECRET_NAME" "$armor_key" "$dry_run"
  done

  # Read env file lines; ignore blanks and comments; parse KEY=VALUE.
  local line name body
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="$(trim_ws "$line")"
    [[ -n "$line" ]] || continue
    [[ "$line" == \#* ]] && continue

    [[ "$line" == *"="* ]] || die "invalid line in env file (expected KEY=VALUE): $line"

    name="${line%%=*}"
    body="${line#*=}"
    name="$(trim_ws "$name")"

    [[ -n "$name" ]] || die "empty secret name in env file: $env_path"

    for repo in "${repos[@]}"; do
      [[ -n "$repo" ]] || continue
      set_secret "$repo" "$name" "$body" "$dry_run"
    done
  done < "$env_path"
}

main "$@"
