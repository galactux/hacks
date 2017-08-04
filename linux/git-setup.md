# Git and Atom setup (Debian 9)

### Update global Git configuration file
```
$ git config --global user.name "<accountname>"
$ git config --global user.email "<email>"
$ git config --global core.autocrlf input
$ git config --global core.editor "atom --wait"
$ git config --global push.default simple
```
* On Windows: `$ git config --global core.autocrlf true`
* Check (`~/.gitconfig`):
  ```
  $ git config --global --list
  ```

### Set up SSH for Git
* Set up the default identity (with passphrase):
  ```
    $ ssh-keygen
    $ ls -al ~/.ssh
  ```
* Install the public key (`~/.ssh/id_rsa.pub`) on the GitHub account (Web UI)
* Create another identity for Bitbucket:
  ```
  $ ssh-keygen -f ~/.ssh/bitbucketid -C "bitbucketid"
  ```
* Install the public key (`~/.ssh/bitbucketid.pub`) on the Bitbucket account (Web UI)
* Create SSH configuration file `~/.ssh/config`:
  ```
  # Default GitHub user
  Host github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa

  # Bitbucket user
  Host bitbucket.org
    HostName bitbucket.org
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/bitbucketid
  ```
* Ensure the ssh-agent is running and loaded with right keys, this needs to be done for every new terminal (after reboot)
  * If the agent isn't running (`$ ps -e | grep [s]sh-agent`), start it by hand (`$ eval ssh-agent $SHELL`)
  * List the currently loaded keys:
    ```
    $ ssh-add -l
    ```
  * Add key(s) to the list:
    ```
    $ ssh-add ~/.ssh/id_rsa
    ```
    and/or
    ```
    $ ssh-add ~/.ssh/bitbucketid
    ```

### Get started from scratch
```
$ git clone git@github.com:<accountname>/<reponame>.git
$ cd <reponame>
$ echo "# My project's README" >> README.md
$ git add README.md
$ git commit -m "Initial commit"
$ git push -u origin master
```

### Start with an existing workarea/project
```
$ cd <path_to_repo>
$ git init
$ git remote add origin git@github.com:<accountname>/<reponame>.git
$ git add --all
$ git commit -m "Initial commit"
$ git push -u origin master
```

### If needed, change an existing repo from HTTPS to the SSH protocol:
```
$ cd <path_to_repo>
$ cat .git/config

[remote "origin"]
	url = https://github.com/<accountname>/<reponame>.git
=>
	url = git@github.com:<accountname>/<reponame>.git
```
* Check:
  ```
  $ git config --local --list
  ```

---

# Atom setup

* https://stackoverflow.com/questions/24741996/how-to-upgrade-atom-editor-on-linux
  ```
  $ sudo add-apt-repository ppa:webupd8team/atom
  $ sudo apt update
  $ sudo apt install atom
  $ apm install \
  git-plus \
  markdown-preview-plus \
  split-diff
  ```
* If add-apt-repository fails to: `gpg: failed to start the dirmngr '/usr/bin/dirmngr': No such file or directory`, then install:
  ```
  $ sudo apt install dirmngr
  ```
* Check:
  ```
  $ cat ~/.atom/config.cson
  ```
