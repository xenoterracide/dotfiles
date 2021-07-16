VIM_COLORDIR="$HOME/.vim/colors"
VIM_PLUGDIR="$HOME/.vim/pack/local/start"
VIM_AFTER_SYNTAX="$HOME/.vim/after/syntax"

mkdir -p $VIM_PLUGDIR
mkdir -p $VIM_AFTER_SYNTAX

zinit ice wait cloneonly
zinit lucid \
  atClone"cp -a * $VIM_PLUGDIR" \
  atPull"cp -a * $VIM_PLUGDIR" \
  for editorconfig/editorconfig-vim

zinit ice wait cloneonly \
  atClone"cp colors/desertlink.vim $VIM_COLORDIR" \
  atPull"cp colors/desertlink.vim $VIM_COLORDIR"
zinit light toupeira/vim-desertink

zinit ice wait cloneonly \
  atClone"cp after/syntax/zsh.vim $VIM_COLORDIR" \
  atPull"cp after/syntax/zsh.vim $VIM_COLORDIR"
zinit light zinit-zsh/zinit-vim-syntax
