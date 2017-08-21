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
	apt-get install mysql-server -y
	mysql_install_db
	mysql_secure_installation
}
