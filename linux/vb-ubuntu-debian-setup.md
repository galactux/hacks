# Set up Ubuntu and Debian Desktop on Oracle VirtualBox

### Prerequisites: VirtualBox installed
* https://wiki.debian.org/VirtualBox
* Oracle VM VirtualBox Extension Pack
  * https://www.virtualbox.org/wiki/Downloads
  * File -> Preferences... -> Extensions

## Ubuntu

### Download Ubuntu
* https://www.ubuntu.com/download/desktop
* sha256sum ubuntu-17.04-desktop-amd64.iso: `b718c7fb1066589af52f4ba191775b0fb514c5fb6fa7d91367043e1db06d8a0b`

### Create Ubuntu Virtual Machine
* https://brb.nci.nih.gov/bdge/installUbuntu.html
* My Lenovo Thinkpad T410 with 8 GB RAM
  * Enable virtualization and ensure Security Chip is Inactive in Lenovo BIOS
* Set up VM
  * Name: Ubuntu 17.04 (-> Type: Linux, Version: Ubuntu (64-bit))
  * Memory size: 5000 MB
  * Create a virtual hard drive now -> VDI -> Dynamically allocated -> 50.00 GB
* Settings/General
  * Shared Clipboard: Bidirectional
* Settings/System
  * Boot Order: [X] Hard Disk
  * Processor: 2
* Settings/Storage
  * Controller: IDE Secondary Master: ubuntu-17.04-desktop-amd64.iso

### Install Ubuntu
* Install -> Restart -> Install Guest Additions -> Shut down

### Add shared folders
* Devices > Shared folders settings...
```
$ sudo adduser <account_name> vboxsf
```

### Remove the Unity Amazon package
* https://askubuntu.com/questions/760204/how-to-remove-the-unity-amazon-package-in-16-04
```
$ cp /usr/share/applications/ubuntu-amazon-default.desktop ~/.local/share/applications/ubuntu-amazon-default.desktop
$ echo Hidden=true >> ~/.local/share/applications/ubuntu-amazon-default.desktop
```

---

## Debian

### Download, create VM and install Debian
* http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/9.1.0+nonfree/amd64/iso-dvd/
* sha512sum firmware-9.1.0-amd64-DVD-1.iso: `5e41c56d336a1feea1ca940b2e7692732f753d5b4b05fd27b3a08131182ce493f201dd511a04a2f9d17b6b316c3bd462695a2c84bd30838fed0e75357c27dea7`
* See Ubuntu instructions

## Set up Debian
* Add yourself to the sudo group, then logout-login or reboot
```
$ su -l root
# adduser <account_name> sudo
```
* Install Guest Additions; Devices > Insert Guest Additions CD Image...
  * https://virtualboxes.org/doc/installing-guest-additions-on-debian/
```
$ sudo su
# apt update
# apt upgrade
# apt install build-essential module-assistant
# m-a prepare
# mount /media/cdrom
# sh /media/cdrom/VBoxLinuxAdditions.run
```
* Add shared folders, see Ubuntu
