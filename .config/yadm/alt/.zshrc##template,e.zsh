### # edit ~/.config/yadm/alt/.zshrc##template
###
#
zinit load zinit-zsh/z-a-meta-plugins

{% include "../extra/rc.sh" %}
{% include "../extra/alias.sh" %}
{% include "../extra/vim.zsh" %}

if [[ $USER != "root" ]]; then
{% include "../extra/developer.zsh" %}
fi


zinit ice wait
zinit snippet OMZL::history.zsh
zinit ice wait
zinit snippet OMZP::colored-man-pages
zinit ice wait
zinit snippet OMZP::systemd
zinit ice wait
zinit snippet OMZP::sdk
zinit ice wait
zinit snippet OMZP::scd
zinit ice wait
zinit snippet OMZP::direnv
zinit ice wait
zinit snippet OMZP::gitignore

zinit ice wait as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy



zinit ice wait as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us

zinit ice nocd atload'!tw_setup'
zinit load reobin/typewritten

zinit lucid atload"zicompinit" for zsh-users+fast
bindkey -e
