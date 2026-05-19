---
title: Creating a Lua mod
nav_order: 2
parent: Your first SN2 mod
---

# Creating a Lua mod

A UE4SS Lua mod is simply a `main.lua` script that runs inside the game process. UE4SS exposes a set of global functions that let you find game objects, read and write their properties, and respond to game events. Key patterns and functions that you'll see used often in LUA mods are:

- `FindAllOf(className)` - searches for all live instances of a given class, returning a table you can iterate over. This is how we'll locate the player's survival attribute set.
- `NotifyOnNewObject(path, callback)` - fires a callback whenever a new instance of the specified class is created. We use this to detect when the player character spawns or respawns, so we can acquire a fresh reference to the attribute set at the right moment.
- `LoopAsync(intervalMs, callback)` - runs a function repeatedly on a background thread at a given interval. Because game objects may not exist the moment your mod loads, polling is a common and reliable way to find and persist a reference to something.
- `ExecuteInGameThread(callback)` - runs code on the main game thread. This is important because directly modifying game object properties from a background thread is unsafe - UE4SS requires you to wrap those operations here.

With those building blocks in mind, the structure of our mod should start to make sense.

## Mod set up

We create our mod directly in the UE4SS mod folder so that we can build and test it quickly. Later on, we can move it into our development folder and get it all checked in to GitHub.

So, for now:

1. Start by creating a folder in `\Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Mods`, call it `Subnautica2CheatMod`.
2. Within that folder, create an empty file called `enabled.txt` - this tells UE4SS to load and activate our mod.
3. Within this folder create a folder called `scripts`.

4. Within that folder, create a file called `main.lua`.

5. Open this file in a VS code.

