---
title: "Store Steam Library on Nas Server"
date: 2022-09-25T22:19:41+07:00
tags: [linux, gaming, troubleshoot]
---

By default steam library will be installed to your home directory when installed on linux. Unfortunately my drive only 128GB, not enough to install most AAA title. Fortunately I have NAS server with large storage. It would be nice to put game library on this server. That way I can share it between linux and windows (hopefully).

## How To

- Create NFS share on your NAS. This is an example of my configuration. It can only be accessed from ip address `192.168.88.10` (my desktop pc).
```
"/mnt/md0/games" 192.168.88.10(rw,async,insecure,no_subtree_check,no_root_squash)
```
- Mount your NFS share into local directory. You can use `mount` command or add entry on your `/etc/fstab`
```
# /etc/fstab
# ...
192.168.88.2:/mnt/md0/games	/home/zackad/Games	nfs	defaults,noatime,users,exec	0	0
```
- Make sure that you add `exec` at the end of option, otherwise steam will complain about your mount missing execute permission
- Open steam Settings -> Downloads -> Steam Library Folder

![Steam Settings](/assets/images/steam_setting.png)
- Click '+' button to add library folder

![Add library folder](/assets/images/steam_storage-manager.png)
- Select 'Let me choose another location'

![Select location](/assets/images/steam_add-library.png)
- Choose your folder to store steam library. Make sure that folder you choose is empty.

![Select forlder](/assets/images/steam_select-directory.png)
- Now you can use this new library to store your game or application
