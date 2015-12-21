#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl

# You can install anything you need here.
# Install apt packages
# Install git-core
apt-get install -y git-core
# gpg for rvm
apt-get install -y gnupg
# Python2
apt-get install -y python
# Build packages
apt-get install -y build-essential libssl-dev
# g++ and clang
apt-get install -y g++-4.8

# Creates the user bossjs
# Create user
sudo adduser --disabled-password --gecos "" bossjs
# Set shell to bash
# chsh -u bossjs -s /bin/bash
# Create ssh key
ssh-keygen -b 1024 -f bossjs -t dsa
sudo mkdir -p /home/bossjs/.ssh
cat bossjs.pub | sudo tee -a /home/bossjs/.ssh/authorized_keys
sudo chmod 0600 /home/bossjs/.ssh/authorized_keys
sudo chmod 0700 /home/bossjs/.ssh
sudo chown -R bossjs /home/bossjs

# Install languages
# pip
python get-pip.py
# Virtual env
pip install virtualenv
# nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | NVM_DIR="/home/bossjs/.nvm" bash
# Install stable
nvm install stable
# Install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
sudo rvm install ruby-head --binary
# Install bundle
gem install bundle
# Done!

# add env vars
echo "export CXX=g++-4.8" >> /home/bossjs/.bashrc
# add use to shell
echo "source ~/.nvm/nvm.sh" >> /home/bossjs/.bashrc
echo "nvm use stable" >> /home/bossjs/.bashrc
