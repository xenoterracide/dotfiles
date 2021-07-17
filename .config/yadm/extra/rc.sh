######
# rc.sh
######
if [ "$DESKTOP_SESSION" = "gnome" ]; then
  eval $(gnome-keyring-daemon --start)
  if command -v seahorse > /dev/null 2>&1; then
    export SSH_ASKPASS=$(which seahorse)
  fi
fi

if command -v keychain >/dev/null 2>&1; then
  eval `keychain --eval --inherit any --agents ssh id_rsa id_ed25519`
fi
#eval `keychain --eval --inherit any --agents gpg 202671F87222DA97 570B348783282576`

if command -v perl >/dev/null 2>&1; then
  if perl -Mlocal::lib -e 1 >/dev/null 2>&1; then
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
  fi
fi

if command kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

if command cargo >/dev/null 2>&1; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi
######
