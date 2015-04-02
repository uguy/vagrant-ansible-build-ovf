# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false   
    # name is important since used to target the vm from VBoxManage tool
    vb.name = "funny-ubuntu-trusty-1.0.0"
  end
    
  config.vm.provision "ansible" do |ansible|  
    ansible.playbook = "ansible/playbook.yml"
    ansible.verbose = "v"
  end

end
