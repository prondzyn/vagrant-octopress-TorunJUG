#!/usr/bin/env bash
HOME="/home/vagrant"
RUBY_VERSION="1.9.3-p0"
TIMEZONE="Europe/Warsaw"

# most of the below configuration is connected with Octopress setup process which is described on http://octopress.org/docs/setup/ so I will describe only rest of the configuration

# virtual machine timezone settings
echo $TIMEZONE | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

sudo apt-get install -y git make

git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.profile
echo 'eval "$(rbenv init -)"' >> $HOME/.profile
# setting up language and encoding to help Ruby handling various weird characters
echo 'export LC_ALL=en_US.UTF-8' >> $HOME/.profile
echo 'export LANG=en_US.UTF-8' >> $HOME/.profile

git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build

$HOME/.rbenv/bin/rbenv install $RUBY_VERSION
$HOME/.rbenv/bin/rbenv local $RUBY_VERSION

sudo chown -Rf vagrant $HOME/.rbenv

# bundler suggests to do not run it as root, because it won't work properly
sudo su - vagrant -c "rbenv rehash && cd $HOME/octopress/ && gem install bundler"
sudo su - vagrant -c "cd $HOME/octopress/ && bundle install"

rm "$HOME/postinstall.sh"

echo "alias preview='cd $HOME/octopress; rake preview'" >> $HOME/.bashrc
echo "alias generate='cd $HOME/octopress; rake generate'" >> $HOME/.bashrc
echo "alias deploy='cd $HOME/octopress; rake deploy'" >> $HOME/.bashrc
