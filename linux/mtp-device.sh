#!/bin/bash

# Enables USB file transfers between an Android device and Linux PC using MTP (Media Transfer Protocol).
# Also makes it possible to modify Android files directly.
#
# Android device: Use USB for [x] File transfers
#
# https://www.linuxquestions.org/questions/debian-26/connecting-android-device-to-debian-stable-4175557670/
#
# Prerequisites:
# Install: mtp-tools & jmtpfs
# sudo groupadd fuse
# sudo adduser $USER fuse
# sudo nano /etc/fuse.conf: user_allow_other
# sudo mkdir /media/MTPdevice
# sudo chmod 775 /media/MTPdevice/
# sudo chown -v root:fuse /media/MTPdevice/

# Testing:
# mtp-detect
# mtp-connect

MTPdevice="/media/MTPdevice"

echo "***********************************"
if [ -d $MTPdevice/[^.]* ]; then
    echo "* Unmounting $MTPdevice     *"
    echo "***********************************"
    fusermount -u $MTPdevice
else
    echo "* Un- & Mounting $MTPdevice *"
    echo "***********************************"
    fusermount -u $MTPdevice
    jmtpfs $MTPdevice
fi
