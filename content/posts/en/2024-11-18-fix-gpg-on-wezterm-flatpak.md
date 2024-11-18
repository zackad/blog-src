---
title: "How to Fix GPG decrypt on Wezterm intalled via Flatpak"
date: 2024-11-18T21:08:11+07:00
tags: [linux]
---

## Problem
When I try to decrypt my password from [password-store](https://www.passwordstore.org/), I got following error.
```shell
$ pass zackad/bitwarden -c
gpg: public key decryption failed: No such device or address
gpg: decryption failed: No such device or address
```

I though that my gpg setup is broken. It turn out the terminal I install (wezterm) via flatpak cannot acces `/dev/tty` or something similar. When I run command `tty` on the terminal it give me error.
```shell
$ tty
not a tty
```

This is the default permission for wezterm installed via flatpak.
```shell
$ flatpak info --show-permissions org.wezfurlong.wezterm
[Context]
shared=network;ipc;
sockets=x11;wayland;fallback-x11;
devices=dri;
filesystems=home:ro;xdg-config/wezterm;

[Session Bus Policy]
org.freedesktop.Flatpak=talk
org.freedesktop.Notifications=talk
```
The device it can access is limited to only `dri` ([see here for more info](https://docs.flatpak.org/en/latest/sandbox-permissions.html#device-access))

## Solution
```shell
# grant access to application
$ flatpak override --user org.wezfurlong.wezterm --device=all
```
`--user` option only be needed if you install application as user (not system wide).
