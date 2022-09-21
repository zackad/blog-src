---
layout: post
title: How To Run Windows Game with Vanilla Wine on Linux
date: 2022-05-15 10:06 +0700
tags: [linux, gaming, vanilla, wine, compatibility, tweak]
---

## What
Gaming on linux getting better and better in the last couple of years thanks to Steam and project like proton. This is my take on how to play windows game that doesn't available on steam or some pirated version to try before buying. Ideally I would use proton to run windows game/application but I can't make it work. Proton/steam always complaint about execute permission on mounted disk. I store most of my data on NAS server mounted with samba or NFS. Whatever tweak I use, steam wont recognize it as valid mount. I can't even use my mounted NAS as steam library folder. This force me to 'sacrifice' litle space on my local drive to be used as steam library folder. Fortunately by using `wine` I can run whatever application/game stored in whatever directory/network mounted share.

## Why not use Lutris/PlayOnLinux/Others?
I have steam installed on my system and don't want to add another application just to launch game/app. All I need is some mechanism to launch windows game/application and add it to steam for centralize game launcher.

## Step by Step
- Install latest version of `wine` using your package manager
- Make sure you can run wine from your terminal

```shell
$ wine

# Will output something like this
wine-7.7
```

- Create separate prefix for each game/application (optional)

```shell
# Run following command to create custom prefix directory
# This will populate wine prefix with all the needed files for wine to run
$ WINEPREFIX=/path_to_your_custom_prefix/.wine_awesome_game winecfg
```

- Install patched `dxvk-async` to reduce stutter when playing game (optional)

```shell
# Download compiled patched version of dxvk-async
# Check "https://github.com/Sporif/dxvk-async/releases" for latest release
$ curl -Lo dxvk-async-1.10.1.tar.gz https://github.com/Sporif/dxvk-async/releases/download/1.10.1/dxvk-async-1.10.1.tar.gz

# Extract downloaded
$ tar -xzf dxvk-async-1.10.1.tar.gz

# Change directory to the new extracted content
$ cd dxvk-async-1.10.1

# Make sure that installer script has execute permission
$ chmod +x setup_dxvk.sh

# Install dxvk-async into wine prefix we created earlier
$ WINEPREFIX=/path_to_your_custom_prefix/.wine_awesome_game ./setup_dxvk.sh install
```

- Install/Run windows game. Now that we have custom wine prefix for game that we want to play, we can install or just copy from windows machine (some game can be run without full re-installation)

```shell
# Lets say we have installer in Download directory
$ cd Download

# Run installer with wine prefix we create earlier
# Follow installation proccess
$ WINEPREFIX=/path_to_your_custom_prefix/.wine_awesome_game wine my-game-installer.exe

# Now we can run the game
#
# Let say we install the game into "~/Games/My Awewome Game" directory. Notice the space in the
# directory name, we need to escape it
#
# Make sure you run wine from game installation directory, or it might not work as you expected
$ cd ~/Games/My\ Awesome\ Game

# Make sure to set DXVK_ASYNC=1, this will reduce stutter caused by shader compilation
$ DXVK_ASYNC=1 WINEPREFIX=/path_to_your_custom_prefix/.wine_awesome_game wine game-name.exe
```

- Creating shell script to launch the game (optional)

```shell
#!/usr/bin/env sh
# Create new file and save it as `my-game-launcher.sh`
cd ~/Games/My\ Awesome\ Game
DXVK_ASYNC=1 WINEPREFIX=/path_to_your_custom_prefix/.wine_awesome_game wine game-name.exe
```
add execute permission with `chmod +x my-game-launcher.sh`

- Now we can call the launcher from terminal or add it into steam as 'Non-Steam game'. Open terminal and run `/path_to/my-game-launcher.sh` to run the launcher.
