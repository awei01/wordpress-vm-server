#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Install MySQL
|--------------------------

STOP

# install mysql if it isn't already installed
hash mysql 2>/dev/null 2>&1 && {
	echo 'MySQL already installled'
} || {
	echo 'Installing...'
	sudo apt-get install mysql-server -y
	sudo mysql_install_db
	sudo mysql_secure_installation
}
