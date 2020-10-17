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
apt update
apt upgrade -y
apt install nano sudo busybox udisks2 dbus-x11 locales -y
apt autoremove -y
apt clean

## Fix Problems
echo ""
echo "Exporting libgcc_s.so.1 as a walkaround for Tigervnc for pre-android 7 clients"
echo "export LD_PRELOAD=$(find /usr/lib -name libgcc_s.so.1)" > /etc/profile.d/walkaround.sh
echo "Adding /sbin path for non-root users"
echo "export PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin:/usr/games:/usr/local/games" > /etc/profile.d/sbin.sh

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
