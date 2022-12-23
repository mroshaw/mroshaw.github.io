---
title: Testing your mod
nav_order: 7
parent: Your first Below Zero mod
---

# Testing you mod

You should now be able to fire up the game and do some testing.

Testing steps will be different, depending on the solution you've built.

## QMod Manager Log ![](..\media\qmm.png)

 Once you've launched Subnautica, go into Options \> Mods and check "Enable debug logs":

![](.\media\subnauticaenabledebug.png)

Exit the game and launch it once again. Load up a game and equip your knife -- take a few swings while you're at it. You should now alt tab back to your desktop and get back into Windows Explorer. Navigate to your \<game> folder, and you should see a file called `qmodmanager_log-SubnauticaZero.txt`:

![](.\media\debugfilelocation.png)

Open this in Notepad or your favourite text editor and have a look. You'll see lots of information in here, and you should also see entries prefixed with your mod name:

```
[SMLHelper/Debug] Attempting to handle console command: tools
[SMLHelper/Debug] No command listener registered for [tools].
[MyFirstSubnauticaMod_BZ:DEBUG] Knife damage was: 20, is now: 40
```

## BepInEx Log ![](..\media\bepinex.png) 

Once you've launched the game, BepInEx will have created a log file. You can find this in <game>\BepInEx and it's called`LogOutput.log`:

![](.\media\debugfilelocation_bepinex.png)

Open this in Notepad, and you should see you familiar output:

```
[Info   :   BepInEx] 1 plugins to load
[Info   :   BepInEx] Loading [Knife Damage Mod BZ 1.0.0]
[Info   :Knife Damage Mod BZ] PluginName: Knife Damage Mod BZ, VersionString: 1.0.0 is loaded.
[Message:   BepInEx] Chainloader startup complete
[Info   :Knife Damage Mod BZ] Knife damage was: 20, is now: 40
```

# And finally...

Now get out there and stab some sea life!
