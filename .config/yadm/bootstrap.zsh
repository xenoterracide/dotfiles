#!/bin/zsh
for file in $HOME/.config/yadm/bootstrap.d/**/*sh(.); source $file

