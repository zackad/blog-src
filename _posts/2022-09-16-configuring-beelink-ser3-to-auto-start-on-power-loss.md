---
layout: post
title: Configuring Beelink SER3 to Auto Start on Power Loss
date: 2022-09-16 11:55 +0700
tags: bios
---

1. Power ON your mini-pc and press `F7` key on your keyboard until you enter BIOS mode.
2. Navigate to Advanced tab
3. Select AMD CBS menu
   ![advance option](/assets/images/1_advance_option.jpg)

4. Select FCH Common Options
   ![AMD CBS](/assets/images/2_amd_cbs.jpg)

5. Select AC Power Loss Options
   ![FCH Common Options](/assets/images/3_fch_common.jpg)

6. Select your preferred mode when AC Power is loss. In my case I want it to auto turn on when AC power lost and the machine is powered on, so I choose "Previous"
   ![AC Power Loss](/assets/images/4_ac_power_loss.jpg)

7. Press `F4` key to save the change and exit.
