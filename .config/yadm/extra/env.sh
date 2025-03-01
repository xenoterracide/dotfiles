# SPDX-FileCopyrightText: Copyright © 2020 - 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT
# shellcheck shell=sh

## env.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less --chop-long-lines'
export LESS='-R --quit-if-one-screen --silent'
export GPG_TTY=$(tty)
. ~/.asdf/plugins/java/set-java-home.zsh
#######
