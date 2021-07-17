### # edit ~/.config/yadm/alt/.zshrc##template
###

{% include "../extra/rc.sh" %}
{% include "../extra/alias.sh" %}
{% include "../extra/vim.zsh" %}

if [[ $USER != "root" ]]; then
{% include "../extra/developer.sh" %}
fi

zinit ice wait"!" lucid nocd atload'!tw_setup'
zinit light reobin/typewritten

zinit snippet OMZL::history.zsh
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::systemd
zinit snippet OMZP::sdk
zinit snippet OMZP::scd
zinit snippet OMZP::direnv
zinit snippet OMZP::gitignore

zinit ice as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us

zinit lucid atload"zicompinit" for zsh-users+fast
bindkey -e
