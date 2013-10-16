# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "base-hadoop"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/547671/thinkstack-raring64.box"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base-hadoop.pp"
     puppet.module_path = "modules"
  end

  config.vm.define :backup do |backup_config|
    backup_config.vm.network :hostonly, "192.168.1.11"
    backup_config.vm.host_name = "backup"
  end
  
  config.vm.define :hadoop1 do |hadoop1_config|
    hadoop1_config.vm.network :hostonly, "192.168.1.12"
    hadoop1_config.vm.host_name = "hadoop1"
  end
  
   config.vm.define :master do |master_config|
    master_config.vm.network :hostonly, "192.168.1.10"
    master_config.vm.host_name = "master"
    master_config.vm.forward_port 50070, 50070
  end

end
