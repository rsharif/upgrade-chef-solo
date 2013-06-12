Put in the cookbooks folder for your vagrant and include it like 

Vagrant.configure("2") do |config|

	config.vm.define :node_name do |node_name|
	    node_name.vm.box = "centos6.3"
		node_name.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
		node_name.vm.network :private_network, ip: "192.168.50.3"


		node_name.vm.provision :chef_solo do |chef|
		  	chef.add_recipe "chef_upgrade"					
		end
		
		node_name.vm.provision :chef_solo do |chef|
			chef.add_recipe "java::oracle"
			chef.add_recipe "cassandra"			
		end
	end
	
end