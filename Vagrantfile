# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.provision :shell, :path => "init/bootstrap.sh"

  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.ssh.forward_agent = true

  config.vm.synced_folder "../../../TorunJUG.github.io", "/home/vagrant/octopress", create: false

  config.vm.provider :virtualbox do |vb|

    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

    vb.customize ["modifyvm", :id, "--memory", 1024]
    vb.customize ["modifyvm", :id, "--cpus", 2]

    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end
