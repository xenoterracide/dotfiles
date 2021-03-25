#!/bin/sh

sudo cat << EOF > /etc/yum.repos.d/opera.repo
[opera]
name=Opera packages
type=rpm-md
baseurl=https://rpm.opera.com/rpm
gpgcheck=1
gpgkey=https://rpm.opera.com/rpmrepo.key
enabled=1
EOF

FEDORA_VERSION=$(rpm -E %fedora)
RPMFUSION_MIRROR="https://download1.rpmfusion.org/"

sudo dnf -y install $RPMFUSION_MIRROR/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm $RPMFUSION_MIRROR/nonfree/fedora/rpmfusion-nonfree-release-$FEDORA_VERSION.noarch.rpm

sudo dnf install -y $(cat bootstrap.d/pkglist.txt)

sudo snap install discord zoom-client

