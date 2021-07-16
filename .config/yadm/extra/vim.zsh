VIM_COLORDIR="$HOME/.vim/colors"
VIM_PLUGDIR="$HOME/.vim/pack/local/start"
VIM_AFTER_SYNTAX="$HOME/.vim/after/syntax"

mkdir -p $VIM_PLUGDIR
mkdir -p $VIM_AFTER_SYNTAX

zinit ice wait cloneonly proto"git" \
  atClone"cp -a * $VIM_PLUGDIR" \
  atPull"%atClone" \
zinit light editorconfig/editorconfig-vim

zinit ice wait cloneonly proto"git" \
  atClone"cp colors/desertlink.vim $VIM_COLORDIR" \
  atPull"%atClone"
zinit light toupeira/vim-desertink

zinit ice wait cloneonly proto"git" \
  atClone"cp after/syntax/zsh.vim $VIM_COLORDIR" \
  atPull"%atClone"
zinit light zinit-zsh/zinit-vim-syntax
