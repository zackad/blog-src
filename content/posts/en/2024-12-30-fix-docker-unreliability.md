---
title: "How I Fix Docker Unreliability"
date: 2024-12-30T07:55:53+07:00
tags: [linux, sysadmin]
---

## Problems
This are the problem I encounter when self-hosting application in docker:
- I store my data/media in a NAS which is different machine from the server that run docker. I use samba as protocol of choice since it simplify my setup on multiple device (smartphone, tablet, laptop, desktop). I don't use NFS since it doesn't have authentication protection.
- When my server boot up after power loss, the NAS will be ready AFTER main server where the docker run. This means mounting network share will fail on boot.
- Docker container that rely on network share filesystem will not start properly.
- AFAIK docker cannot auto restart container that failed to start to begin with.

## My Solution
### Use docker volume to mount network share

Create new docker volume that will mount network share
```shell
docker volume create \
  --driver local \
  --opt type=cifs \
  --opt device=//your.server.ip.address/data \
  --opt o=addr=your.server.ip.address,username=uxxxxxxx,password=***** \
  --name samba_data
```

Mount volume into service that need it by add following into `compose.yaml`
```yaml
services:
  test:
    image: docker.io/library/nginx:latest
    volumes:
      - samba_data:/data

volumes:
  samba_data:
    external: true
```

### Periodically check if there's docker container with exited status

Add following line into crontab. Basically it will check if there's docker container with `exited` status and the start it every 5 minutes.

```cron
*/5 * * * * docker ps --filter "status=exited" --quiet | xargs --no-run-if-empty docker start
```

### Use [autoheal](https://github.com/willfarrell/docker-autoheal) to restart unhealthy container

Start docker container that would whatch container health
```yaml
services:
  autoheal:
    image: docker.io/willfarrell/autoheal:latest
    container_name: autoheal
    restart: always
    environment:
      - AUTOHEAL_INTERVAL=60
      - AUTOHEAL_START_PERIOD=60
      - AUTOHEAL_DEFAULT_STOP_TIMEOUT=10
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

Tag container that you want to _autoheal_.
```yaml
services:
  test:
    image: docker.io/library/nginx:latest
    volumes:
      - samba_data:/data
    healthcheck:
      test: curl --fail localhost || exit 1
    labels:
      - autoheal=true

volumes:
  samba_data:
    external: true
```
