#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Install Git
|--------------------------

STOP

# install git if it isn't already installed
hash git 2>/dev/null 2>&1 && {
	echo 'Git already installled'
} || {
	echo 'Installing...'
	apt-get install git -y
}
