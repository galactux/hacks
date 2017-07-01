#!/bin/bash

# Enables USB file transfers between an Android device and Linux PC using MTP (Media Transfer Protocol)
# Android device: Use USB for [x] File transfers
#
# https://www.linuxquestions.org/questions/debian-26/connecting-android-device-to-debian-stable-4175557670/
#
# Prerequisites:
# Install: mtp-tools & jmtpfs
# sudo mkdir /media/MTPdevice
# sudo chmod 775 /media/MTPdevice
# sudo groupadd fuse
# sudo adduser $USER fuse
# sudo chown -v root:fuse /media/MTPdevice
# sudo nano /etc/fuse.conf: user_allow_other
#
# Testing:
# mtp-detect
# mtp-connect

echo '*******************************'
if [ -d /media/MTPdevice/[^.]* ]; then
    echo '* Unmounting /media/MTPdevice *'
    echo '*******************************'
    fusermount -u /media/MTPdevice
else
    echo '*  Mounting /media/MTPdevice  *'
    echo '*******************************'
    jmtpfs /media/MTPdevice
fi
