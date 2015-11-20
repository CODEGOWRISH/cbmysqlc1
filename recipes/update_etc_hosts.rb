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

  echo '127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4' > '#{hostsFile}'
  echo #{node[:node1][:ip]}  #{node[:node1][:hostName]} >> '#{hostsFile}'
  echo #{node[:node2][:ip]}  #{node[:node2][:hostName]} >> '#{hostsFile}'
  echo '::1         localhost localhost.localdomain localhost6 localhost6.localdomain6' >> '#{hostsFile}'

  EOH

end