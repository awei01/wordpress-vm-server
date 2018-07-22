#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Clean up apt-get
|--------------------------

STOP

sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean
