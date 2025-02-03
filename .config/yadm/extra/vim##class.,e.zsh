# START: {{ yadm.source }}
# SPDX-FileCopyrightText: Copyright © 2025 Caleb Cushing
#
# SPDX-License-Identifier: MIT

zi ice lucid wait cloneonly nocompile \
    atclone"rsync --mkpath --exclude '.*' --archive . $VIM_PACK/local/start/editorconfig" \
    atpull"%atclone"
  zi light editorconfig/editorconfig-vim
# END: {{ yadm.source }}
