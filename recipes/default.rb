

remote_file "/vagrant/upgrade_script" do
  source "https://www.opscode.com/chef/install.sh"
  owner 'root'
  group 'root'
  mode 00755
end

bash 'chef_upgrade' do
  cwd "/vagrant/"
  code <<-EOH
      bash upgrade_script
   EOH
end