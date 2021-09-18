---
layout: default
title: Testing your mod
nav_order: 6
parent: Your first Below Zero mod
---

# Testing you mod

You should now be able to fire up the game and do some testing.

Once you've launched Subnautica, go into Options \> Mods and check "Enable debug logs":

![](.\media\subnauticaenabledebug.png)

Exit the game and launch it once again. Load up a game and equip your knife -- take a few swings while you're at it. You should now alt tab back to your desktop and get back into Windows Explorer. Navigate to your \<game> folder, and you should see a file called: `qmodmanager_log-SubnauticaZero.txt`:

![](.\media\debugfilelocation.png)

Open this in Notepad or your favourite text editor and have a look. You'll see lots of information in here, and you should also see entries prefixed with your mod name:

```
[SMLHelper/Debug] Attempting to handle console command: tools
[SMLHelper/Debug] No command listener registered for [tools].
[MyFirstSubnauticaMod_BZ:DEBUG] Knife damage was: 20, is now: 40
```

Now get out there and stab some sea life!
