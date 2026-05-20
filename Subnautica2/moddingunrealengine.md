---
title: Modding Unreal Engine
nav_order: 4
parent: Beginners Guide to Modding Subnautica 2
---

# Modding Unreal Engine

There are broadly three types of mod that you can create for Unreal Engine games like Subnautica 2:

1. Lua/script mods
2. Asset replacement mods
3. Blueprint / code mods

These are broad categories, and there's always a case for something in between or across these categories, depending on exactly what you want to do.

This guide will first focus on Lua/script mods, as they are by far the easiest mods to implement as a beginner. As the guide develops, and as I gain experience in modding the games myself, the guide will expand to cover the other mod types.

There are key differences and pros and cons of each mod type. Ultimately, which you choose comes down to what you want to achieve with your mod, as well as how confident and experienced you are with the technologies.

## Lua/script mods

Lua script mods use the UE4SS scripting runtime to hook into the game's existing logic and modify game behaviour at runtime. This means you can do things like change numerical values (like oxygen levels, hunger, health), alter the behaviour of existing game objects and entities, respond to in-game events, or add simple UI overlays. You do with all without touching the game's underlying assets or rebuilding anything.

### Pros

- Well documented process and scripting language, so much easier and quicker for beginners to pick up.

- Requires no complex application installations or dev machine setup.
- No risk of corrupting game files - scripts run on top of the game without modifying it directly.
- Easy to iterate and test - edit a text file, reload the mod using hot reload, see results immediately.
- Mods are small and easy to distribute.
- There's a good community of existing Lua/UE4SS mods to learn from and build on.
- Provides a "REPL console" that allows you to run Lua scripts and code directly in the game runtime.

### Cons

- Somewhat limited to modifying existing game behaviour.


### Typical tools required

- **UE4SS** - provides the Lua scripting runtime and developer tools (Live Viewer, Console, etc) for identifying game objects and classes. Players also need UE4SS installed to run your mod.
- **VS Code** - for writing Lua script code.

## Asset replacement mods

Asset replacement mods work by unpacking the game's existing content, modifying specific assets, and then repacking them into files that effectively override the originals at load time. This approach lets you reskin textures, swap or edit 3D models, modify sound effects and music, and alter data tables that control things like item properties. You are not adding new logic - you are swapping out what's already there.

### Pros

- Can be used not just to change game behaviour, but to change physical assets like textures, games models, etc.
- Potentially requires no code whatsoever.

### Cons

- Requires more detailed knowledge of the existing game structure.
- Can cause incompatibility issues with other mods that touch the same assets.
- Can require more proactive maintenance, as any game patch that changes the original assets can break your mod.
- Requires understanding of UE's asset system and how assets reference each other.
- Some asset types require a full UE install to repackage properly.
- Requires a more advanced dev setup, with more tools to analyse, modify, and repack assets.
- Mods will have to be repacked and redistributed if the base game UE version changes.

### Typical tools required

- **UE4SS** - provides the Lua scripting runtime and developer tools (Live Viewer, Console, etc) for identifying game objects and classes.
- **FModel** - used to analyse existing game structure, configuration, and assets.
- **UAssetGUI** -  for viewing and editing `.uasset` files directly.
- **retoc** - used to package the mod into .pak, .ucas, .utoc files required by the game.
- **Unreal Engine** - depending on the complexity of the mod, you may need a full UE install to package.

## Blueprint/code mods

Blueprint and code mods involve creating entirely new game logic or assets within Unreal Engine itself, then packaging and injecting them into the game.  This is the most powerful modding approach, allowing you to add things the base game never contained, but it requires a full UE development environment and a solid understanding of how Unreal Engine projects are structured.

### Pros

- Allows for the greatest flexibility in what your mod can do - new items, vehicles, creatures, game mechanics, anything really!
- Less likely to cause a conflict with other mods.

### Cons

- Requires more detailed knowledge of the existing game structure.
- Requires understanding of UE's asset system and how assets reference each other.
- Requires a more extensive dev environment setup, typically requiring a full Unreal Engine install and configuration.
- Calls for experience and understanding of Unreal Engine development tools and processes.
- Mods will have to be repacked and redistributed if the base game UE version changes.

### Typical tools required

- **UE4SS** - "Developer" version used to identify objects and classes required to implement changes.
- **FModel** - used to analyse existing game structure, configuration, and assets.
- **Unreal Engine** - used to create new UE components and assets, and package mods for distribution.
- **Visual Studio/Windows SDK** - used in the Unreal Engine build pipeline.

