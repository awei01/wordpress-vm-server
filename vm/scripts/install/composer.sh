#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Install Composer
|--------------------------

STOP

# install composer if it's not already there
FOLDER=/usr/local/bin/
if [ -f $FOLDER/composer.phar ]; then
	echo 'Composer already installed'
else
	echo 'Installing...'
	curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=$FOLDER
fi

# see if we're on a vagrant box and determine the home file
FOLDER=/home/superuser
getent passwd vagrant >/dev/null 2>&1 && {
	FOLDER=/home/vagrant
}

if [ ! -d $FOLDER ]; then
	echo "The home directory [ $FOLDER ] does not exist"
	return 2>/dev/null || exit 1
fi

FILE=$FOLDER/.bash_aliases
if [ ! -f $FILE ]; then
	echo "Creating [ $FILE ]"
	touch $FILE
fi

ALIAS="alias composer=/usr/local/bin/composer.phar"
if grep -Fxq "$ALIAS" $FILE; then
	echo 'Alias for [composer] already exists'
else
	echo $ALIAS >> ~/.bash_aliases
	source ~/.bash_aliases
fi
