alias vi="vim -Xp"
alias vim="vim -Xp"
alias brix="java -jar ~/.local/share/brix/brix.jar"
alias clip="xclip -selection clipboard -in"

if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never --plain"
fi

if command -v exa >/dev/null 2>&1; then
  alias ls="exa"
fi
