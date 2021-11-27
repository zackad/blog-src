---
layout: post
title: How to get simple stats from git repository
date: 2021-11-27 07:44 +0700
tags: git script
---

## Actual script
This script will print commit stats grouped by author in the current git repository. Save into your `PATH` e.g `~/.local/bin/gstats` and give it execute permission (`chmod +x ~/.local/bin/gstats`).

```shell
#!/usr/bin/env sh
echo "Generating simple stats for this repository"

for author in $(git shortlog -s | cut -c8- | xargs)
do 
    echo -e "\nStats for \"$author\""

    # Copied from: https://gist.github.com/eyecatchup/3fb7ef0c0cbdb72412fc
    git log --shortstat --author=$author \
        | grep -E "fil(e|es) changed" \
        | awk '{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END {printf "Commit stats:\n- Files changed (total)..  %s\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }' -
done
```

## Usage

Navigate into your git repository and type `gstats` command, this will output something like this.
```text
Generating simple stats for this repository

Stats for "dawamakbar"
Commit stats:
- Files changed (total)..  982
- Lines added (total)....  28212
- Lines deleted (total)..  9662
- Total lines (delta)....  18550
- Add./Del. ratio (1:n)..  1 : 0.342478

Stats for "zackad"
Commit stats:
- Files changed (total)..  6201
- Lines added (total)....  128319
- Lines deleted (total)..  61645
- Total lines (delta)....  66674
- Add./Del. ratio (1:n)..  1 : 0.480404
```