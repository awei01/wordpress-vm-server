#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Clean up apt-get
|--------------------------

STOP

apt-get autoremove
apt-get autoclean
apt-get clean
