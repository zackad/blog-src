---
title: 'TIL: You Can Track Playing Time of Non-Steam Game'
date: 2024-01-28T08:03:25+07:00
tags: [gaming]
---

> Update: 2024-01-28
>
> This trick NO longer work

If you want to track your gaming session (and other application usage) on windows, give [ProcrastiTracker](https://strlen.com/procrastitracker/) a try. In linux I recommend [Lutris](https://lutris.net/).

---

__Original Article__

If you have _non-steam game_[0] added to steam launcher, one feature that missing is ability to track playtime. It turn out that you can simply move your non-steam game into steam library folder and it will recognize the game and add playtime tracking just fine.

## How To

- Open steam library folder
- You will find several directories (common, compatdata, downloading, etc)
  {{<figure caption="Steam library folder" src="/assets/images/steam_library-folder.png">}}
- Move/Copy your game installation folder into `common` directory
- Add "non-steam game" into steam launcher
- Launch game with newly added entry
- If the title is recognized, a new entry will be added by steam
  {{<figure caption="Config.exe is actual entry I added to steam as launcher" src="/assets/images/steam_actual-entry.png">}}
  {{<figure caption="Steam recognize the title and add new entry" src="/assets/images/steam_added-entry.png">}}

Some caveats:

- Actual game must exist in steam store, otherwise it won't be recognize
- You can NOT use the (automatically) added entry to launch the game. You must use the entry that you manually added
  {{<figure caption="You can't use the added entry to lauch the game, but it can track your playtime" src="/assets/images/steam_cannot-launch.png">}}

[0]: refer to game bought outside steam store or _"other"_ version
