#!/bin/bash
# packages.sh
# Install languages
# pip
python get-pip.py
# Virtual env
pip install virtualenv
# nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
# Install stable
nvm install stable
# add use to shell
echo "nvm use stable" >> #{bosshome_rc}
# Install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install ruby_head
# Install bundle
gem install bundle
# Done!
