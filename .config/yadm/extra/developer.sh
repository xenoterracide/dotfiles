#!/bin/zsh
export NVM_DIR="$HOME/.local/share/nvm"
zinit wait lucid as"null" \
  dl"https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" \
  atclone"mkdir -p $NVM_DIR && PROFILE=/dev/null source install.sh && source nvm.sh && nvm install --lts" \
  src"$NVM_DIR/nvm.sh" \
  atpull"%atclone" \
  for nvm-sh/nvm

export SDKMAN_DIR="$HOME/.local/share/sdkman"
zinit wait lucid as"command" \
  dl"https://get.sdkman.io?rcupdate=false" \
  atclone"zsh get.sdkman.io && source $SDKMAN_DIR/bin/sdkman-init.sh && sdk install java" \
  src"$SDKMAN_DIR/bin/sdkman-init.sh" \
  atpull"%atclone" \
  for zdharma/null
