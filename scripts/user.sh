#!/bin/bash
# user.sh
# Creates the user bossjs
# Create user
sudo adduser --disabled-password --gecos "" bossjs
# Set shell to bash
# chsh -u bossjs -s /bin/bash
# Create ssh key
ssh-keygen -b 1024 -f bossjs -t dsa
sudo mkdir -p /home/bossjs/.ssh
cat bossjs.pub | sudo tee -a /home/bossjs/.ssh/authorized_keys
sudo chmod 600 /home/bossjs/.ssh/authorized_keys
sudo chmod 700 /home/bossjs/.ssh
sudo chown -R bossjs /home/bossjs
# add env vars
echo CXX=gcc-4.8 >> /home/bossjs/.bashrc
