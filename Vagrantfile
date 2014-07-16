# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
settings = YAML.load_file 'config.yaml'
webserver_ip_addresss = settings['webserver']['ip_address']
db_ip_address = settings['db']['ip_address']


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "puppetlabs/ubuntu-14.04-32-puppet"
  # config.vm.box = "jnj_dev_cell/precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  




  config.vm.define "db" do |db|
       db.vm.hostname = "db"
       db.vm.network :private_network, ip: db_ip_address

       db.vm.provision :puppet do |puppet|
         puppet.hiera_config_path = "puppet/hiera.yaml"
         puppet.manifests_path = "puppet/manifests"
         puppet.module_path = "puppet/modules"
         puppet.manifest_file  = "site.pp"
         puppet.options = "--verbose --debug"
      end
    end

  config.vm.define "webserver" do |webserver|
     webserver.vm.hostname = "webserver"
     webserver.vm.network :private_network, ip: webserver_ip_addresss


     webserver.vm.provision :puppet do |puppet|
       puppet.hiera_config_path = "puppet/hiera.yaml"
       puppet.manifests_path = "puppet/manifests"
       puppet.module_path = "puppet/modules"
       puppet.manifest_file  = "site.pp"
       puppet.options = "--verbose --debug"
    end
  end
end