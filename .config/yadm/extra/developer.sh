######
# developer.sh
######
export NVM_DIR="$HOME/.local/share/nvm"
zinit snippet OMZP::nvm

export SDKMAN_DIR="$HOME/.local/share/sdkman"
zinit wait lucid as"command" \
  dl"https://get.sdkman.io?rcupdate=false" \
  atclone"zsh get.sdkman.io && source $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java" \
  src"$SDKMAN_DIR/bin/sdkman-init.sh" \
  atpull"%atclone" \
  for zdharma/null
######
