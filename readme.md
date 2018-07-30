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
* Enter the folder: `cd <folder path>`
* Fire up Vagrant: `vagrant up`
* Browse to the server: http://192.168.168.168
* You should have a fresh copy of Wordpress running

## Notes
* The VM is pre-configured to use the ip address `192.168.168.168`. You may want to edit the `Vagrantfile` to change the ip address. You also may want to edit your `/etc/hosts/` (or equivalent) to point your domain name to this ip address

## Gotchas

On Windows, the new line characters are corrupted. Not sure how to prevent this. But the workaround is to SSH into the VM and then re-clone this repository and run the scripts folder. I've added `.gitattributes` to try to fix this.
