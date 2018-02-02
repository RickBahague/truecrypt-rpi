#!/bin/bash

#install required packages
sudo apt-get install nasm libwxgtk2.8-dev libfuse-dev libgtk2.0-dev ntfs-3g exfat-fuse exfat-utils -y

WORKDIR=$(pwd)

export PKCS11_INC="$WORKDIR/pkcs/"

export WX_ROOT=$WORKDIR/wxWidgets-2.8.12

cd $WORKDIR/truecrypt-7.1a-source

time make NOGUI=1 WXSTATIC=1 WX_ROOT=$WORKDIR/wxWidgets-2.8.12 wxbuild

time make NOGUI=1 WXSTATIC=1

sudo cp $WORKDIR/truecrypt-7.1a-source/Main/truecrypt $WORKDIR/out

sudo cp $WORKDIR/truecrypt-7.1a-source/Main/truecrypt /usr/bin/

sudo chmod a+x /usr/bin/truecrypt
