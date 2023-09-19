---
title: Testing your mod
nav_order: 7
parent: Your first mod
---

# Testing you mod

You should now be able to fire up the game and do some testing.

Start a new game or load a save, it doesn't matter which. Once you're in the game, if you don't already have a knife you can use the game console to spawn one:

Hit <SHIFT> + <ENTER> on the keyboard

Run this console command: 

```
item knife 1
```

If you tab out of the game and open Windows Explorer, you'll see that BepInEx has created a log file for you. You can find this in <game>\BepInEx and it's called`LogOutput.log`:

![](.\media\debugfilelocation_bepinex.png)

Open this in Notepad, and you should see you familiar output:

```
[Debug  :  Nautilus] Attempting to handle console command: item
[Debug  :  Nautilus] No command listener registered for [item].
[Debug  :  Nautilus] Attempting to handle console command: item knife 1
[Debug  :  Nautilus] No command listener registered for [item].
[Debug  :Knife Damage Mod] Knife damage is 20
[Debug  :Knife Damage Mod] Knife damage increased to 100
```

Congratulations! You've successfully modified the game!

# And finally...

Now get out there and stab some sea life!
