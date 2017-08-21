# Wordpress Virtual Machine

This repository seeks to provide a simple way to create development environments for Wordpress sites and allow for an easy deployment of the application.

This repository is based off of the following:
* https://github.com/awei01/version-controlled-wordpress
* https://github.com/awei01/web-server

## Requirements

* Install [Vagrant](http://www.vagrantup.com)
* Install [VirtualBox](https://www.virtualbox.org/)

## Instructions

* Clone this repository into a folder: `git clone <repo url> <folder path>`
* Enter the `vm` folder: `cd <folder path>/vm`
* Fire up Vagrant: `vagrant up`
* SSH into Vagrant: `vagrant ssh`

### From VM command line

* Ensure scripts are executable: `sudo chmod -R +x /vagrant/scripts`
* Provision the VM: `. /vagrant/scripts/provision.sh`
* Enter the `site` folder (linked to `/srv`): `cd /srv`
* Install composer dependencies: `composer install`
* Copy and edit the `.env.sample` to `.env`: `cp .env.sample .env`
* Copy and edit the apache config file: `cp server/apache.example.conf server/apache.dev.conf`
* Symbolic link your apache config file so apache will use it: `sudo ln -s /srv/server/apache.dev.conf /etc/apache2/sites-enabled/apache.dev.conf`
* Restart apache: `sudo service apache2 restart`

## Source control

After initial set up, it's a good idea to get the `site` folder (or `/srv` folder on VM) under source control.

* Create a new repository (you'll probably want a private repository)
* Go to the `site` folder: `cd path/to/site` (On VM, `cd /srv`)
* Initialize the folder: `git init`
* Add your remote url: `git remote add origin <repository url>`
* Stage all your files: `git add -A`
* Commit all files: `git commit -m "some meaningful commit message"
* Push your source code: `git push -u origin master`

## Notes
* The VM is pre-configured to use the ip address `192.168.168.168`. You may want to edit the `vm/Vagrantfile` to change the ip address. You also may want to edit your `/etc/hosts/` (or equivalent) to point your domain name to this ip address
