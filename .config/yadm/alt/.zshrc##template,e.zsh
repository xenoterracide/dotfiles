{% include "../extra/zshrc.os.{{ yadm.os }},e.zsh" %}
zi load z-shell/z-a-meta-plugins

zi for z-shell/history-search-multi-word z-shell/zconvey
zi snippet OMZL::history.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zi load romkatv/powerlevel10k

zi wait for \
  OMZL::theme-and-appearance.zsh atload"unalias ls" \
  OMZP::colored-man-pages \
  OMZP::systemd \
  OMZP::direnv \
  OMZP::gitignore

zi ice wait as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zi snippet https://cpanmin.us

{% include "../extra/rc.sh" %}
{% include "../extra/alias.zsh" %}

function vim_setup() {
  local VIMDIR="$HOME/.vim"
  local VIM_COLOR="$VIMDIR/colors"
  local VIM_PACK="$VIMDIR/pack"
  local VIM_FTPLUGIN="$VIMDIR/ftplugin"
  local VIM_FTDETECT="$VIMDIR/ftdetect"
  local VIM_AFTER_SYNTAX="$VIMDIR/after/syntax"

  zi ice lucid wait cloneonly nocompile notify \
    atclone"install --compare -D colors/desertink.vim $VIM_COLOR/desertink.vim" \
    atpull"%atclone"
  zi light toupeira/vim-desertink

  zi ice lucid wait cloneonly nocompile \
    atclone"install -D after/syntax/zsh.vim $VIM_AFTER_SYNTAX/zsh.vim" \
    atpull"%atclone"
  zi light z-shell/zinit-vim-syntax

  zi ice lucid wait cloneonly nocompile \
    atclone"install -D syntax/systemd.vim $VIM_AFTER_SYNTAX/systemd.vim; install -D ftplugin/systemd.vim $VIM_FTPLUGIN/systemd.vim; install -D ftdetect/systemd.vim $VIM_FTDETECT/systemd.vim" \
    atpull"%atclone"
  zi light wgwoods/vim-systemd-syntax

{% if yadm.class == "cof" %}
{% else %}
  zi ice lucid wait cloneonly nocompile \
    atclone"rsync --mkpath --exclude '.*' --archive . $VIM_PACK/local/start/editorconfig" \
    atpull"%atclone"
  zi light editorconfig/editorconfig-vim
{% endif %}
}
vim_setup
unfunction vim_setup
######

zstyle :plugin:history-search-multi-word reset-prompt-protect 1


schedprompt() {
  zle && zle reset-prompt
  sched +1 schedprompt
}

zmodload -i zsh/sched
schedprompt

zi wait for \
  atinit"zi compinit; zi cdreplay" \
      z-shell/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zi creinstall -q .' \
      zsh-users/zsh-completions

zi wait'2' atload"zi compinit" for zsh-users+fast
set -o emacs
bindkey "^R" history-search-multi-word
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
