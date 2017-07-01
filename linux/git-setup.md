## Git setup

Update global Git configuration file:
```
$ git config --global user.name "<accountname>"
$ git config --global user.email "<email>"
$ git config --global core.autocrlf input
(Windows: $ git config --global core.autocrlf true)
$ git config --global push.default simple
```
Check:
```
$ git config --global --list
```
...

