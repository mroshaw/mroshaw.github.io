---
title: Coding your mod
nav_order: 2
parent: Your first SN2 mod
---

# Coding your mod

Now that we know what we need to target, we can write the mod. Before we dive in, it's worth understanding the general shape of a UE4SS Lua mod, as the pattern we use here is one you'll see repeated across many mods.

## How UE4SS Lua mods work

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


## Coding the mod

Here's the full mod code. We'll walk through each section below:

```lua
local UEHelpers = require("UEHelpers")
local MOD_NAME = "BeginnersGuideCheatMod"

-- Simple helper function to log messages with the mod name as a prefix and a timestamp
local function log(msg)
    print(string.format("[%s] %s\n", MOD_NAME, msg))
end

-- Hold a reference to the player's attribute set so we can modify it each tick
local attrSet = nil

-- Function to find the player's survival attribute set in memory
local function findPlayerAttrSet()
    local all = FindAllOf("UWESurvivalAttributeSet")
    if not all then return nil end

    for _, set in ipairs(all) do
        if set:IsValid() and set:GetFullName():find("BP_Character_01_C") then
            return set
        end
    end

    return nil
end

-- When the player spawns, find and set the survival attribute
NotifyOnNewObject("/Game/Blueprints/Character/player/BP_Character_01.BP_Character_01_C", function()
    ExecuteInGameThread(function()
        attrSet = nil
        attrSet = findPlayerAttrSet()
        if attrSet then
            log("Player character created - survival attributes found! Infinite Oxygen, Food, and Water enabled!")
        end
    end)
end)

-- Loop every 500ms to check for the player's attribute set and modify it to give infinite oxygen, food, and water
LoopAsync(500, function()
    ExecuteInGameThread(function()
        if not attrSet or not attrSet:IsValid() then
            return
        end

        -- Oxygen
        local maxOxygen = attrSet.MaxOxygen.CurrentValue
        attrSet.Oxygen.BaseValue = maxOxygen
        attrSet.Oxygen.CurrentValue = maxOxygen

        -- Food
        local maxFood = attrSet.MaxFood.CurrentValue
        attrSet.Food.BaseValue = maxFood
        attrSet.Food.CurrentValue = maxFood

        -- Water
        local maxWater = attrSet.MaxWater.CurrentValue
        attrSet.Water.BaseValue = maxWater
        attrSet.Water.CurrentValue = maxWater
    end)
    return false
end)

log("Loaded!")
```

### Setup and logging

```lua
local UEHelpers = require("UEHelpers")
local MOD_NAME = "BeginnersGuideCheatMod"

-- Simple helper function to log messages with the mod name as a prefix and a timestamp
local function log(msg)
    print(string.format("[%s] %s\n", MOD_NAME, msg))
end
```

`UEHelpers` is a utility library bundled with UE4SS that provides some handy convenience functions. We're not using it a lot here, but it's good practice to include it. You can see what functions it offers in the [UE4SS GitHub repository](https://github.com/UE4SS-RE/RE-UE4SS/blob/main/assets/Mods/shared/UEHelpers/UEHelpers.lua). Our little log helper simply prefixes our print output with the mod name, which makes it easy to spot our messages in the UE4SS console.

### Finding the player's attribute set

```lua
-- Hold a reference to the player's attribute set so we can modify it each tick
local attrSet = nil

-- Function to find the player's survival attribute set in memory
local function findPlayerAttrSet()
    local all = FindAllOf("UWESurvivalAttributeSet")
    if not all then return nil end

    for _, set in ipairs(all) do
        if set:IsValid() and set:GetFullName():find("BP_Character_01_C") then
            return set
        end
    end

    return nil
end
```

This is where our earlier investigation pays off. We know from the UE4SS Live View that the class we want is `UWESurvivalAttributeSet`, and we know it lives on "BP_Character_01_C". We also know that there may be multiple instances of `UWESurvivalAttributeSet` in the game world, so we can't just grab the first one - we filter by "BP_Character_01_C" in the full name to make sure we get the player's instance specifically.

The `attrSet` variable is declared outside the function so we can hold onto the reference once we've found it, rather than searching on every poll.

### Finding the reference on spawn

```lua
-- When the player spawns, find and set the survival attribute
NotifyOnNewObject("/Game/Blueprints/Character/player/BP_Character_01.BP_Character_01_C", function()
    ExecuteInGameThread(function()
        attrSet = nil
        attrSet = findPlayerAttrSet()
        if attrSet then
            log("Player character created - survival attributes found! Infinite Oxygen, Food, and Water enabled!")
        end
    end)
end)
```

Rather than searching for the attribute set on every loop tick, we use `NotifyOnNewObject()` to watch for the player character being created. This fires both on initial spawn and on respawn after death, which means we always have a fresh reference. We explicitly nil attrSet before re-acquiring it to ensure we're never holding a stale reference to an old instance.

The asset path ""/Game/Blueprints/Character/player/BP_Character_01.BP_Character_01_C" is the "concrete" player character class that we identified in FModel. This is distinct from the base `BP_SN2PlayerCharacter` class in Blueprints/Core. Using the concrete class ensures the callback fires at the right point in the character's initialisation.

### Polling and updating the attributes

```lua
-- Loop every 500ms to check for the player's attribute set and modify it to give infinite oxygen, food, and water
LoopAsync(500, function()
    ExecuteInGameThread(function()
        if not attrSet or not attrSet:IsValid() then
            return
        end

        -- Oxygen
        local maxOxygen = attrSet.MaxOxygen.CurrentValue
        attrSet.Oxygen.BaseValue = maxOxygen
        attrSet.Oxygen.CurrentValue = maxOxygen

        -- Food
        local maxFood = attrSet.MaxFood.CurrentValue
        attrSet.Food.BaseValue = maxFood
        attrSet.Food.CurrentValue = maxFood

        -- Water
        local maxWater = attrSet.MaxWater.CurrentValue
        attrSet.Water.BaseValue = maxWater
        attrSet.Water.CurrentValue = maxWater
    end)
    return true
end)
```

This loop runs every 500 milliseconds, and you can obviously tweak that to whatever poll frequency you want. On each "tick" it first checks whether we have a valid reference to the attribute set - if not, do nothing. We're waiting at this point for the player to spawn and for the survival attributes component to be found. Once found, it reads the current max value for each attribute and sets both `BaseValue` and `CurrentValue` to that max. We set both because Unreal's Gameplay Ability System maintains these separately, and setting only one may not produce the result you expect.

### Testing the mod

Save main.lua and launch the game. UE4SS will load your mod automatically on startup. Watch the UE4SS console - you should see:

`[Subnautica2CheatMod] Loaded!`

And once you're in game and the player character is initialised:

`[Subnautica2CheatMod] Player character created - survival attributes found! Infinite Oxygen, Food, and Water enabled!`

If you make changes to main.lua while the game is running, you can reload all mods without restarting by pressing Ctrl+R while the game window has focus. Note that this won't work if focus is on the UE4SS console window - click back into the game first. This is called "hot reload" and is the most amazing thing I've ever come across, especially having spent most of my time working with Unity mods! It makes tweaking and testing so much quicker, it', quite literally, unreal!

### Building on this pattern

You'll see a pattern here:

- Watch for object creation with `NotifyOnNewObject`
- Find a class with `FindAllOf`
- Filter to the right instance
- Hold a reference
- Poll to keep values updated

It's a pretty handy pattern to keep in mind, and you might come across it in other mods you see and build yourself. Once you're comfortable with it, you can apply it to almost anything you find through Live View and the Lua types. The survival attributes are a good example, but the same approach works for health, energy, temperature, or any other attribute set in the game.
