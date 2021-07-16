### # edit ~/.config/yadm/alt/.zshrc##template
###

{% include "../extra/rc.sh" %}
{% include "../extra/alias.sh" %}

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node \
  zinit-zsh/z-a-meta-plugins \
  zdharma/zui \
  zdharma/zplugin-crasis \
  zdharma/zconvey

### End of Zinit's installer chunk
{% include "../extra/vim.zsh" %}
{% if yadm.user != "root" %}
  {% include "../extra/developer.sh" %}
{% endif %}

zinit ice wait"!" lucid nocd atload'!tw_setup'
zinit light reobin/typewritten

zinit snippet OMZL::history.zsh
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::systemd
zinit snippet OMZP::sdk
zinit snippet OMZP::scd
zinit snippet OMZP::direnv
zinit snippet OMZP::gitignore

zinit ice has"perl"
zinit snippet OMZP::direnv
zinit ice as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us

zinit lucid atload"zicompinit" for zsh-users+fast
bindkey -e
