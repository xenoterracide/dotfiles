set -e
brew install \
  maven \
  awscli \
  bat \
  exa \
  zoxide \
  gh \
  kalker \
  git-delta \
  fd \
  dust \
  ripgrep

brew install --cask \
  corretto \
  font-fira-code-nerd-font \
  font-fira-sans \
  font-noto-nerd-font \
  font-powerline-symbols \
  microsoft/git/git-credential-manager-core
set +e

