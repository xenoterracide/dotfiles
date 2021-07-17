######
# developer.sh
######
export ZSH_THEME="typewritten"
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "
export TYPEWRITTEN_RELATIVE_PATH="adaptive"

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less --chop-long-lines'
export LESS="-R --quit-if-one-screen --silent"
export GPG_TTY=$(tty)
######

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

zinit load zinit-zsh/z-a-patch-dl

zinit ice as"program" pick"cmds/zc-bg-notify"
zinit load zdharma/zconvey
