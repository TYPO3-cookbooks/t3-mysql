include_recipe "mysql::server"

resources("template[#{node['mysql']['conf_dir']}/my.cnf]").cookbook "t3-mysql"