---
layout: post
title: Python For Beginner (Not Really Beginner!)
date: 2020-01-13 21:29 +0700
---

> **WARNING:** This article is not for beginner in programming, but for python beginner.

If you want to learn python as your second (or 3rd, 4th, nth, ...) language, this guide will give you some advice to manage your code and project structure.

## Step 1 — Choosing Python Version

Depending on your operating system, python might already installed. Try to type `python --version` on your terminal and see which version is installed on your system. Sometime multiple version of python is installed in a single machine (version 2 and version 3). You can check by typing on your terminal

```shell
# Check default python version
python --version

# Check if python version 3 is installed
python3 --version
```

If you don't have it installed, please follow the instruction on your operating system how to install python.

```shell
# MacOS with homebrew
brew install python

# Debian based linux distribution
apt get install pthon

# Arch linux
pacman -S python

# Windows
# I have no idea how to install python on windows,
# Then again I don't use windows for programming, sorry.
```

If you have to install it manually, please visit [python download page][python-download] and follow the instruction.

Generally speaking, you should code for python 3 as the target. Unless you need to support a system that only has python 2. Starting with python version 3.3, it has built in tool to manage virtual environment which we need to manage our project in the next step.

## Step 2 — Creating Virtual Environment

## Step 3 — Managing Dependencies

## Step 4 — Choosing Code Editor/IDE

## Step 5 — Enabling Version Control

## Conclusion

-   use python 3
-   different environment for different project
-   install dependencies in virtual environment
-   use jupyter notebook to fiddle around
-   keep project history with git

[python-download]: https://www.python.org/downloads/
