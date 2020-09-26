# DebDroid
An Easy to use Debian Installer for Android without root

[![Discord](https://img.shields.io/discord/591914197219016707.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://bit.ly/WMCBDiscord)


# Features
* Support for Root and Non-root User Accounts
* Run your GUI Apps easily using VNC
* Full Debian Environment in your Pocket
* No Rooting Required
* Supports Desktop Environment (LXDE, LXQT, Mate, XFCE)

# Installation
Installation is quite easy. follow the steps shown below:

**Requirements:**
* Android Version <=7 (Android 10 is not tested)
* 1.5gb of free space
* Stable Internet Connection (The installation is sensitive to network failures)
* Termux (Latest Version is recommended)
* Root Disabled (Running as root will fail)

1.) On termux, Type the following: \
`pkg update -y`

2.) Download the [file](https://github.com/WMCB-Tech/DebDroid/releases/download/v2.10-rc1/debdroid-2.10-rc1.deb) and place it to sdcard.

3.) Install the package by typing: \
`apt install ./path/to/debdroid.deb` \
I assume that you placed the downloaded file to downloads folder

4.) Install additional Packages. (Without it. the container won't start) \
`apt install xorg-xhost tigervnc`

# Preparing The Container
After all packages is installed. you can install it by typing: \
```debdroid --install```

The Installation will take several minutes depending on your network connection

If it asks you to enter your UNIX Username. you can type your own username to add it to sudoers \
to gain access via sudo.

***Note:***
* Names should not contain any Capital Letters and special characters including spaces
* Names should not be used: \
 root, proc, dev, mail, sys and other linux reserved names as if the installation is sensitive,
 
 # Starting The Container
 You can start the container by typing: \
 ```debdroid --launch``` or ```debian --launch-su``` (as root user)
 
 and it should drop you to debian shell \
 You can connect to the GUI by connecting the VNC Port 5901 with Xterm (without any WM or DE) \
 If you have installed XFCE or Other Desktop environment. you can edit this file: \
 `/etc/profile.d/desktop-launch.sh`
 
 **It's not starting. and dosen't drop me to debian shell** \
 It's possible that you have another VNC Server is running at port 5901. you can close it or
 if you're using Termux VNC. type the command: \
 `debdroid-stop-server`
 
 The Reason why it won't start is to prevent the profile.d from multiplying at logon.
 
 To Shutdown the linux environment. simply type `exit` to debian shell \
 Note that it will kill all processes at exit. and stops VNC Server as well to prevent battery drainage
 
 # Uninstalling the Container
 Uninstalling is simple. simply type: \
 `debdroid --uninstall`
 
 Note that instead of asking you to delete it. you have 15 seconds before the removal so better to hit Ctrl-C before it's too late

# Stay In Touched?
[Discord](http://bit.ly/WMCBDiscord)
[Twitter](http://twitter.com/wmcbtech30)
[YouTube](https://www.youtube.com/wmcbtech)

Make an issue if you have problems regarding with this problems
