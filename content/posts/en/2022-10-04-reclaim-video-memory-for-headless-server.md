---
title: 'Reclaim Video Memory for Headless Server'
date: 2022-10-04T08:51:18+07:00
draft: false
tags: [bios]
---

I bought a [Beelink SER3](https://www.bee-link.net/products/beelink-ser3-3200u) mini pc for my home server. It has 8GB memory and 256GB storage. Barely enough for my use case to run several service such as vaultwarden, nextcloud, freshrss, plex media server and other thing. In the future I might want to install gitlab or youtrack. For that I need to upgrade the memory to atleast 16GB.

The thing is, it come pre-installed with windows 11 and from the marketing material it is intended for lightweight desktop usage (office suite, watch video) and boasting to be able running at 4K resolution. No wonder that the allocated video memory from RAM is around 2GB. I notice that after replacing windows with archlinux the main memory only read as 5.xGB. I always thought that video memory is done by OS, it turn out I need to configure it in the BIOS. Here's the setting

- Enter Bios mode (restart pc and pres `del` key), and select **Advanced** Tab, then select **AMD CBS**
  {{< figure src="/assets/images/gfx-memory/1_amd_cbs.jpg" caption="Figure 1: Advance Tabs" >}}
- Select **NBIO Common Options**
  {{< figure src="/assets/images/gfx-memory/2_nbio_options.jpg" caption="Figure 2: NBIO Common Options" >}}
- Select **GFX Configuration**
  {{< figure src="/assets/images/gfx-memory/3_gfx_config.jpg" caption="Figure 3: GFX Configuration" >}}
- Change following options
  - Integrated Graphics Controller -> Forces
  - UMA Mode -> UMA_SPECIFIED
  - UMA Version -> AUTO
  - UMA Frame Buffer Size -> **SELECT_YOUR_CHOISE** (I run this pc as headless server, the smallest choise is 64MB) To be safe I choose 128MB, might need to install DE later on.
    {{< figure src="/assets/images/gfx-memory/4_uma.jpg" caption="Figure 4: UMA Configuration" >}}
