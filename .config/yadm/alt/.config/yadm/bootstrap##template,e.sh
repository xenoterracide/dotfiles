#!/bin/sh

# SPDX-FileCopyrightText: Copyright © 2020 - 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

set -x

if [ command -v xdg-user-dir > /dev/null ];
then export DOWNLOAD_DIR="$(xdg-userdir DOWNLOAD)"
else export DOWNLOAD_DIR="$HOME/Downloads"
fi

export WGET="wget --no-verbose --timestamping --directory-prefix $DOWNLOAD_DIR"
export WGET_GH='wget --no-verbose --no-if-modified-since'
export TAR='tar --extract --verbose --keep-newer-files --file'
export SCRIPTDIR="$(dirname $0)/bootstrap.d"

mkdir -p ~/.local/bin

sh -c "$(curl -fsSL get.zshell.dev)" -- -a loader
source $SCRIPTDIR/00-package-manager.sh
