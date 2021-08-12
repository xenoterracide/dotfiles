zinit load zinit-zsh/z-a-meta-plugins


zinit for zdharma/history-search-multi-word zdharma/zconvey
zinit snippet OMZL::history.zsh
#zinit ice lucid nocd atload'!tw_setup'
#zinit load reobin/typewritten

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zinit load romkatv/powerlevel10k

zinit wait as"program" \
  cp"bin/scd* -> scd" \
  pick"scd" \
  src"shellrcfiles/zshrc_scd" \
  atclone"scd --add $HOME --recursive" \
  for pavoljuhas/smart-change-directory

zinit wait for \
  OMZL::theme-and-appearance.zsh atload"unalias ls" \
  OMZP::colored-man-pages \
  OMZP::systemd \
  OMZP::direnv \
  OMZP::gitignore \
  OMZP::scd

zinit ice wait as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy


zinit ice wait as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us


{% if yadm.user == "root" %}
{% else %}
{% include "../extra/developer.zsh" %}
{% endif %}

{% include "../extra/rc.sh" %}
{% include "../extra/alias.zsh" %}
{% include "../extra/vim.zsh" %}

zstyle :plugin:history-search-multi-word reset-prompt-protect 1


#. /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

schedprompt() {
  zle && zle reset-prompt
  sched +1 schedprompt
}

zmodload -i zsh/sched
schedprompt

zinit wait for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit wait atload"zicompinit" for zsh-users+fast
set -o emacs
bindkey "^R" history-search-multi-word
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
