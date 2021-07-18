### # edit ~/.config/yadm/alt/.zshrc##template
###
#
zinit load zinit-zsh/z-a-meta-plugins

{% include "../extra/rc.sh" %}
{% include "../extra/alias.sh" %}
{% include "../extra/vim.zsh" %}

{% if yadm.user == "root" %}
{% else %}
{% include "../extra/developer.zsh" %}
{% endif %}

zinit ice wait
zinit snippet OMZL::history.zsh
zinit ice wait
zinit snippet OMZP::colored-man-pages
zinit ice wait
zinit snippet OMZP::systemd
zinit ice wait
zinit snippet OMZP::sdk
zinit ice wait
zinit snippet OMZP::direnv
zinit ice wait
zinit snippet OMZP::gitignore

zinit wait lucid as"program" \
  cp"bin/scd* -> scd" \
  pick"scd" \
  src"shellrcfiles/zshrc_scd" \
  atclone"scd --add $HOME --recursive" \
  for pavoljuhas/smart-change-directory

zinit ice wait
zinit snippet OMZP::scd


zinit ice wait as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy


zinit ice wait as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us

zinit ice nocd atload'!tw_setup'
zinit load reobin/typewritten

zinit lucid atload"zicompinit" for zsh-users+fast
bindkey -e
