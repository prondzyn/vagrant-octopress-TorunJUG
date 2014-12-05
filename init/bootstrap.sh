#!/usr/bin/env bash
HOME="/home/vagrant"
RUBY_VERSION="1.9.3-p0"
TIMEZONE="Europe/Warsaw"

echo $TIMEZONE | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

sudo apt-get install -y git make

git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.profile
echo 'eval "$(rbenv init -)"' >> $HOME/.profile
echo 'export LC_ALL=en_US.UTF-8' >> $HOME/.profile
echo 'export LANG=en_US.UTF-8' >> $HOME/.profile

git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build

$HOME/.rbenv/bin/rbenv install $RUBY_VERSION
$HOME/.rbenv/bin/rbenv local $RUBY_VERSION

sudo chown -Rf vagrant $HOME/.rbenv

sudo su - vagrant -c "rbenv rehash && cd $HOME/octopress/ && gem install bundler"
sudo su - vagrant -c "cd $HOME/octopress/ && bundle install"