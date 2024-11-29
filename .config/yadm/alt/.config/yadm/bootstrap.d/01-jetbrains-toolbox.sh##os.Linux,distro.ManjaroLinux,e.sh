#!/bin/sh

# SPDX-FileCopyrightText: Copyright © 2020 - 2024 Caleb Cushing
#
# SPDX-License-Identifier: MIT

{% if yadm.user == "root" %}
{% else %}
TOOLBOX_VERSION=1.20.7940
$WGET https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-$TOOLBOX_VERSION.tar.gz \
  && $TAR $DOWNLOAD_DIR/jetbrains-toolbox-$TOOLBOX_VERSION.tar.gz --strip-components=1 -C ~/.local/bin
{% endif %}
