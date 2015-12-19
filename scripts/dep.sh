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
