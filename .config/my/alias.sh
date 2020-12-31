#!/bin/sh
alias vi="vim -Xp"
alias vim="vim -Xp"

if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never --plain"
fi

if command -v exa >/dev/null 2>&1; then
  alias ls="exa"
fi
