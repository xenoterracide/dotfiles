set -e

cat << EOF | xargs brew install
asdf
awscli
bat
dust
exa
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
rust
swi-prolog
tokei
wget
yadm
zoxide
microsoft/git/git-credential-manager-core
EOF

brew tap homebrew/cask-fonts

brew install --cask \
  font-fira-code-nerd-font \
  font-fira-sans \
  font-noto-nerd-font \
  font-powerline-symbols

set +e

