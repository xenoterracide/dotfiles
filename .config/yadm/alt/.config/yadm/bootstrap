#!/bin/sh
set -x

export DOWNLOAD_DIR=$(xdg-user-dir DOWNLOAD)
export WGET="wget --no-verbose --timestamping --directory-prefix $DOWNLOAD_DIR"
export WGET_GH='wget --no-verbose --no-if-modified-since'
export TAR='tar --extract --verbose --keep-newer-files --file'
export SCRIPTDIR="$(dirname $0)/bootstrap.d"

mkdir -p ~/.local/bin

cat $(dirname $0)/pkglist.txt | xargs pamac install --no-confirm
