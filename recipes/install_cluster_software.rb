#
# Install mySQL cluster software
#
#
# Management Server (ndb_mgmd) - Cluster server software only is needed
# => Node1
#
# Data Nodes (ndbd) - Cluster server software only is needed  
# => Node1 and Node2
#
# SQL Nodes (mysqld - the mysqld with NDB support) - Cluster server and mysql client software are needed 
# => Node2
#
#---------------------------------------------------------------------------------------------------------------

# Install Server software on both node1 and node2
bash 'install cluster software' do
  user "root"
  code <<-EOH
    rpm -Uhv --force #{node[:softwareFolder]}/#{node[:serverRPM]} > #{node[:serverInstallLog]} 2>> #{node[:serverInstallLog]}
  EOH
end

# Install Client software only on node2
#if #{node['hostname']} == #{node[:node2][:hostName]}
 if node['hostname'] == node[:node2][:hostName]
 bash 'install client software' do
    user "root"
    code <<-EOH
      rpm -Uhv --force #{node[:softwareFolder]}/#{node[:clientRPM]} > #{node[:clientInstallLog]} 2>> #{node[:clientInstallLog]}
    EOH
 end
end
