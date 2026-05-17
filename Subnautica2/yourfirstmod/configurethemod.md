---
title: Coding your mod
nav_order: 2
parent: Your first SN2 mod
---

# Configure the mod

Now that we know what we need to do, we can create a LUA mod to implement game behaviour changes to prevent our player from suffocating or starving.

## Mod set up

We create our mod directly in the UE4SS mod folder so that we can build and test it quickly. Later on, we'll move it into our development folder and get it all checked in to GitHub.

So, for now:

1. Start by creating a folder in `\Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Mods`, call it `Subnautica2CheatMod`.
2. Within that folder, create an empty file called `enabled.txt`.
3. Within this folder create a folder called `scripts`.

4. Within that folder, create a file called `main.lua`.

5. Open this file in a text editor of your choice.


## Coding the mod

Referring back to what we found earlier, we can code the mod as follows:

```lua
local UEHelpers = require("UEHelpers")
local MOD_NAME = "Subnautica2CheatMod"

local function log(msg)
    print(string.format("[%s] %s\n", MOD_NAME, msg))
end

-- We want to find the UWESurvivalAttributeSet that belongs to the player
local attrSet = nil

-- Search across instances of UWESurvivalAttributeSet to find the players attributes
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

-- Poll the players Oxygen, Food, and Water, and keep topping up to Max values
LoopAsync(500, function()
    ExecuteInGameThread(function()
        if not attrSet or not attrSet:IsValid() then
            attrSet = findPlayerAttrSet()
            if attrSet then
                log("Player survival attributes found, infinite oxygen/food/water active!")
            end
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
end)

log("Loaded!")
```

