# SPDX-FileCopyrightText: Copyright © 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

# WARNING: this file was generated by {{ yadm.source }}
{% include "../extra/env.sh" %}

zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi ice lucid id-as
zi load z-shell/z-a-patch-dl
