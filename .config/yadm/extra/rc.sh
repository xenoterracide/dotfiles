# SPDX-FileCopyrightText: Copyright © 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

## rc.sh
if command -v perl >/dev/null 2>&1; then
  if perl -Mlocal::lib -e 1 >/dev/null 2>&1; then
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
  fi
fi
#######
