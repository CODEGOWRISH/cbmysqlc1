# -*- mode: ruby -*-
# vi: set ft=ruby :

#
#  MYSQL MULTI-NODE CLUSTER

#--------------------
#
# Items to cover
#
# box(es)
# host name(s)
# network
# shared folders
# chef omnibus install
# recipes to call
#
#--------------------

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

# Vagrant version
Vagrant.require_version '>= 1.5.0'


# CONFIGURATION - START

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #  ------  GLOBAL SETTINGS BEGIN ------
  #  These will apply for all servers created by this file
  #

  # Box
  config.vm.box = 'oracle-oel65-64'
  config.vm.box_url = 'https://storage.us2.oraclecloud.com/v1/istoilis-istoilis/vagrant/oel65-64.box'
  config.ssh.password = 'vagrant'
  
  # Box override  if using vmware_fusion
  config.vm.provider "vmware_fusion" do |v, override|
    override.vm.box = 'bento/ubuntu-14.04'
  end

  # Shared folders
  #config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
  #config.vm.synced_folder "../data", "/vagrant_data"

  #  ------  GLOBAL SETTINGS END ------
  #

  #  ------  SERVER DEFINITIONS BEGIN  -----------------
  #  Specify for either provider - will pickup whatever is relevant in the environment


   # Begin mysqlc1n1

     # Begin mysqlc1n1
    config.vm.define "mysqlc1n1" do |mysqlc1n1|

      # hostname
      mysqlc1n1.vm.hostname = "mysqlc1n1"

      # customization syntax for vmware 
      mysqlc1n1.vm.provider "vmware_fusion" do |v|
          v.vmx["numvcpus"] = "1"
          v.vmx["memsize"] = "512"
      end
   
      # customization syntax for virtualbox
      mysqlc1n1.vm.provider "virtualbox" do |v|
          v.customize [ "modifyvm", :id, "--cpus", "1" ]
          v.customize [ "modifyvm", :id, "--memory", "512" ]
      end

      # Network
      #mysqlc1n1.vm.network "private_network", ip: "192.168.205.10"
      mysqlc1n1.vm.network "private_network", ip: "192.168.65.21", virtualbox__intnet: true

      # Provisioning steps

      # Shell provisioner
      #mysqlc1n1.vm.provision :shell, inline: 'echo mysqlc1n1 shell provision echo'

      # Chef provisioner --> already version 11 is on Oracle's vagrant box
      #mysqlc1n1.omnibus.chef_version = '12.0.4'

      mysqlc1n1.vm.provision :chef_solo do |chef|
        chef.run_list = [
        'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::install_cluster_software]','recipe[cbmysqlc1::create_mysql_config_files]', 'recipe[cbmysqlc1::start_cluster_processes]'
        #'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::create_mysql_config_files]','recipe[cbmysqlc1::start_cluster_processes]'
        #'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::install_cluster_software]','recipe[cbmysqlc1::create_mysql_config_files]'

        ]
      end

    end

   # End mysqlc1n1

   # Begin mysqlc1n2
    config.vm.define "mysqlc1n2" do |mysqlc1n2|
      mysqlc1n2.vm.hostname = "mysqlc1n2"
   
      mysqlc1n2.vm.provider "vmware_fusion" do |v|
          v.vmx["numvcpus"] = "1"
          v.vmx["memsize"] = "512"
      end
   
      mysqlc1n2.vm.provider "virtualbox" do |v|
          #v.customize [ "modifyvm", :id, "--cpus", "1" ]
          #v.customize [ "modifyvm", :id, "--memory", "512" ]

          v.cpus = "1"
          v.memory = "768"
      end

      # Network
      mysqlc1n2.vm.network "private_network", ip: "192.168.65.22", virtualbox__intnet: true

      # Provisioning steps

      # Shell provisioner
      #mysqlc1n2.vm.provision :shell, inline: 'echo mysqlc1n2 shell provision echo'

      # Chef provisioner --> already version 11 is on Oracle's vagrant box
      #mysqlc1n2.omnibus.chef_version = '12.0.4' 

      mysqlc1n2.vm.provision :chef_solo do |chef|
        chef.run_list = [
        'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::install_cluster_software]','recipe[cbmysqlc1::create_mysql_config_files]', 'recipe[cbmysqlc1::start_cluster_processes]'
        #'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::create_mysql_config_files]','recipe[cbmysqlc1::start_cluster_processes]'
        #'recipe[cbmysqlc1::default]','recipe[cbmysqlc1::update_etc_hosts]','recipe[cbmysqlc1::install_cluster_software]','recipe[cbmysqlc1::create_mysql_config_files]'

      ]
      end     

    end
    # End mysqlc1n2

    #  ------  SERVER DEFINITIONS END  -----------------

end  
# CONFIGURATION - END



