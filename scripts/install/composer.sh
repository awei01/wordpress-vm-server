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
HOME_FOLDER=/home/vagrant

if [ ! -d $HOME_FOLDER ]; then
	echo "The home directory [ $HOME_FOLDER ] does not exist"
	return 2>/dev/null || exit 1
fi

ALIAS_FILE=$HOME_FOLDER/.bash_aliases
if [ ! -f $ALIAS_FILE ]; then
	sudo -u vagrant touch "$ALIAS_FILE"
	echo "Created [ $ALIAS_FILE ]"
fi

ALIAS="alias composer=/usr/local/bin/composer.phar"
if grep -Fxq "$ALIAS" $ALIAS_FILE; then
	echo 'Alias for [composer] already exists'
else
	sudo -u vagrant echo $ALIAS >> "$ALIAS_FILE"
	# source "$ALIAS_FILE"
	echo 'Added [composer] alias'
fi
