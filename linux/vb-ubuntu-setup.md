# Set up Ubuntu Desktop on Oracle VirtualBox

### Prerequisites: VirtualBox installed
* https://www.virtualbox.org/wiki/Downloads
* Remember Oracle VM VirtualBox Extension Pack

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
* Settings/Display
  * Video Memory: 128 MB
  * Acceleration: [X] Enable 3D Acceleration
* Settings/Storage
  * Controller: IDE Secondary Master: ubuntu-17.04-desktop-amd64.iso

### Install Ubuntu
* "Install third-party software for graphics..."
* "Erase disk and install Ubuntu"
* Restart -> Install Guest Additions -> Shut down

### Add shared folders
* Devices > Shared folders settings...
```
sudo adduser <account_name> vboxsf
```

### Remove the Unity Amazon package
* https://askubuntu.com/questions/760204/how-to-remove-the-unity-amazon-package-in-16-04
```
cp /usr/share/applications/ubuntu-amazon-default.desktop ~/.local/share/applications/ubuntu-amazon-default.desktop
echo Hidden=true >> ~/.local/share/applications/ubuntu-amazon-default.desktop
```
