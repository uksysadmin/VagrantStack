# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = {
    'devstack'	=> [1, 253],
}

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    #config.vm.box_url = "http://files.vagrantup.com/xenial64.box"

    #Default is 2200..something, but port 2200 is used by forescout NAC agent.
    config.vm.usable_port_range= 2800..2900 

    nodes.each do |prefix, (count, ip_start)|
        count.times do |i|
            hostname = "%s" % [prefix, (i+1)]

            config.vm.define "#{hostname}" do |box|
                box.vm.hostname = "#{hostname}.book"
                box.vm.network :private_network, ip: "172.16.0.#{ip_start+i}", :netmask => "255.255.0.0"
                #box.vm.network :private_network, ip: "10.10.0.#{ip_start+i}", :netmask => "255.255.0.0" 
		#box.vm.network :private_network, ip: "192.168.100.#{ip_start+i}", :netmask => "255.255.255.0" 

                box.vm.provision :shell, :path => "#{prefix}.sh"

                # If using Fusion
                box.vm.provider :vmware_fusion do |v|
                    v.vmx["memsize"] = 3172
                end

                # Otherwise using VirtualBox
                box.vm.provider :virtualbox do |vbox|
	            # Defaults
                    vbox.customize ["modifyvm", :id, "--memory", 3172]
                    vbox.customize ["modifyvm", :id, "--cpus", 2]
		    vbox.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
                end
            end
        end
    end
end
