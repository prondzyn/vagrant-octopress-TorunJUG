vagrant-octopress-TorunJUG
==========================

[Vagrant](https://www.vagrantup.com) setup files for blogging with [Octopress](http://octopress.org) which I'm using to manage [Toruń JUG](http://torun.jug.pl) site.

With a few small modifications it can be applied to any site based on Octopress project. 

I wrote a little about this topic in Polish on my [blog](http://prondzyn.com/2014/12/05/przygotowanie-vagranta-do-blogowania-z-octopressem/).

### How to run your Octopress project on Vagrant
1. [Install Virtual Box](https://www.virtualbox.org/wiki/Downloads)
2. [Install Vagrant](https://docs.vagrantup.com/v2/installation/)
3. Clone this repository 
4. Modify the Vagrant file so that your Octopress folder is referenced `config.vm.synced_folder "../../../TorunJUG.github.io", "/home/vagrant/octopress", create: false`
5. `vagrant up`
6. `vagrant ssh`
7. `cd octopress`
8. `rake generate` 
9. `rake preview`
10. Open your favourite browser at [http://localhost:4000](http://localhost:4000) to preview your page
11. Have fun! :)

### Credits

This configuration is based on: [ryanlanciaux/octopress-vagrant](https://github.com/ryanlanciaux/octopress-vagrant)
