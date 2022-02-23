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

zi wait for \
  atinit"zicompinit; zicdreplay" \
      z-shell/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zi creinstall -q .' \
      zsh-users/zsh-completions

zi wait atload"zicompinit" for zsh-users+fast
set -o emacs
bindkey "^R" history-search-multi-word
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
