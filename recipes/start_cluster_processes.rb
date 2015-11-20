#---------------------------------------------------------------------------------------------------------------
# Author: Gowrish.Mallipattana
#
# Start mySQL cluster processes
#
#
# Management Server (ndb_mgmd) - Cluster server software only is needed
# => Node1
#
# Data Nodes (ndbd) - Cluster server software only is needed  
# => Node1 and Node2
#
#---------------------------------------------------------------------------------------------------------------

# Start ndb_mgmd and ndbd both on node1
configIniFile=node[:configIniFile]

#if #{node['hostname']} == #{node[:node1][:hostName]}
if node['hostname'] == node[:node1][:hostName]
  bash 'start cluster ndb_mgmd and ndbd' do
   user "root"
    code <<-EOH
      ndb_mgmd -f #{configIniFile} --initial > /tmp/ndb_mgmd_start.out 2>> /tmp/ndb_mgmd_start.out
      ndbd > /tmp/ndbd_start.out 2>> /tmp/ndbd_start.out
    EOH
  end
end

# Start ndbd and mysqld on node2
#if #{node['hostname']} == #{node[:node2][:hostName]}
if node['hostname'] == node[:node2][:hostName]
 bash 'start ndbd' do
    user "root"
    code <<-EOH
      ndbd > /tmp/ndbd_start.out 2>> /tmp/ndbd_start.out
    EOH
 end

 bash 'start mysqld' do
    user "root"
    code <<-EOH
      /etc/init.d/mysql start  > /tmp/mysqld_start.out 2>> /tmp/mysqld_start.out
    EOH
 end
end