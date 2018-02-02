# Introduction

We start from a base CentOS 7 install

# Enable SSH Access

Add the keys from the KVM console

```mkdir .ssh```
```vim .ssh/authorized_keys```

Log in through SSH

# Initial server configuration

Update everything, install yum extensions

```yum update```
```yum install yum-utils```

Install the Inline with Upstream Stable which provides newer versions
for some software

```yum install https://centos7.iuscommunity.org/ius-release.rpm```

Create a SSH Key

```ssh-keygen -t rsa -b 4096 -C "infra@ydevs.com"```

# Install GIT

First install git

```apk add git```

You can then add the key generated before as a deploy key in whatever repos.
You can do this for every user in the system.

# Set up backup system

Install Python 3 (from IUS)

```yum install python36u python36u-pip```

Download the backup scripts (clone from git). Then download the python
dependencies. From the script directory:

```pip3.6 install -r requirements.txt```

Add the needed jobs to crontab. E.g.:

```0 */1 * * * cd /root/scripts/sistema-backups && python3.6 sync_backups.py -u proxmox 2>>/root/log/backup-proxmox.log
20 */1 * * * cd /root/scripts/sistema-backups && python3.6 sync_backups.py -u plesk-data 2>>/root/logs/backup-plesk-data.log
40 */1 * * * cd /root/scripts/sistema-backups && python3.6 sync_backups.py -u plesk-databases 2>>/root/logs/backup-plesk-databases.log```

# Set up logstash

We are going to run logstash inside a Docker container. Install docker

```yum install docker```

Change the docker configuration so the docker socket is owned by the `dockerroot` group. This is needed if we want normal
users to use docker.

Edit the `/etc/docker/daemon.json` file and add:

```
{
    "live-restore": true,
    "group": "dockerroot"
}
```
Then enable and start docker

```systemctl enable docker```
```systemctl start docker```

Donwload the logstash docker image

```docker pull docker.elastic.co/logstash/logstash:5.6.2```