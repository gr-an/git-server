#!/bin/bash
#
echo ================== Installing Git =====================
# Installing git 
sudo apt install git -y 
# Adding  git user 
sudo adduser git 

# Creating repository directory for git 
sudo mkdir /usr/local/git

echo ================== Giving Ownership =================
# Changing the ownership of the directory to the git user
sudo chown git:git/usr/local/git

# Switching to the git user
su -l git 

echo ================== Init Git Repo ====================

git init –bare project.git

# SSH access configuration 
ssh-keygen -t rsa -b 4096
echo “ssh-rsa id_rsa.pub” >> ~/.ssh/authorized_keys
