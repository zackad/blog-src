---
layout: post
title: Reset USB Connection Without Un-pluging on Linux
date: 2022-05-16 17:26 +0700
tags: linux troubleshooting
---

I've been playing games on linux lately. Unfortunately most of them is windows game that I run using steam proton or wine. None of them has native support for linux and has some problem either when launching or terminating. In most cases I'm using either SIGKILL or SIGTERM to stop the process. Because of this ungracefull process ternimation my wireless xbox controller going _caput_ and refuse to re-connect. The solution is easy, just unplug and re-plug the usb wireless receiver.

The bad news is I'm pluging the receiver on the back of my pc and make it cumbersome to do. It would be great if we can just re-connect usb device without physically re-pluging the hardware. If you're using arch linux based distro there's AUR package that can do that, it's called `usbreset`.

Install with your favorite package manager
```shell
$ pamac build usbreset
```

Find out which usb device you want to reset
```shell
$ lsusb

# This is the list of connected usb devive
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 002: ID 045e:0719 Microsoft Corp. Xbox 360 Wireless Adapter
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 8087:0029 Intel Corp. AX200 Bluetooth
Bus 001 Device 002: ID 04d9:0180 Holtek Semiconductor, Inc. USB-HID Keyboard
Bus 001 Device 004: ID 18f8:0fc0 [Maxxter] USB GAMING MOUSE 
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

From output example above, the xbox wireless receiver on `Bus 003` and `Device 002`. Now we need to run command
```shell
$ usbreset /dev/bus/usb/003/002

# Will output something like this
Resetting USB device /dev/bus/usb/003/002
Reset successful
```

## Reference: 
- [https://askubuntu.com/a/661](https://askubuntu.com/a/661)
- [usbreset on AUR](https://aur.archlinux.org/packages/usbreset)
