#!/bin/zsh
emulate -L zsh
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  git secret push [--topic TOPIC] [--org ORG] [--env PATH] [--keyid KEYID] [--dry-run]

Defaults are read from:
  ~/.config/git/config (preferred) or ~/.gitconfig (fallback)

Files:
  Secrets are read from ~/.config/git/<topic>.env unless overridden with --env

Config keys:
  [secrets]
    defaultOrg = <orgOrUser>
    defaultTopic = <topic>
    signingKey = <keyid>      # optional, otherwise uses git user.signingKey

Notes:
  Each non-empty, non-comment line in the env file must be KEY=VALUE.
  GPG passphrase is obtained via gpg-agent.
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

main() {
  local topic=""
  local org=""
  local env_path=""
  local keyid=""
  local dry_run=0

  while (( $# > 0 )); do
    case "$1" in
      --topic) topic="${2:-}"; shift 2;;
      --org) org="${2:-}"; shift 2;;
      --env) env_path="${2:-}"; shift 2;;
      --keyid) keyid="${2:-}"; shift 2;;
      --dry-run) dry_run=1; shift;;
      -h|--help) usage; return 0;;
      *) die "unknown arg: $1";;
    esac
  done

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

  # Let gpg-agent handle passphrase entry/caching.
  local armor_key
  armor_key="$(command gpg --batch --armor --export-secret-keys "$keyid")"

  local KEY_SECRET_NAME="GPG_SIGNING_KEY_ASCII_ARMORED"

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
