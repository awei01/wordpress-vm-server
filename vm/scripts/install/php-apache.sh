#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Install PHP & Apache
|--------------------------

STOP

# install PHP & apache if they aren't installed
hash php 2>/dev/null 2>&1 && {
	echo 'PHP & Apache already installled'
} || {
	echo 'Installing...'
	sudo add-apt-repository ppa:ondrej/php -y
	sudo apt-get update
	sudo apt-get install php5.6 -y
	sudo apt-get install php5.6-curl -y
	sudo apt-get install php5.6-mcrypt -y
	sudo apt-get install php5.6-mysql -y
	sudo a2enmod rewrite
	RESTART=true
}

getent passwd vagrant >/dev/null 2>&1 || {
	# not a vagran box, just exit
	echo 'Leaving Apache environment file unchanged'
	return 2>/dev/null || exit 0
}

# this is a vagrant box, change the apache run user
ENVFILE=/etc/apache2/envvars
if [ ! -f $ENVFILE ]; then
	echo "Cannot locate Apache environment file [ $ENVFILE ]"
	return 2>/dev/null || exit 1
fi

USER='export APACHE_RUN_USER'
GROUP='export APACHE_RUN_GROUP'
HASUSER=$( grep "^$USER=www-data$" $ENVFILE )
HASGROUP=$( grep "^$GROUP=www-data$" $ENVFILE )

if [[ $HASUSER || $HASGROUP ]]; then
	echo 'Backing up and updating Apache environment file'
	cp $ENVFILE $ENVFILE.bak
	sed -i "s/^${HASUSER}$/${USER}=vagrant/g" $ENVFILE
	sed -i "s/^${HASGROUP}$/${GROUP}=vagrant/g" $ENVFILE

	echo 'Restarting Apache...'
	apachectl restart
fi
