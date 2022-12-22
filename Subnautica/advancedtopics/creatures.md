---
title: Creatures
nav_order: 6
parent: Advanced modding
---

# Creatures

If you have ever played Subnautica, you have more than likely encountered a huge variety of creatures in your playthrough. While the selection of creatures the game already provides is more than sufficient, you are able to add your own creatures with relative ease.

## Designing your creature

### Overview

Before you actually begin implementing a creature into Subnautica. You will want some sort of initial plan for how your creature will look, act, and interact with the world.

### The basics

You will need to have a model for your creature, preferably in the `.fbx` format. If you do have a model already, nice! If not, there are plenty of models online you could use, and there are also plenty of artists you can commission to create one.

The main thing you need to decide on is how your creature will move throughout the world. Will it be slow? Will it be fast? Will it wander long distances? Will it be peaceful? Will it hunt small fish? Will it hunt you? Will it hunt leviathans? Will it sleep at night? Will it hide in the abyss at day but come out to hunt at night? Will it be a horror-related creature which relentlessly hunts the player? Will its body be rigid, or will it use "Trails" and flow naturally through the water? These are all things to consider, but it's ultimately up to you how it will look and behave.

### Aggressive fauna

The most important thing to keep in mind for aggressive fish is that they have to be fun to play against.

Insta-kill attacks are almost never fun. Even the Gargantuan Leviathan juvenile, with a bite force apparently as strong as that of roughly a hundred thousand nile crocodiles, doesn't have an insta-kill attack.

Sometimes you have to take game design/balance over realism.

### Placement in the world

You also want to decide where your creature will spawn.
* Leviathan spawns should be limited and should use SMLHelper's `CoordinatedSpawns` system.
* Most other creatures should use SMLHelper's `BiomesToSpawnIn` override. This is the same system that non-leviathan creatures, fragments, and resources use to spawn.
  * Be careful to not make the spawns for your creatures too common, because they _will_ override vanilla spawns.
* Do not add overly aggressive fauna into early game locations, unless you are looking to create a challenge.

### Other considerations

There are many other things you can take into consideration before implementing your creature:
* Lore (databank entry)
* Cinematic attacks (like the Reaper Leviathan grab)
* Whether the creature is edible or not

Adding creatures will become even more relevant when adding custom biomes becomes popular, because those new biomes will need new and unique creatures to make them feel alive.

## Implementing your creature

Implementing your own creature can range from copying and pasting a few lines of code, to extremely difficult. It depends on what you want your creature to do.

### Creating a creature prefab from scratch

One option for creating a creature prefab is utilizing the `Spawnable` prefab class in SMLHelper. The code for this will be _very_ lengthy and I only recommend it to advanced modders who want _full_ control over the creation of their creature. I recommend most modders to use ECCLibrary.

### Creating a creature using ECCLibrary

ECCLibrary is a Subnautica modding library which has a sole purpose of creating creatures. While it was originally designed for the Gargantuan Leviathan, it now supports the creation of all types of creatures. It has a wiki, which although work in progress, can be viewed [here](https://github.com/LeeTwentyThree/ECCLibrary/wiki). The ECCLibrary wiki should walk you through the basics of creating your own creature for Subnautica. It is quite lengthy, though, so the contents will not be included on this wiki.