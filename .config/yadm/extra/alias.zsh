####### alias.sh
zi wait has'vim' atload'alias vi="vim"' for z-shell/null
zi wait has'vim' atload'alias vim="\vim -Xp"' for z-shell/null
zi wait has'journalctl' atload'alias journalctl="journalctl --output cat --boot 0 --full"' for z-shell/null
zi wait has'dmesg' atload'alias dmesg="dmesg --color=always | less"' for z-shell/null
zi wait has'lsblk' atload'alias lsblk="lsblk -o name,label,fstype,uuid"' for z-shell/null
zi wait has'pbcopy' atload'alias clip="pbcopy"' for z-shell/null
zi wait has'xclip' atload'alias clip="xclip -selection clipboard -in"' for z-shell/null
zi wait has'bat' atload'alias cat="bat --paging=never --plain"' for z-shell/null
zi wait has'eza' atload'alias ls="eza"' for z-shell/null
zi wait has'plocate' atload'alias locate="plocate"' for z-shell/null
zi wait has'dust' atload'alias du="dust"' for z-shell/null
zi wait has'kalker' atload'alias bc="kalker"' for z-shell/null
zi wait has'procs' atload'alias ps="procs"' for z-shell/null
zi wait has'tokei' atload'alias cloc="tokei"' for z-shell/null
zi wait has'zoxide' atload'eval "$(zoxide init zsh --hook pwd --cmd cd)"' for z-shell/null
zi wait has'direnv' atload'eval "$(direnv hook zsh)"' for z-shell/null
#######
