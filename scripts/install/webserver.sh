#!/usr/bin/env bash

cat <<STOP
|--------------------------
| Set up webserver
|--------------------------

STOP

APP_DIR=/srv/src
COMPOSER=/usr/local/bin/composer.phar
# install composer dependencies
sudo "$COMPOSER" install -d "$APP_DIR"

# fix permissions
sudo chown -R vagrant:vagrant $APP_DIR

# remove default site
APACHE_SITES_DIR=/etc/apache2/sites-enabled
sudo rm "$APACHE_SITES_DIR/000-default.conf"
# link the apache
sudo ln -s "$APP_DIR/server/apache.dev.conf" "$APACHE_SITES_DIR/apache.dev.conf"
# restart apache
sudo service apache2 restart
