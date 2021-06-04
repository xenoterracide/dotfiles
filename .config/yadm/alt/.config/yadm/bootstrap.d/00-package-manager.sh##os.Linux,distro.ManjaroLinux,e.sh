#!/bin/sh

cat $(dirname $0)/bootstrap.d/pkglist.txt | xargs pamac install --no-confirm
