### # edit ~/.config/yadm/alt/.zshrc##template
###

plugins=(
  command-not-found
  history-substring-search
  gitfast
  git-auto-fetch
  git-escape-magic
  gitignore
  magic-enter
  safe-paste
)

# User configuration

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
source $HOME/.config/my/global.sh

zinit ice wait"!" lucid nocd atload'!tw_setup'
zinit light reobin/typewritten

zinit snippet OMZL::history.zsh
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::systemd
zinit snippet OMZP::sdk

zinit wait lucid as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' pick"direnv" src"zhook.zsh" for \
    direnv/direnv

zinit wait lucid as"program" \
  cp"bin/scd* -> scd" \
  pick"scd" \
  src"shellrcfiles/zshrc_scd" \
  atclone"scd --add $HOME --recursive" \
  for pavoljuhas/smart-change-directory

zinit ice as"program" has"perl" mv"cpanmin.us* -> cpanm" pick"cpanm"
zinit snippet https://cpanmin.us

zinit ice as"program" has"batpipe" atload"eval $(batpipe)"
zinit light zdharma/null

zinit lucid atload"zicompinit" for zsh-users+fast
bindkey -e
