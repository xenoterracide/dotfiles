if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  if [ -f $(brew --prefix asdf)/libexec/asdf.sh ]; then
    . $(brew --prefix asdf)/libexec/asdf.sh
  fi
if
