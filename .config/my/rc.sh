#!/bin/sh
eval `keychain --eval --inherit any --agents ssh id_rsa`
eval `keychain --eval --inherit any --agents gpg 202671F87222DA97 570B348783282576`

if command -v perl >/dev/null 2>&1; then
  if perl -Mlocal::lib -e 1 >/dev/null 2>&1; then
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
  fi
fi

if command kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
