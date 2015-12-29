# generate the password
::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['mysql']['server_root_password']   = secure_password
node.set_unless['mysql']['server_repl_password']   = secure_password
node.set_unless['mysql']['server_debian_password'] = secure_password

mysql_service "default" do
  version node['mysql']['version']
  port node['mysql']['port']
  data_dir node['mysql']['data_dir']
  server_root_password node['mysql']['server_root_password']
  server_debian_password node['mysql']['server_debian_password']
  server_repl_password node['mysql']['server_repl_password']
  allow_remote_root node['mysql']['allow_remote_root']
  remove_anonymous_users node['mysql']['remove_anonymous_users']
  remove_test_database node['mysql']['remove_test_database']
  root_network_acl node['mysql']['root_network_acl']
  package_version node['mysql']['server_package_version']
  package_action node['mysql']['server_package_action']
  enable_utf8 node['mysql']['enable_utf8']
  action :create
end

# For some reason, notifying mysql_service[default] does not work (reports "up to date")
# and does not restart the service (in mysql cookbook version 5.6.3).
# Therefore, we redeclare service[mysql] to be able to notify it.
service "mysql" do
  supports [:start, :stop, :reload, :restart]
  action [:start, :enable]
end

template "/etc/mysql/conf.d/server-tuning.cnf" do
  owner "mysql"
  owner "mysql"
  source "tuning.cnf.erb"
  # notifies :restart,  "mysql_service[default]"
  notifies :restart,  "service[mysql]"
end