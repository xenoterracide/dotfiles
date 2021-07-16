VIM_COLORDIR="$HOME/.vim/colors"
VIM_PLUGDIR="$HOME/.vim/pack/local/start"
VIM_AFTER_SYNTAX="$HOME/.vim/after/syntax"

mkdir -p $VIM_PLUGDIR
mkdir -p $VIM_AFTER_SYNTAX

zinit ice wait cloneonly proto"git" notify
zinit light \
  atClone"cp -a * $VIM_PLUGDIR" \
  atPull"%atClone" \
  for editorconfig/editorconfig-vim

zinit ice wait cloneonly proto"git" notify\
  atClone"cp colors/desertlink.vim $VIM_COLORDIR" \
  atPull"%atClone"
zinit light toupeira/vim-desertink

zinit ice wait cloneonly proto"git" notify\
  atClone"cp after/syntax/zsh.vim $VIM_COLORDIR" \
  atPull"%atClone"
zinit light zinit-zsh/zinit-vim-syntax
