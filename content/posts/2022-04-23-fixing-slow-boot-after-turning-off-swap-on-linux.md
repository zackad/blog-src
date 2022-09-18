---
layout: post
title: Fixing Slow Boot After Turning Off Swap on Linux
date: 2022-04-23 06:06 +0700
tags: linux
---

## Why Turning-off swap?
Most of the time I have terrible experience when using swap. Whenever I have Out Of Memory (OOM) error, my computer freeze and become unusable that I have to hard reset it. Other time when the swap is actively being used, it make my system become unstable and not responsive because the system trying to access data from the swap. It's a slow process that sometime require a few minutes before I can kill some applications to reclaim some memory.

## What The Problem Now?
Usually all we need to do to disable swap is simple turning it off with `sudo swapoff -a` and then remove swap entry from `/etc/fstab`. This will prevent swap partition to be mounted after reboot. Unfortunately this is not the case for me. After rebooting I notice that for some reason, my system trying to mount swap partition that I'm already removed from `/etc/fstab`. What makes it worst is that I've deleted the swap partition itself so I can't revert it. This will make my system become slower to boot because it will wait the swap partition to be mount before giving up after 10 seconds timeout.

## The Solution
After searching on the internet I don't find anything that will fix my problem. Most of the solution basically telling to disable swap with `sudo swappoff -a` and removing swap entry from `/etc/fstab` which I have already done. The others suggest to check `/etc/initfamfs-tools/conf.d/resume` (didn't exist in my system) and rebuild RAM disk with `sudo update-initramfs -u` (command not found in my system).

Fortunately it give me some hints where to look for. I suspect it has to do with grub, so I check `/etc/defaults/grub` and found this entry
```shell
GRUB_CMDLINE_LINUX_DEFAULT="amd_iommu=on iommu=pt mitigations=off apparmor=1 security=apparmor resume=UUID=2f391ed3-ca81-469e-a848-5d2b1b846b77 udev.log_priority=3"
```
Notice the `resume=UUID=xxxxx` part, this is the old swap partition uuid. So I just remove that part and update grup config with `sudo grub-mkconfig -b /boot/grub/grub.cfg` and then reboot.

And yes, it fix my problem of system trying to mount non existing partition and causing slower booting time.
