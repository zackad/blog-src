---
layout: post
title: Re-Installing TerraMaster OS (TOS) After It Broke
date: 2021-12-06T11:13:00+0700
tags: [linux, server]
---

## Why?

After I update TerraMaster OS (TOS), I'm also installing some application that unfortunately got stuck on 50% progress for a long time. The application I want to install are Transmission (bittorent client) and Aria2 (multi protocol download client). Both of them got stuck at 50% progress. With no option to cancel installation process and getting impatient, I decide to reboot my server and all of sudden I can no longer able to access my server. Accessing web control panel got connection refused, accessing ssh also refused.

At this point my conclusion is that I need to factory reset my server. But wait, it doesn't has reset button and I can't even access it via ssh. The answer is by re-installing the operating system (TOS) itself.

## Before You Start

- Read the documentation/user manual
- Find out if other user has similar problem
- Don't hesitate to ask for help in the internet forum or customer service
- Backup your data if possible

My first step of re-installing TOS is find out how to do it, and why other people do it in the first place. I found [this thread](https://forum.terra-master.com/en/viewtopic.php?t=931) that someone broke their system after rebooting the server. Similar enough for me. In my case, it might caused by incomplete installation process and make my system corrupt.

My biggest fear is that I might lose all the data stored on the hard drive if I re-install the TOS. Thanks to this [post](https://forum.terra-master.com/en/viewtopic.php?t=931#p4607) I feel a bit relieved knowing that I won't lose data unless I re-format by drive.

## Problem Along The Way

Following [guide](https://forum.terra-master.com/en/viewtopic.php?t=931#p4607) from the user support, I tried to re-install TOS using online installer. I tried this several times but the server is NOT rebooting. Usually after installing the OS it will immediately reboot and start the initialization step. No matter how many times I tried, it still refused to reboot.

Ok, online installation is not working. Maybe offline installation method might work. I download the latest version of TOS from [download center](https://support.terra-master.com/download/packages?product=F4-210) page (the latest version of TOS when I write this is version 4.2.17) and install it using offline installation method. Same problem, it stuck after installation progress and not rebooting. Maybe older version of TOS might work? So I download and install the previous version of TOS (4.1.xx) and now it reboot after installation process which is a good sign.

After following initialization step, the server do some system check and rebooting once more. Now the server work fine as intended with all my data still intact. I lose some modification that I make via ssh but that's ok. I can re-configure it later.

## How?

This is the step I do when installing TOS:

- Power down the server, unfortunately it doesn't have reset button. Pressing down power button for several seconds also not make the server turned off. My solution is just unplug the power cable
- Unplug all the hard drive
- Turn on the server
- Access server using web interface, you might need to find out what ip address your server is using whatever method you're comfortable with. In my case, I asign it static ip address in my router
- It wiil prompt you that there is no hard drive attached to the server, keep your server turn on and attach the hard drive. If you have several hard drive, just attach the first one
- Click start to begin installation process
- After some disk checking, the installation will begin. Select "Install new TOS"
- Select "Manual Installation" and browse installation package that have been downloaded
- After installation process is done, it wiil reboot and start initialization prcess
- Set your username, password and other thing
- Server will do some self diagnose and fixing itself
- Check if everything is working and your data is safe
- Now you can re-attach your other drive
- You might need to reboot in order for other drives to be mounted properly

## Conclusion

If going forward is not working, maybe step back a little will do the trick. Using newer version of software usually is a good thing but sometimes older version is more reliable.
