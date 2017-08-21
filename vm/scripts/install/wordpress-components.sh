#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Install Additional Components For Version Controlled Wordpress
|--------------------------

STOP

sudo apt-get install subversion -y
sudo apt-get install php5.6-mbstring -y
sudo apt-get install php5.6-mcrypt -y
sudo apt-get install php5.6-sqlite -y

