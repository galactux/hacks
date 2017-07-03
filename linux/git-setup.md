# Git setup

### Update global Git configuration file
```
$ git config --global user.name "<accountname>"
$ git config --global user.email "<email>"
$ git config --global core.autocrlf input
$ git config --global push.default simple
```
* (Windows: `$ git config --global core.autocrlf true`)
* Check: `$ git config --global --list`

### Set up SSH for Git
* Set up the default identity (use passphrase)
```
  $ ssh-keygen
  $ ls -al ~/.ssh
```
* Check that the ssh-agent is running: `$ ps -e | grep [s]sh-agent`
* Load the new identity into the ssh-agent: `$ ssh-add ~/.ssh/id_rsa`
* List the keys that the agent is managing: `$ ssh-add -l`
* Install the public key (`~/.ssh/id_rsa.pub`) on your GitHub/Bitbucket/whatever account (Web UI)
* If needed, change an existing repo from HTTPS to the SSH protocol
```
$ cd <path_to_repo>
$ cat .git/config
...
[remote "origin"]
	url = https://github.com/<accountname>/<reponame>.git
=>
	url = git@github.com:<accountname>/<reponame>.git
```
* Check: `$ git config --local --list`

### Get started with an existing project
```
$ cd <path_to_repo>
$ git remote add origin git@github.com:<accountname>/<reponame>.git
$ git push -u origin master
```

### Start from scratch
```
$ git clone git@github.com:<accountname>/<reponame>.git
$ cd <reponame>
$ echo "# My project's README" >> README.md
$ git add README.md
$ git commit -m "Initial commit"
$ git push -u origin master
```
