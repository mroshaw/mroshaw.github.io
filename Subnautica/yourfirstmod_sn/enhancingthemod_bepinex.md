---
title: Enhancing your mod - BepInEx
nav_order: 9
parent: Your first Subnautica mod
---

# Enhancing your mod

![](..\media\bepinex.png) 

Now that you've got some code working away and changing game behaviour, you can start to add some features. Let's allow the player to choose a multiplier for knife damage, rather than defaulting to double.

BepInEx provides a feature called "Configuration" that allows us to do just this, and it's pretty simple to do.

First up, in your "plugin" class, we'll add some entries to allow the player to amend a "float" value, that we'll use as a damage multiplier. We'll need a couple of blocks:

```c#
// Declare damage multiplier config entry
public static ConfigEntry<float> ConfigKnifeDamageMultiplier;
```

and

```c#
// Setup damage multiplier config entry
ConfigKnifeDamageMultiplier = Config.Bind("General",        // The section under which the option is shown
	"KnifeDamageMultiplier",       							// The key of the configuration option
	1.0f,                          							// The default value
	"Knife damage multiplier.");   							// Description of the config value
```

In a nutshell, we're defining a new static configuration entry called `ConfigKnifeDamageMultiplier`. By making it `static`, we can access it from within our mod class, which we'll see later on.

The actual config entry is made up of four elements, which are used by BepInEx to create a config file entry for our mod. This is how that code looks in your plugin class:

```c#
using BepInEx;
using BepInEx.Configuration;
using BepInEx.Logging;
using HarmonyLib;

namespace Mroshaw.KnifeDamageModSN
{
    [BepInPlugin(myGUID, pluginName, versionString)]
    public class KnifeDamagePlugin_SN : BaseUnityPlugin
    {
        private const string myGUID = "com.mroshaw.knifedamagemodsn";
        private const string pluginName = "Knife Damage Mod SN";
        private const string versionString = "1.0.0";

        // Enhancing the MOD
        // Declare damage multiplier config entry
        public static ConfigEntry<float> ConfigKnifeDamageMultiplier;

        private static readonly Harmony harmony = new Harmony(myGUID);
        public static ManualLogSource logger = new ManualLogSource(pluginName);

        private void Awake()
        {
            // Enhancing the MOD
            // Setup damage multiplier config entry
            ConfigKnifeDamageMultiplier = Config.Bind("General",        // The section under which the option is shown
                "KnifeDamageMultiplier",                                // The key of the configuration option
                1.0f,                                                   // The default value
                "Knife damage multiplier.");   							// Description of the config value

            // Patch in our MOD
            harmony.PatchAll();
            Logger.LogInfo($"PluginName: {pluginName}, VersionString: {versionString} is loaded.");
            logger = Logger;
        }
    }
}
```

Now, to actually use the configuration you can access the value in your mod class using this:

```c#
// Get the damage multiplier from the config file.
float damageMultiplier = KnifeDamagePlugin_SN.ConfigKnifeDamageMultiplier.Value;
```

So your damage mod class should look something like this:

```c#
using HarmonyLib;
using BepInEx.Logging;

namespace Mroshaw.KnifeDamageModSN
{
    /// <summary>
    /// Class to mod the knife
    /// </summary>
    public static class KnifeDamageMod_SN
    {
        [HarmonyPatch(typeof(PlayerTool))]
        public static class PlayerTool_Patch
        {
            [HarmonyPatch(nameof(PlayerTool.Awake))]
            [HarmonyPostfix]
            public static void Awake_Prefix(PlayerTool __instance)
            {
                // Check to see if this is the knife
                if (__instance.GetType() == typeof(Knife))
                {
                    // Enhancing the MOD
                    // Get the damage multiplier from the config file.
                    float damageMultiplier = KnifeDamagePlugin_SN.ConfigKnifeDamageMultiplier.Value;

                    // Get the Knife instance
                    Knife knife = __instance as Knife;

                    // Apply the damage multiplier
                    float knifeDamage = knife.damage;
                    float newKnifeDamage = knifeDamage * damageMultiplier;
                    knife.damage = newKnifeDamage;
  
                    // Write to the BepInEx log
                    KnifeDamagePlugin_SN.logger.Log(LogLevel.Info, $"Knife damage was: {knifeDamage}," +
                        $" is now: {newKnifeDamage}");
                }
            }
        }
    }
}
```

Compile your mod and ensure the DLL is deployed to your game's BepInEx folder. Now:

1. Run the game, and equip the knife.
2. Tab out of the game, and open Windows Explorer.
3. Navigate to your game folder and open up the BepInEx/config folder.
4. You should see a file called something like `com.mroshaw.knifedamagemodsn.cfg`.
5. Open this up in Notepad.

![](.\media\modconfigfilelocation.png)

You should see something like this:

```
## Settings file was created by plugin Knife Damage Mod SN v1.0.0
## Plugin GUID: com.mroshaw.knifedamagemodsn

[General]

## Knife damage multiplier.
# Setting type: Single
# Default value: 1
KnifeDamageMultiplier = 1
```

Amend the `KnifeDamageMultiplier` value and set it to 5 and save the file. Re-run the game, equip the knife and tab out of the game. Locate the BepInEx log file, same place as before, and open it in Notepad. You should see the new damage multiplier applied, with a new value of 100:

```c#
[Warning: QMMLoader] QModsToLoad is null!
[Message:   BepInEx] Chainloader startup complete
[Info   :   Console] Object reference not set to an instance of an object
[Info   :Knife Damage Mod SN] Knife damage was: 20, is now: 100
```

So there you have it, a configurable damage multiplier that allows the player to tweak your mod to their liking!

Note that the player will have to restart the game after making any changes to your mod configuration. I'll leave it as an exercise for you to figure out how to make this dynamic, and allow the player to change the value mid-game.

You can expand further on this, providing additional configuration options. You might also consider taking a look at the [BepInEx Configuration Manager plugin](https://github.com/BepInEx/BepInEx.ConfigurationManager), that adds a UI within the game that exposes plugin config entries:

![](.\media\bepinexconfman.png)

I'll leave it to you as an exercise to install this plugin and see how it works with your new mod.
