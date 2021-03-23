#!/bin/sh
sudo dnf install -y $(cat bootstrap.d/pkglist.txt)
