######
# developer.sh
######
#export NVM_DIR="$HOME/.local/share/nvm"

#zi ice lucid wait"1"
#zi snippet OMZP::nvm

#export SDKMAN_DIR="$HOME/.local/share/sdkman"

#zi ice lucid wait"1" id-as=sdkman as"program" notify \
#  dl"https://get.sdkman.io?rcupdate=false" \
#  atclone"bash get.sdkman.io && source $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java" \
#  atload"source $SDKMAN_DIR/bin/sdkman-init.sh"
#zi load z-shell/null

#zi ice lucid wait"1"
#zi snippet OMZP::sdk

zi wait atload=". /opt/asdf-vm/asdf.sh" for z-shell/null

######
