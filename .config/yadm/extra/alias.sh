######
# alias.sh
######
alias vi="\vim -Xp"
alias vim="\vim -Xp"
alias brix="\java -jar ~/.local/share/brix/brix.jar"
alias clip="\xclip -selection clipboard -in"
alias bfg="\java -jar ~/.local/share/bfg.jar"
alias logs="\journalctl --output cat --boot 0 --full"
alias dmesg="\dmesg --color=always | less"
alias lsblk="\lsblk -o name,label,fstype,uuid"

if command -v bat >/dev/null 2>&1; then
  alias cat="\bat --paging=never --plain"
fi

if command -v exa >/dev/null 2>&1; then
  alias ls="\exa"
fi

if command -v plocate >/dev/null 2>&1; then
  alias locate="plocate"
fi
######
