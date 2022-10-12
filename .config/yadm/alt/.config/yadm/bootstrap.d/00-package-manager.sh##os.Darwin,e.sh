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
  microsoft/git/git-credential-manager-core \
  ripgrep

brew tap homebrew/cask-fonts

brew install --cask \
  font-fira-code-nerd-font \
  font-fira-sans \
  font-noto-nerd-font \
  font-powerline-symbols \

set +e

