# -*- mode: ruby -*-
# vi: set ft=ruby :

# configuration for second version of Vagrant
Vagrant.configure("2") do |config|
  # setting box (here we have Ubuntu 12.04 LTS 64-bit)
  config.vm.box = "hashicorp/precise64"

  # setting file for ssh provisioning (this file will be run on startup)
  config.vm.provision :shell, :path => "init/bootstrap.sh"

  # copying .gitconfig from local to virtual machine to have the same settings
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  # port forwarding (4000 is a default Jekyll's port)
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  # ssh agent forwarding (virtual machine will have access to our local ssh settings)
  config.ssh.forward_agent = true

  # syncing Octopress project folder to have access to it from the virtual machine
  config.vm.synced_folder "../../../TorunJUG.github.io", "/home/vagrant/octopress", create: false

  # configuration for VirtualBox provider
  config.vm.provider :virtualbox do |vb|

    #fix for issue with symbolic links in shared folders
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

    # memory settings
    vb.customize ["modifyvm", :id, "--memory", 1024]
    # CPU settings
    vb.customize ["modifyvm", :id, "--cpus", 2]

    # this two settings fixed my problem with network slowness between local and virtual machine
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end
