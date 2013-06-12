To upgrade the chef solo version , use two provisioners like shown below. First provisioner upgrades the chef-solo version and second provisioner will then use the updgraded chef solo.
### Put this cookbook in your cookbooks path for vagrant, by default vagrant will search in cookbooks folder in the same directory as Vagrant file###

```ruby
Vagrant.configure("2") do |config|
	config.vm.define :node_name do |node_name|
	    node_name.vm.box = "centos6.3"
		node_name.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"


		node_name.vm.provision :chef_solo do |chef|
		  	chef.add_recipe "chef_upgrade"					
		end
		
		node_name.vm.provision :chef_solo do |chef|
			chef.add_recipe "java::oracle"
			chef.add_recipe "cassandra"			
		end
	end	
end
```
