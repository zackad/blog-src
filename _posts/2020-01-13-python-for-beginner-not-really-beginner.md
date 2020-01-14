---
layout: post
title: Python For Beginner (Not Really Beginner!)
date: 2020-01-13 21:29 +0700
---

> **WARNING:** This article is not for beginner in programming, but for python beginner.

If you want to learn python as your second (or 3rd, 4th, nth, ...) language, this guide will give you some advice to manage your code and project structure.

## Step 1 — Choosing Python Version

Depending on your operating system, python might already installed. Try to type `python --version` on your terminal and see which version is installed. Sometime multiple version of python is installed in a single machine (version 2 and version 3). You can check by typing on your terminal

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

Unlike other language where dependencies are installed locally on project directory (composer on PHP, or npm/yarn on NodeJS), python packages are installed on system wide or user home directory. This will cause conflict when we have project that depend on a package with different version. Let's say we have **Project 1** that depend on _Package A Version 1_ and **Project 2** that depend on _Package A Version 2_. When we importing the package it will cause an error because compatibility issue.

The solution is to isolate these projects into their own environment (or called virtual environment). This will create a directory inside our project with all the binary file that required to run python, including package manager `pip`.

```shell
# Create project directory and move into it
mkdir my-python-project
cd my-python-project

# Create new python environment named .venv
# .venv is the recommended name
python -m venv .venv

# Activating virtual environment
source .venv/bin/activate

# Deactivating virtual environment
deactivate
```

After activating python virtual environment (venv) we can start installing our dependencies without affecting system python or other environment. When **venv** is active, this will add a prefix in our shell prompt.

![venv is not activated](/assets/images/python-without-venv.png)
![venv is activated](/assets/images/python-with-venv.png)

## Step 3 — Managing Dependencies

## Step 4 — Choosing Code Editor/IDE

## Step 5 — Enabling Version Control

## Conclusion

- use python 3
- different environment for different project
- install dependencies in virtual environment
- use jupyter notebook to fiddle around
- keep project history with git

[python-download]: https://www.python.org/downloads/
