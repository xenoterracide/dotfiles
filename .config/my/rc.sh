#!/bin/sh
eval `keychain --eval --inherit any id_rsa`

if command -v perl >/dev/null 2>&1; then
  if perl -Mlocal::lib -e 1 >/dev/null 2>&1; then
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
  fi
fi

if command kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
