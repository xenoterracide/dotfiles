zinit ice lucid
zinit load zinit-zsh/z-a-meta-plugins

{% include "../extra/rc.sh" %}
{% include "../extra/alias.sh" %}
{% include "../extra/vim.zsh" %}

zinit lucid wait lucid as"program" \
  cp"bin/scd* -> scd" \
  pick"scd" \
  src"shellrcfiles/zshrc_scd" \
  atclone"scd --add $HOME --recursive" \
  for pavoljuhas/smart-change-directory

zinit wait lucid for \
  OMZL::theme-and-appearance.zsh \
  OMZP::colored-man-pages \
  OMZP::systemd \
  OMZP::direnv \
  OMZP::gitignore \
  OMZP::scd


zinit ice lucid wait as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy


zinit ice lucid wait as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us

zinit load zdharma/zconvey

{% if yadm.user == "root" %}
{% else %}
{% include "../extra/developer.zsh" %}
{% endif %}


schedprompt() {
    zle && zle reset-prompt
    sched +1 schedprompt
}

zmodload -i zsh/sched
schedprompt

zinit ice nocd atload'!tw_setup'
zinit load reobin/typewritten
zinit snippet OMZL::history.zsh

zinit lucid wait atload"zicompinit" for zsh-users+fast
bindkey -e
