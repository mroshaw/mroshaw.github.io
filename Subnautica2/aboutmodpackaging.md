---
title: About mod packaging
nav_order: 5
parent: Beginners Guide to Modding Subnautica 2
---

# About mod packaging

There's an important note about packaging Subnautica 2 mods that I want to call out here.

You may have come across mods for Unreal Engine games that use ".pak" files. Pak files are how many UE assets and mods are distributed - they are essentially compressed archive containers for game content, a bit like ZIP files.

Subnautica 2 uses the newer [Zen Loader system](https://dev.epicgames.com/documentation/unreal-engine/zen-loader-in-unreal-engine), an optimised asset loading system introduced in recent versions of Unreal Engine. Rather than standalone .pak files, Zen Loader uses a combination of container files - .pak, .utoc and .ucas - to store and load game assets. This packaging format is commonly referred to as "Io Store".

This matters because if your mod includes new or modified game assets, you cannot simply repack them into a standard .pak file - you need to produce Io Store-compatible output instead. This affects which tools you use, and it's worth knowing before you choose your approach.

I'm still learning the tooling for Io Store and mod packing, and at the time of writing Subnautica 2 on UE 5.6 is a very new modding target. I cover the [retoc](https://github.com/trumank/retoc/) tool in the pages that follow, which seems to be the "industry standard" for addressing the Zen Loader challenge, but that may change over time as Subnautica 2 modding processes evolve.
