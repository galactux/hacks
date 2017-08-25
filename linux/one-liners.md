# Useful one-line commands

* Anonymize pictures; remove all metadata, such as Location or Camera Model, from image files
  * `exiftool -all= <image_file(s)>`
  * http://owl.phy.queensu.ca/~phil/exiftool/
* Open Microsoft Outlook winmail.dat attachment files
  * `tnef winmail.dat`
  * https://www.faqforge.com/linux/how-to-open-winmail-dat-files-on-ubuntu-or-debian-linux/
* Get IP addresses
  * Internal: `ip address`
  * External: `curl http://ipecho.net/plain; echo`
* Measure script execution time
  * `time (sleep 1 ; sleep 1)`
  * https://askubuntu.com/questions/53444/how-can-i-measure-the-execution-time-of-a-terminal-process
* Check the md5sum of a directory
  * `rm -f md5checksums ; find -type f ! -iname "md5checksums" -exec md5sum "{}" + > md5checksums`
  * `md5sum -c md5checksums`
  * https://askubuntu.com/questions/781238/how-to-check-the-md5sum-and-sha256sum-of-a-directory-an-entire-folder
* Create and extract a .tar.gz archive
  * `tar -zcvf archive.tar.gz source-directory`
  * `tar -zxvf archive.tar.gz -C target-directory`
  * http://www.zyxware.com/articles/2009/02/26/how-to-create-and-extract-a-tar-gz-archive-using-command-line

---

# Instructions

### Restoring an USB flash drive to its original state
* https://www.pendrivelinux.com/restoring-your-usb-key-partition/
  ```
  $ lsblk
  $ sudo fdisk -l
  $ sudo fdisk /dev/sdb
  ...
  ```

---

# Install/uninstall SW on Debian 9

### AWS Command Line Interface (CLI)
* http://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html
  ```
  $ sudo apt install python-pip
  $ pip install awscli --upgrade --user
  $ cat >> ~/.profile

  # set PATH so it includes user's private .local/bin if it exists
  if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
  fi
  <CTRL-D>
  $ cat >> ~/.bashrc

  # AWS command completion
  if [ -f "$HOME/.local/bin/aws_completer" ] ; then
      complete -C "$HOME/.local/bin/aws_completer" aws
  fi
  <CTRL-D>
  $ source ~/.profile
  $ source ~/.bashrc
  ```

### Beyond Compare
* https://www.scootersoftware.com/download.php?zz=kb_linux_install
  ```
  $ wget http://www.scootersoftware.com/bcompare-4.2.2.22384_amd64.deb
  $ sudo apt update
  $ sudo apt install gdebi-core
  $ sudo gdebi bcompare-4.2.2.22384_amd64.deb
  ```

### Google Chrome
* http://forums.debian.net/viewtopic.php?f=10&t=131432
  ```
  $ sudo nano /etc/apt/sources.list.d/google-chrome.list
  deb http://dl.google.com/linux/chrome/deb/ stable main
  $ wget https://dl-ssl.google.com/linux/linux_signing_key.pub
  $ sudo apt-key add linux_signing_key.pub
  $ sudo apt install google-chrome-stable
  ```

### KDE Accessible
* https://forum.kde.org/viewtopic.php?f=67&t=108492#
  ```
  $ sudo apt purge kaccessible
  ```

### Node.js
* https://nodejs.org/en/download/package-manager/
  ```
  $ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  $ sudo apt install nodejs
  ```
