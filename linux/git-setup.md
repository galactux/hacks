# Git and Atom setup (Debian 9)

### Update global Git configuration file
```
$ git config --global core.autocrlf input
$ git config --global core.editor "atom --wait"
$ git config --global push.default simple
$ git config --global diff.tool bc
$ git config --global difftool.prompt false
$ git config --global difftool.bc trustExitCode true
$ git config --global merge.tool bc
$ git config --global mergetool.bc trustExitCode true
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

### Using Beyond Compare
* http://www.chadly.net/2014/05/configuring-beyond-compare-with-git/
  ```
  $ git difftool path/to/file
  $ git difftool --dir-diff
  $ git mergetool
  ```
---
# Atom (https://atom.io/) setup
* http://flight-manual.atom.io/getting-started/sections/installing-atom/
  ```
  $ sudo dpkg -i atom-amd64.deb
  $ sudo apt -f install
  $ apm install \
  editorconfig \
  git-plus \
  prettier-atom
  ```
* Configuration:
  ```
  $ cat ~/.atom/config.cson
  "*":
    core:
      disabledPackages: [
        "welcome"
        "whitespace"
      ]
      telemetryConsent: "no"
      themes: [
        "atom-dark-ui"
        "base16-tomorrow-dark-theme"
      ]
    editor:
      autoIndentOnPaste: false
      fontSize: 12
      showInvisibles: true
    "exception-reporting":
      userId: "********"
    "markdown-preview":
      useGitHubStyle: true
    "prettier-atom":
      formatOnSaveOptions:
        enabled: true
        showInStatusBar: true
    welcome:
      showOnStartup: false
    ```
