######
# alias.sh
######
alias vi="vim"
alias vim="\vim -Xp"
alias clip="xclip -selection clipboard -in"
alias bfg="java -jar ~/.local/share/bfg.jar"
alias logs="journalctl --output cat --boot 0 --full"
alias dmesg="dmesg --color=always | less"
alias lsblk="lsblk -o name,label,fstype,uuid"

zinit wait has"bat" atload'alias cat="bat --paging=never --plain"' for zdharma/null
zinit wait has"exa" atload'alias ls="exa"' for zdharma/null
zinit wait has"plocate" atload'alias locate="plocate"' for zdharma/null
zinit wait has"dust" atload'alias dust="du"' for zdharma/null
zinit wait has"kalker" atload'alias bc="kalker"' for zdharma/null
zinit wait has"procs" atload'alias ps="procs"' for zdharma/null
zinit wait has"tokei" atinit'alias cloc="tokei"' for zdharma/null
zinit wait has"zoxide" atinit'eval "$(zoxide init zsh --hook pwd --cmd cd)"' for zdharma/null

######