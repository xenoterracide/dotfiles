######
# vim.zsh
######

function vim_setup() {
  local VIMDIR="$HOME/.vim"
  local VIM_COLOR="$VIMDIR/colors"
  local VIM_PACK="$VIMDIR/pack"
  local VIM_FTPLUGIN="$VIMDIR/ftplugin"
  local VIM_FTDETECT="$VIMDIR/ftdetect"
  local VIM_AFTER_SYNTAX="$VIMDIR/after/syntax"


  zinit ice wait cloneonly proto"git" nocompile notify \
    atclone"install --compare -D colors/desertink.vim $VIM_COLOR/desertink.vim" \
    atpull"%atclone"
  zinit light toupeira/vim-desertink

  zinit ice wait cloneonly proto"git" nocompile \
    atclone"install -D after/syntax/zsh.vim $VIM_AFTER_SYNTAX/zsh.vim" \
    atpull"%atclone"
  zinit light zinit-zsh/zinit-vim-syntax

  zinit ice wait cloneonly proto"git" nocompile \
    atclone"install -D syntax/systemd.vim $VIM_AFTER_SYNTAX/systemd.vim; install -D ftplugin/systemd.vim $VIM_FTPLUGIN/systemd.vim; install -D ftdetect/systemd.vim $VIM_FTDETECT/systemd.vim" \
    atpull"%atclone"
  zinit light wgwoods/vim-systemd-syntax

  zinit ice wait cloneonly proto"git" nocompile \
    atclone"rsync --exclude '.*' --archive . $VIM_PACK/editorconfig" \
    atpull"%atclone"
  zinit light editorconfig/editorconfig-vim
}
vim_setup
unfunction vim_setup
######
