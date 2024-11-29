# SPDX-FileCopyrightText: Copyright © 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

set -e

cat << EOF | xargs brew install
asdf
awscli
bat
direnv
dust
eza
fd
findutils
fmt
gawk
gh
git-delta
gitversion
gnu-prolog
gnu-sed
graphviz
grep
helm
htop
httpie
inetutils
jpeg
jq
kalker
parallel
pgcli
ripgrep
rsync
rust
swi-prolog
tokei
wget
zoxide
EOF

brew tap homebrew/cask-fonts

brew install --cask \
  font-fira-code-nerd-font \
  font-fira-sans \
  font-noto-nerd-font \
  font-powerline-symbols

set +e

