---
title: Important notes for SN2
nav_order: 5
parent: Beginners Guide to Modding Subnautica 2
---

# Important notes regarding Subnautica 2

As I said in the introduction, Subnautica 2 has just been released into Early Access. This has some important implications for modders.

## Unreal Engine versions

The initial Early Access release was built with Unreal Engine 5.6.1. The developer has indicated that they may move to Unreal Engine 5.7 in a future release. Bear this in mind when building more complex mods, as you'll have to upgrade your dev environment and mods if and when this happens.

## Blueprints and C++

The developers of Subnautica 2 have made the modding community aware that while the game goes through Early Access, and possibly beyond, Unreal Engine Blueprints will be used for prototyping functionalty. Once proven out, the developers may then migrate that functionality out of Blueprints into core C++ code. In practice, this may mean that certain Blueprint functions and capabilities that you rely on in your mod may suddenly stop working, and/or require you to revisit your mod as new versions of the game are released. How this will impact you and to what degree will depend entirely on what's changed and when, but it's something you just need to be aware of.

## Mod packaging

There's an important note about packaging Subnautica 2 mods that I want to call out here, as it's kind of tied to the latest versions of Enreal Engine that are used to build the game.

You may have come across mods for Unreal Engine games that use ".pak" files. Pak files are how many UE assets and mods are distributed - they are essentially compressed archive containers for game content, a bit like ZIP files.

Subnautica 2 uses the newer [Zen Loader system](https://dev.epicgames.com/documentation/unreal-engine/zen-loader-in-unreal-engine), an optimised asset loading system introduced in recent versions of Unreal Engine. Rather than standalone .pak files, Zen Loader uses a combination of container files - .pak, .utoc and .ucas - to store and load game assets. This packaging format is commonly referred to as "Io Store".

This matters because if your mod includes new or modified game assets, you cannot simply repack them into a standard .pak file - you need to produce Io Store-compatible output instead. This affects which tools you use, and it's worth knowing before you choose your approach.

I'm still learning the tooling for Io Store and mod packing, and at the time of writing Subnautica 2 on UE 5.6 is a very new modding target. I cover the [retoc](https://github.com/trumank/retoc/) tool in the pages that follow, which seems to be the "industry standard" for addressing the Zen Loader challenge, but that may change over time as Subnautica 2 modding processes evolve.
