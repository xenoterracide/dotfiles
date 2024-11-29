# SPDX-FileCopyrightText: Copyright © 2020 - 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

if [ -f /opt/asdf-vm/asdf.sh ]; then
  . /opt/asdf-vm/asdf.sh
  if [ -d $HOME/.asdf/plugins/java ]; then
    if [ $0 == "/bin/sh" || $SHELL == "/bin/bash" ]; then
      . $HOME/.asdf/plugins/java/set-java-home.bash
    elif [ $SHELL == "/bin/zsh" ]; then
      . $HOME/.asdf/plugins/java/set-java-home.zsh
    fi
  fi
fi

# Added by Toolbox App
export PATH="$PATH:/home/xeno/.local/share/JetBrains/Toolbox/scripts"

