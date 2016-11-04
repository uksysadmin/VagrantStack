VagrantDevStack
===============

Vagrant scripts to create a DevStack Private Cloud (http://www.devstack.org/) running under VirtualBox

Author :: Kevin Jackson @itarchitectkev kevin.jackson AT rackspace.co.uk

What you will need
==================
* A computer with at least 4Gb Ram
* VirtualBox (http://www.virtualbox.org/) Tested on 4.2.12 on Mac OSX
* Vagrant (http://www.vagrantup) Tested on 1.1.5 on Mac OSX


Instructions
============
	
	git clone https://github.com/uksysadmin/VagrantDevStack.git
	cd VagrantDevStack
	vagrant up
	vagrant ssh devstack
	sudo su
	cd devstack
	./stack.sh


Environment
===========

Network Interfaces
* eth0 (nat) / Default GW
* eth1 Data/Provider Network (where your SDN environment is)
* eth2 Host Network (where your VirtualBox hosts live)

Networks
* network: eth0 (nat), eth1 (Data), eth2 (172.16.0.253/16)

Interfaces
* Horizon: http://172.16.0.253/    username: admin | password: openstack

Accessing Nodes
===============
To access devstack virtual machine

	vagrant ssh devstack

Root access: 

	sudo -i


Using your Rackspace Private Cloud
==================================
Log into Horizon using: admin / openstack

Perform commands on controller:

	vagrant ssh devstack
	. openrc

Creating a network

	quantum net-create --provider:physical_network=ph-eth1 --provider:network_type=vlan --provider:segmentation_id=100 demoNet1

	quantum subnet-create --name demoSubnet1 demoNet1 10.0.0.0/24
# VagrantStack
