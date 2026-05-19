---
title: Coding your mod
nav_order: 3
parent: Your first SN2 mod
---

# Coding your mod

Right, you've got everything set up, you've created your `main.lua` file, and you're ready to code.

Here's the full source code for our "Subnautica 2 Cheat" mod. We'll walk through each section below:

```lua
---@type table
local UEHelpers = require("UEHelpers")

---@type string
local MOD_NAME = "BeginnersGuideCheatMod"

---@type boolean
local debugMode = false

-- Simple helper function to log messages with the mod name as a prefix
---@param msg string
local function log(msg)
    print(string.format("[%s] %s\n", MOD_NAME, msg))
end

-- Hold a reference to the player's attribute set so we can modify it each tick
---@type UUWESurvivalAttributeSet|nil
local attrSet = nil

-- Function to find the player's survival attribute set in memory
---@return UUWESurvivalAttributeSet|nil
local function findPlayerAttrSet()
    ---@type UUWESurvivalAttributeSet[]|nil
    local all = FindAllOf("UWESurvivalAttributeSet")
    if not all then return nil end
    for _, set in ipairs(all) do
        if set:IsValid() and set:GetFullName():find("BP_Character_01_C") then
            return set
        end
    end
    return nil
end

-- When the player spawns, find and set the survival attribute set
NotifyOnNewObject("/Game/Blueprints/Character/player/BP_Character_01.BP_Character_01_C", function()
    ExecuteInGameThread(function()
        attrSet = nil
        attrSet = findPlayerAttrSet()
        if attrSet then
            log("Player character created - survival attributes found! Infinite Oxygen, Food, and Water enabled!")
        end
    end)
end)

-- Loop every 500ms to keep oxygen, food, and water at their maximum values
LoopAsync(500, function()
    ExecuteInGameThread(function()
        if not attrSet or not attrSet:IsValid() then
            -- If we're in debug mode, don't wait for the player to respawn. This allows us to hot reload the mod
            -- by setting debugMode to true
            if(debugMode) then
                log("Survival attribute set not found or invalid. Attempting to find it again...")
                attrSet = findPlayerAttrSet()
            end
            return
        end

        -- Oxygen
        ---@type number
        local maxOxygen = attrSet.MaxOxygen.CurrentValue
        attrSet.Oxygen.BaseValue = maxOxygen
        attrSet.Oxygen.CurrentValue = maxOxygen

        -- Food
        ---@type number
        local maxFood = attrSet.MaxFood.CurrentValue
        attrSet.Food.BaseValue = maxFood
        attrSet.Food.CurrentValue = maxFood

        -- Water
        ---@type number
        local maxWater = attrSet.MaxWater.CurrentValue
        attrSet.Water.BaseValue = maxWater
        attrSet.Water.CurrentValue = maxWater
    end)
    return false
end)

log("Loaded!")
```

## Annotations

You'll see in the code that we "annotate" the local variable declarations and function parameters and return values. Annotations are those lines prefixed by "---". For example:

```lua
-- Hold a reference to the player's attribute set so we can modify it each tick
---@type UUWESurvivalAttributeSet|nil
local attrSet = nil
```

Annotations are just there to help VS Code identify the various types and classes. When you explicitly specify the type or class of a variable or function, via an annotation, VS Code can highlight possible issues and incompatibilities, as well as offer code completion suggestions as you're developing your mod. It's well worth using annotation wherever possible, as it will just make your life easier, and save you lots of potential headaches in the future. 

## Setup and logging

```lua
---@type table
local UEHelpers = require("UEHelpers")

---@type string
local MOD_NAME = "BeginnersGuideCheatMod"

---@type boolean
local debugMode = true

-- Simple helper function to log messages with the mod name as a prefix
---@param msg string
local function log(msg)
    print(string.format("[%s] %s\n", MOD_NAME, msg))
end
```

`UEHelpers` is a utility library bundled with UE4SS that provides some handy convenience functions. We're not using it a lot here, but it's good practice to include it. You can see what functions it offers in the [UE4SS GitHub repository](https://github.com/UE4SS-RE/RE-UE4SS/blob/main/assets/Mods/shared/UEHelpers/UEHelpers.lua). Our little log helper simply prefixes our print output with the mod name, which makes it easy to spot our messages in the UE4SS console.

Having a `debugMode` is really useful. You can refer to this in your code to add additional functionality and logging that you use while you're developing the mod. For example, you might log additional information or debug messages, or you might skip or add specific functionality when debugging is enabled. You can quickly change this between `true` and `false` as you're working. Just remember to ship your mod with `debugMode` set to `false`.

## Finding the player's attribute set

```lua
-- Hold a reference to the player's attribute set so we can modify it each tick
---@type UUWESurvivalAttributeSet|nil
local attrSet = nil

-- Function to find the player's survival attribute set in memory
---@return UUWESurvivalAttributeSet|nil
local function findPlayerAttrSet()
    ---@type UUWESurvivalAttributeSet[]|nil
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

## Finding the reference on spawn

```lua
-- When the player spawns, find and set the survival attribute set
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

Rather than searching for the attribute set on every loop tick, we use `NotifyOnNewObject()` to watch for the player character being created. This fires both on initial spawn and on respawn after death, which means we always have a fresh reference. We explicitly set `attrSet` to `nil` before re-acquiring it to ensure we're never holding a stale reference to an old instance.

The asset path ""/Game/Blueprints/Character/player/BP_Character_01.BP_Character_01_C" is the "concrete" player character class that we identified in FModel. This is distinct from the base `BP_SN2PlayerCharacter` class in Blueprints/Core. Using the concrete class ensures the callback fires at the right point in the character's initialisation.

## Polling and updating the attributes

```lua
-- Loop every 500ms to keep oxygen, food, and water at their maximum values
LoopAsync(500, function()
    ExecuteInGameThread(function()
        if not attrSet or not attrSet:IsValid() then
            -- If we're in debug mode, don't wait for the player to respawn. This allows us to hot reload the mod
            -- by setting debugMode to true
            if(debugMode) then
                log("Survival attribute set not found or invalid. Attempting to find it again...")
                attrSet = findPlayerAttrSet()
            end
            return
        end

        -- Oxygen
        ---@type number
        local maxOxygen = attrSet.MaxOxygen.CurrentValue
        attrSet.Oxygen.BaseValue = maxOxygen
        attrSet.Oxygen.CurrentValue = maxOxygen

        -- Food
        ---@type number
        local maxFood = attrSet.MaxFood.CurrentValue
        attrSet.Food.BaseValue = maxFood
        attrSet.Food.CurrentValue = maxFood

        -- Water
        ---@type number
        local maxWater = attrSet.MaxWater.CurrentValue
        attrSet.Water.BaseValue = maxWater
        attrSet.Water.CurrentValue = maxWater
    end)
    return false
end)
```

This loop runs every 500 milliseconds, and you can obviously tweak that to whatever poll frequency you want. On each "tick" it first checks whether we have a valid reference to the attribute set - if not, do nothing. We're waiting at this point for the player to spawn and for the survival attributes component to be found. Once found, it reads the current max value for each attribute and sets both `BaseValue` and `CurrentValue` to that max. We set both because Unreal's Gameplay Ability System maintains these separately, and setting only one may not produce the result you expect.

## Testing the mod

Save main.lua and launch the game. UE4SS will load your mod automatically on startup. Watch the UE4SS console - you should see:

`[Subnautica2CheatMod] Loaded!`

And once you're in game and the player character is initialised:

`[Subnautica2CheatMod] Player character created - survival attributes found! Infinite Oxygen, Food, and Water enabled!`

If you make changes to main.lua while the game is running, you can reload all mods without restarting by pressing Ctrl+R while the game window has focus. Note that this won't work if focus is on the UE4SS console window - click back into the game first. This is called "hot reload" and is the most amazing thing I've ever come across, especially having spent most of my time working with Unity mods! It makes tweaking and testing so much quicker, it is, quite literally, unreal!

> [!NOTE]
>
> When you make a change then "hot reload", you may notice your changes aren't taking effect. Remember that our particular mod is effectively "triggered" by the player object being created. So you typically would need to quit and reload to see your changes. We've accomodated for this by checking the `debugMode` variable in the loop. So if you're testing with hot loading, don't forget to set `debugMode` to true to force the mod to find the `SurvivalAttributeSet` each time.
>

## Building on this pattern

You'll see a pattern here:

- Watch for object creation with `NotifyOnNewObject`
- Find a class with `FindAllOf`
- Filter to the right instance
- Hold a reference
- Poll to keep values updated

It's a pretty handy pattern to keep in mind, and you might come across it in other mods you see and build yourself. Once you're comfortable with it, you can apply it to almost anything you find through Live View and the Lua types. The survival attributes are a good example, but the same approach works for health, energy, temperature, or any other attribute set in the game.
