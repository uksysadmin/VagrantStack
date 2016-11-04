#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y upgrade
apt-get -y install git 
git clone https://git.openstack.org/openstack-dev/devstack
mkdir -p /opt/stack/logs
sudo chown ubuntu /opt/stack/logs
sudo chown -R ubuntu devstack
cd devstack
cp /vagrant/local.conf .
sudo su -c ./stack.sh ubuntu
