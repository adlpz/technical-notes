Keychain allows to have the ssh-agent information stored in a file,
so we can use it from scripts and such. Install keychain in CentOS
with:

sudo rpm --import http://wiki.psychotic.ninja/RPM-GPG-KEY-psychotic
sudo rpm -ivh http://packages.psychotic.ninja/7/base/x86_64/RPMS//psychotic-release-1.0.0-1.el7.psychotic.noarch.rpm
sudo yum --enablerepo=psychotic install keychain

We have to add to our profile script the initialization of keychain.
For example, on `.bash_profile`, add:

```
/usr/bin/keychain $HOME/.ssh/id_dsa
source $HOME/.keychain/$HOSTNAME-sh
```

Finally when running any shell script that needs ssh keys, put at
the beginning of it:

source $HOME/.keychain/$HOSTNAME-sh

