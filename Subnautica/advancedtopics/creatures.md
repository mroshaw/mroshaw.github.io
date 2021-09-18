---
layout: default
title: Creatures
nav_order: 6
parent: Advanced modding



---

# Creatures

If you have ever played Subnautica, you have more than likely encountered a huge variety of creatures in your playthrough. While the selection the game provides is more than sufficient, you are able to add your own creatures with relative ease.

## Designing your creature

Before you actually begin implementing a creature into Subnautica. You will want some sort of initial plan for how your creature will look, act, and interact with the world.

You will need to have a model for your creature, preferably in the `.fbx` format. If you do have a model already, nice! If not, there are plenty of models online you could use, and there are also plenty of artists you can commission to create one.

You will also need to decide on how your creature moves throughout the world. Will it be slow? Will it be fast? Will it wander long distances? Will it hunt small fish? Will it hunt you? Will it hunt leviathans? Will it sleep at night? Will it hide in the abyss at day but come out to hunt at night? Will it be a horror-related creatuer which relentlessly hunts the player? These are all things to consider, but it's ultimately up to you how it will behave.

You next want to decide where your creature will spawn.
* Leviathan spawns should be limited and should use SMLHelper's `CoordinatedSpawns` system.
* Most other creatures should use SMLHelper's `BiomesToSpawnIn` override. This is the same system that non-leviathan creatures, fragments, and resources use to spawn.
  * Be careful to not make the spawns for your creatures too common, because they _will_ override vanilla spawns.
* Do not add overly aggressive fauna into early game locations, unless you are looking to create a challenge.

Things you may also want to decide on:
* Lore (databank entry)
* Cinematic attacks (like the Reaper Leviathan grab)
* Whether the creature is edible or not

## Implementing your creature

Implementing your own creature can range from copying and pasting a few lines of code, to extremely difficult. It depends on what you want your creature to do.

### Creating a creature prefab from scratch

One option for creating a creature prefab is utilizing the `Spawnable` prefab class in SMLHelper. The code for this will be _very_ lengthy and I only recommend it to advanced modders who want _full_ control over the creation of their creature. I recommend most modders to use ECCLibrary.

### Creating a creature using ECCLibrary

ECCLibrary is a Subnautica modding library which has a sole purpose for creatures. It was originally designed for the Gargantuan Leviathan, but it should actually work for any creature. It has a wiki, which although work in progress, can be viewed [here](https://github.com/LeeTwentyThree/ECCLibrary/wiki). The wiki should walk you through the basics of creating a creature for Subnautica.