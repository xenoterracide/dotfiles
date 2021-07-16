VIM_COLORDIR="$HOME/.vim/colors"
VIM_PLUGDIR="$HOME/.vim/pack/local/start"
VIM_AFTER_SYNTAX="$HOME/.vim/after/syntax"
VIM_EDITORCONFIG="editorconfig-vim"

mkdir -p $VIM_PLUGDIR
mkdir -p $VIM_AFTER_SYNTAX

zinit ice wait
zinit light \
  atClone"cp -a * $VIM_PLUGDIR" \
  atPull"cp -a * $VIM_PLUGDIR" \
  for editorconfig/$VIM_EDITORCONFIG

zinit ice wait \
  atClone"cp colors/desertlink.vim $VIM_COLORDIR" \
  atPull"cp colors/desertlink.vim $VIM_COLORDIR"
zinit light toupeira/vim-desertink

zinit ice wait \
  atClone"cp after/syntax/zsh.vim $VIM_COLORDIR" \
  atPull"cp after/syntax/zsh.vim $VIM_COLORDIR"
zinit light zinit-zsh/zinit-vim-syntax
