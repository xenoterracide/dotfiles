#!/bin/sh

cd /tmp/ && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd .. && rm -rf yay 
yay --batchinstall \
   aspell-en \
   awesome-terminal-fonts \
   bitwarden-cli \
   diff-so-fancy \
   gpg-tui \
   jq \
   mtr \
   nano \
   otf-fira-mono \
   otf-fira-sans \
   parallel \
   procs \
   tokei \
   traceroute \
   vi \
   vim-spell-en \
   whois \
   yadm \
   zoxide \
   github-cli \
   asdf-vm \
   kalker

