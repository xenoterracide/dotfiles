######
# alias.sh
######
alias vi="vim -Xp"
alias vim="vim -Xp"
alias brix="java -jar ~/.local/share/brix/brix.jar"
alias clip="xclip -selection clipboard -in"
alias bfg="java -jar ~/.local/share/bfg.jar"

if command -v bat >/dev/null 2>&1; then
  alias cat="bat"
fi

if command -v exa >/dev/null 2>&1; then
  alias ls="exa"
fi

if command -v plocate >/dev/null 2>&1; then
  alias locate="plocate"
fi
if command -v journalctl >/dev/null 2>&1; then
  alias logs="journalctl -o cat -b 1"
fi
######
