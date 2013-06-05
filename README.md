# Automate Devstack install

Project allow automated creation of a VM with [devstack](http://www.devstack.org) 
installed and running. It uses vagrant to create the VM and pupet to configure 
the VM. 

## Requires

* Install [VirtualBox](http://virtualbox.org).
* Install [vagrant](http://vagrantup.com)

## Install 

* Clone repository 
* `cd vagrant.devstack`
* `git submodule init`
* `get submodule udpate`
* `vagrant up`