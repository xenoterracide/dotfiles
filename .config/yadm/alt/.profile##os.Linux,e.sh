# SPDX-FileCopyrightText: Copyright © 2020-2024, 2026 Caleb Cushing
#
# SPDX-License-Identifier: MIT

path_prepend() {
  case ":$PATH:" in
    *":$1:"*) : ;;              # already present, do nothing
    *) PATH="$1:$PATH" ;;
  esac
}

path_append() {
  case ":$PATH:" in
    *":$1:"*) : ;;
    *) PATH="$PATH:$1" ;;
  esac
}

path_prepend "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
path_append "$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH

