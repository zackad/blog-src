---
title: "Build and Configure PHP with phpenv+php-build"
date: 2022-11-07T07:37:36+07:00
draft: false
tags: [tools]
---

## Step 1 - Install The Tools

- Install [phpenv][phpenv]
```shell
$ git clone https://github.com/phpenv/phpenv.git ~/.phpenv
```

- Install [php-build][phpbuild] as phpenv plugin
```shell
$ git clone https://github/com/php-build/php-build.git ~/.phpenv/plugins/php-build
```

- Add phpenv into PATH (put into .profiles/.bashrc/.zshrc or something similar)
```shell
export PATH="${HOME}/.phpenv/bin:{$PATH}"
eval "$(phpenv init -)"
```

- Reload your shell / Re-open your terminal

## Step 2 - Update Definitions
We need to update php-build definitions periodically to get the available php versions.
```shell
$ cd ~/.phpenv/plugins/php-build
$ git fetch
$ git merge origin/master --ff
```

## Step 3 - Compiling
```shell
$ PHP_BUILD_CONFIGURE_OPTS="--with-pgsql --with-pdo-pgsql --with-zip --with-json --with-xml --enable-fpm" \
    PHP_BUILD_XDEBUG_ENABLE=off \
    PHP_BUILD_INSTALL_EXTENSION="apcu=5.1.22 pcov=1.0.11" \
    phpenv install 8.1.12
```

## Step 4 - Switching Version
```shell
# List installed versions
$ phpenv versions

# Switch into specific version
$ phpenv global 8.1.12
```

[phpbuild]: https://github.com/php-build/php-build
[phpenv]: https://github.com/phpenv/phpenv
