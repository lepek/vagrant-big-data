# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "base-hadoop"
  config.vm.customize ["modifyvm", :id, "--memory", 1024, "--cpus", "1"]
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base-hadoop.pp"
     puppet.module_path = "modules"
  end
  
  config.vm.define :master do |master_config|
    master_config.vm.network :hostonly, "192.168.1.10"
    master_config.vm.host_name = "master"
    master_config.vm.forward_port 50070, 50070
  end

end
