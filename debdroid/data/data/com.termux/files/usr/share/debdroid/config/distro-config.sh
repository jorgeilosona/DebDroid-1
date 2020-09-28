#!/bin/bash
### Prepare the system for post-installation
### Things to do:
### 1. Update and Upgrade the system
### 2. Install Necessary Packages
### 3. Configure User Accounts
### 4. Add the user to sudoers file
### 5. Clean up.
set -e -u

## Install Packages
apt update &&
apt upgrade -y &&
apt install xterm nano sudo busybox udisks2 -y &&
apt autoremove -y
apt clean

## Configure udisks2 as if udisks2 interrupts apt
echo ""
echo "Configuring Udisks2.... "
echo "" > /var/lib/dpkg/info/udisks2.postinst
dpkg --configure -a

## Setup User Accounts
echo "Configuring User Accounts.... "
read -p "Enter your UNIX username (adduser): " username
adduser $username
echo "Adding the user to sudoers.d file"
echo "$username ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$username
echo "$username" > /etc/userinfo.rc
