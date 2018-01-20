---
layout: post
title: How to Select Fastest Ubuntu Repository Mirror
tags: ubuntu mirror
---
Ubuntu has so many mirror repository we can choose. Sometimes the mirror exists in our country that near with our internet provider.

## Requirements

- Python with pip package manager
- Internet connection (obviously)

## Installation

- Installation from pip (python package manager)

```shell
sudo pip install apt-select
```

- Manual installation with git

```shell
git clone https://github.com/jblakeman/apt-select
python apt-select/setup.py install
```

[apt-select-repo]: https://github.com/jblakeman/apt-select
