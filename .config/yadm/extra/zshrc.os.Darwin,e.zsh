# SPDX-FileCopyrightText: Copyright © 2020 - 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

# os.Darwin
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
PATH="$(brew --prefix findutils)/libexec/gnubin:$PATH"
PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
zi wait has"brew" atload"(( $+commands[brew] )) && . $(brew --prefix asdf)/libexec/asdf.sh" for z-shell/null

function vim_setup() {
  local VIMDIR="$HOME/.vim"
  local VIM_COLOR="$VIMDIR/colors"
  local VIM_PACK="$VIMDIR/pack"
  local VIM_FTPLUGIN="$VIMDIR/ftplugin"
  local VIM_FTDETECT="$VIMDIR/ftdetect"
  local VIM_AFTER_SYNTAX="$VIMDIR/after/syntax"

  zi ice lucid wait'[[ -f $(brew --prefix coreutils)/libexec/gnubin/install ]]' \
    cloneonly nocompile notify \
    atclone"install --compare -D colors/desertink.vim $VIM_COLOR/desertink.vim" \
    atpull"%atclone"
  zi light toupeira/vim-desertink

  zi ice lucid wait'[[ -f $(brew --prefix coreutils)/libexec/gnubin/install ]]' \
    cloneonly nocompile notify \
    atclone"install --compare -D after/syntax/zsh.vim $VIM_AFTER_SYNTAX/zsh.vim" \
    atpull"%atclone"
  zi light z-shell/zinit-vim-syntax

  zi ice lucid wait'[[ -f $(brew --prefix coreutils)/libexec/gnubin/install ]]' \
    cloneonly nocompile notify \
    atclone"install -D syntax/systemd.vim $VIM_AFTER_SYNTAX/systemd.vim; install -D ftplugin/systemd.vim $VIM_FTPLUGIN/systemd.vim; install -D ftdetect/systemd.vim $VIM_FTDETECT/systemd.vim" \
    atpull"%atclone"
  zi light wgwoods/vim-systemd-syntax

{% include "../extra/vim##class.{{ yadm.class }},e.zsh" %}
}

vim_setup
unfunction vim_setup
#######
