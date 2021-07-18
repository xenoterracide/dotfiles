######
# developer.sh
######
export NVM_DIR="$HOME/.local/share/nvm"

zinit ice lucid wait"1"
zinit snippet OMZP::nvm

export SDKMAN_DIR="$HOME/.local/share/sdkman"

zinit ice lucid wait"1" id-as=sdkman as"program" notify \
  dl"https://get.sdkman.io?rcupdate=false" \
  atclone"bash get.sdkman.io && source $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java" \
  atload"source $SDKMAN_DIR/bin/sdkman-init.sh"
zinit load zdharma/null

zinit ice lucid wait"1"
zinit snippet OMZP::sdk

######
