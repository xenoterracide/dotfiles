alias vi="vim"
alias vim="\vim -Xp"
alias bfg="java -jar ~/.local/share/bfg.jar"
alias logs="journalctl --output cat --boot 0 --full"
alias dmesg="dmesg --color=always | less"
alias lsblk="lsblk -o name,label,fstype,uuid"

zi wait has"xclip" atload'alias clip="xclip -selection clipboard -in"' for z-shell/null
zi wait has"bat" atload'alias cat="bat --paging=never --plain"' for z-shell/null
zi wait has"exa" atload'alias ls="exa"' for z-shell/null
zi wait has"plocate" atload'alias locate="plocate"' for z-shell/null
zi wait has"dust" atload'alias dust="du"' for z-shell/null
zi wait has"kalker" atload'alias bc="kalker"' for z-shell/null
zi wait has"procs" atload'alias ps="procs"' for z-shell/null
zi wait has"tokei" atload'alias cloc="tokei"' for z-shell/null
zi wait"2" has"zoxide" atload'eval "$(zoxide init zsh --hook pwd --cmd cd)"' for z-shell/null
