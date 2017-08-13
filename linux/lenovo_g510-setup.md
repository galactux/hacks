# Set up Lenovo G510 from scratch

### BIOS Setup:
* Configuration
  * USB Legacy: Disabled
* Security
  * Administrator Password: Set
  * Secure Boot: Disabled
* Boot
  * Boot Mode: UEFI
  * USB Boot: Disabled
* Exit
  * OS Optimized Defaults: Win8 64bit

### Remove obsolete entries from the BIOS boot menu (UEFI):
* https://askubuntu.com/questions/63610/how-do-i-remove-ubuntu-in-the-bios-boot-menu-uefi

### Install Debian GNU/Linux 9.1.0 Stretch
* Add yourself to the sudo group
  ```
  $ su -l root
  # adduser <account_name> sudo
  ```
* WiFi setup
  * https://unix.stackexchange.com/questions/350691/debian-9-wifi-driver-problems-fresh-install
  ```
  $ lspci
  ...
  02:00.0 Network controller: Broadcom Limited BCM43142 802.11b/g/n (rev 01)

  $ sudo nano /etc/apt/sources.list
  deb http://ftp.fi.debian.org/debian/ stretch main contrib non-free
  deb-src http://ftp.fi.debian.org/debian/ stretch main contrib non-free

  $ sudo apt update
  $ sudo apt upgrade
  $ sudo apt dist-upgrade
  $ sudo apt remove broadcom-sta-dkms
  $ sudo apt install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
  $ sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
  $ sudo modprobe wl
  ```
* Install firmware
  ```
  $ sudo apt install firmware-linux
  ```
* Bluetooth setup
  ```
  $ lsusb
  ...
  Bus 003 Device 004: ID 105b:e065 Foxconn International, Inc. BCM43142A0 Bluetooth module

  $ sudo dmesg | grep -i blue
  ...
  [  943.530756] bluetooth hci0: firmware: failed to load brcm/BCM.hcd (-2)
  ```
  * https://askubuntu.com/questions/632336/bluetooth-broadcom-43142-isnt-working
  * Download Broadcom Windows driver from http://www.driverscape.com/download/bcm43142a0: broadcom_bluetooth_12_0_0_9980.zip, extract zip
  ```
  $ cp broadcom_bt_64_12009980/Win64/BCM43142A0_001.001.011.0249.0272.hex .
  ```
  * Install Git and get hex2hcd from GitHub
  ```
  $ git clone git://github.com/jessesung/hex2hcd.git
  $ cd hex2hcd
  $ make
  $ cd ..
  $ ./hex2hcd/hex2hcd BCM43142A0_001.001.011.0249.0272.hex BCM43142A0-105b-e065.hcd
  $ sudo mkdir /lib/firmware/brcm
  $ sudo cp BCM43142A0-105b-e065.hcd /lib/firmware/brcm/BCM.hcd
  ```
  * Turn computer off and on, and possibly still reboot
  * Useful commands to get bluetooth working without rebooting:
  ```
  $ sudo dmesg | grep -i blue
  $ sudo hciconfig hci0 up
  $ sudo modprobe -r btusb
  $ sudo modprobe btusb
  ```
