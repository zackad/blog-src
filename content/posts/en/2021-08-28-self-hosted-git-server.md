---
layout: post
date: 2021-08-28T17:28:00+0700
title: How to self hosting git with http server
tags: [git, self-hosted]
---

## Goal

- Can list git repository similar to `http://git.php.net`
- Web insterface used only for public view, security is not a concern
- Easy to provision and tear down

## TL;DR

- Create directory where to store your repositories
- Run `docker run -p 1234:1234 -v /your/repo:/srv/gitweb/repo zackad/gitweb -d`

## Manual Steps

- Create a working directory

```shell
mkdir git-webhosting
cd git-webhosting
```

- Create Dockerfile with following content

```Dockerfile
FROM ruby:2.6-alpine

RUN apk add --no-cache git git-gitweb perl-cgi \
    && mkdir -p /srv/gitweb/repo \
    && cd /srv/gitweb \
    && git init

WORKDIR /srv/gitweb

COPY entrypoint.sh /srv/gitweb/entrypoint.sh
COPY gitweb_config-example.perl /srv/gitweb/gitweb_config-example.perl

EXPOSE 1234

CMD './entrypoint.sh'

```

- Create an entrypoint file with following content

```shell
#!/usr/bin/env sh

if [ -z "$1" ]; then
    # Start gitweb server on port 1234
    git instaweb --httpd=webrick

    # Override config file with example, you can override with your own config
    cp gitweb_config-example.perl ./.git/gitweb/gitweb_config.perl

    # Prevent container to exit
    tail -F .git/gitweb/access.log
else
    exec "$@"
fi
```

- Create configuration for gitweb and name it `gitweb_config-axample.perl`

```perl
#!/usr/bin/perl
our $projectroot = "/srv/gitweb/repo";
our $git_temp = "/srv/gitweb/.git/gitweb/tmp";
our $projects_list = $projectroot;
our $projects_list_categories_group = 1;

$feature{'remote_heads'}{'default'} = [1];
```

- Build the docker image with `docker build git-hosting:latest .`
- Start container with `docker run -p 1234:1234 -v /your/repo/path:/srv/gitweb/repo git-hosting:latest -d`
- Open your browser and access `http:127.0.0.1:1234`
- Now you can add your projects into `/your/repo/path/` and it will be automatically updated in web interface

## Further Action

You can add this container into your server with some reverse proxy to add SSL for secure access. My main purpose of this system if for mirroring and peace of mind knowing that I can host all my project in an environment where I have total control.
