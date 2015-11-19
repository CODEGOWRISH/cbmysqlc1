#
# Author: Gowrish.Mallipattana
#
# Update /etc/hosts with cluster node details
#
#


hostsFile=node[:hostsFile]

bash 'update etc hosts file' do
  user "root"
  
  code <<-EOH

  cp '#{hostsFile}' '#{hostsFile}.orig'
  echo #{node[:node1][:ip]}  #{node[:node1][:hostName]}  > '#{hostsFile}'
  echo #{node[:node2][:ip]}  #{node[:node2][:hostName]} >> '#{hostsFile}'

  EOH

end