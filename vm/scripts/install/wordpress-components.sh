#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Install Additional Components For Version Controlled Wordpress
|--------------------------

STOP

apt-get install subversion -y
apt-get install php5.6-mbstring -y
apt-get install php5.6-mcrypt -y
apt-get install php5.6-sqlite -y

