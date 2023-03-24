#!/bin/sh

cd /tmp/ && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd .. && rm -rf yay 
yay -Y --gendb
yay -Y --combinedupgrade --batchinstall --nodiffmenu --cleanafter --noupgrademenu --save
yay -S \
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


export ASDF_DIR="/opt/asdf-vm"
. /opt/asdf-vm/asdf.sh


asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest:lts
asdf global nodejs lts

asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf install java latest:temurin-17
JAVA_VERSION=$(asdf list java | tr -d '\n')
asdf global java $JAVA_VERSION
