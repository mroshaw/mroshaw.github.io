---
layout: default
title: Enhancing your mod
nav_order: 7
parent: Your first bz mod
---

# Enhancing your mod

Now that you've got some code working away and changing game behaviour, you can start to add some features. Let's add a slider in the mod menu to allow the player to choose a multiplier for knife damage, rather than defaulting to double.

SML Helper comes to the rescue once again, and we can use some great features of this library to add entries in to the "Mod" menu in the game.

Back in your project, open up the `QMod.cs` file.

We're going to be using SML Helper functionality, so we'll need to add `using` statements to reference that library. We'll also create a new class called `Config` that extends `ConfigFile`. Note the use of `attributes` that will tell SML Helper what to do with our code. Your `QMod.cs` file should look a bit like this:

```c#
using System.Reflection;
using HarmonyLib;
using QModManager.API.ModLoading;
using Logger = QModManager.Utility.Logger;
// ### Enhancing the mod ###
using SMLHelper.V2.Json;
using SMLHelper.V2.Options.Attributes;
using SMLHelper.V2.Handlers;

namespace KnifeDamageMod_BZ
{
    [QModCore]
    public static class QMod
    {
        // ### Enhancing the mod ###
        // Set up an instance of the Config class, allowing the player to configure our mod
        internal static Config Config { get; } = OptionsPanelHandler.Main.RegisterModOptions<Config>();

        [QModPatch]
        public static void Patch()
        {
            var assembly = Assembly.GetExecutingAssembly();
            var modName = ($"<someuniquevalue>_{assembly.GetName().Name}");
            Logger.Log(Logger.Level.Info, $"Patching {modName}");
            Harmony harmony = new Harmony(modName);
            harmony.PatchAll(assembly);
            Logger.Log(Logger.Level.Info, "Patched successfully!");
        }
    }

    /// <summary>
    // ### Enhancing the mod ###
    /// Set up the Mod menu
    /// </summary>
    [Menu("Knife Damage")]
    public class Config : ConfigFile
    {
        /// <summary>
        /// Slider element for float value of the modifiers. We'll allow 1.0 (unchanged) to 5.0 (death bringer).
        /// Default to 1.0;
        /// </summary>
        [Slider("Knife modifier", Format = "{0:F2}", Min = 1.0F, Max = 5.0F, DefaultValue = 1.0F, Step = 0.1F)]
        public float KnifeModifier = 1.0F;
    }
}
```

SML Helper is utterly amazing, and it just makes the whole process so incredibly straight forward. What this code will do is to add a new menu with a slider control. Changes made to that control will be available to us in our code, by referring back to the `KnifeModifier` field in our class instance. Brilliant!

So, the rest is even easier! Open up the `KinfeDamageMod.cs` file and find the code we wrote to modify the knife damage. We need to replace that "2" with the value our player has selected:

```c#
using HarmonyLib;
using Logger = QModManager.Utility.Logger;

namespace KnifeDamageMod_BZ
{
    /// <summary>
    /// Class to mod the knife
    /// </summary>
    class KnifeDamageMod
    {
        [HarmonyPatch(typeof(Knife))]
        [HarmonyPatch("Start")]
        internal class PatchKnifeStart
        {
            [HarmonyPostfix]
            public static void Postfix(Knife __instance)
            {
                // ### Enhancing the mod ###
                // Get the damage modifier
                float damageModifier = QMod.Config.KnifeModifier;

                // Multiply the damage by our modifier
                float knifeDamage = __instance.damage;
                float newKnifeDamage = knifeDamage * damageModifier;
                __instance.damage = newKnifeDamage;
                Logger.Log(Logger.Level.Debug, $"Knife damage was: {knifeDamage}," +
                    $" is now: {newKnifeDamage}");
            }
        }
    }
}
```

Make your changes, compile and then test again.

When you start the game, go into Options > Mod and check out your new mod menu:

![](.\media\knifedamagemodmenu.png)

Move the slider to set the damage modifier and start your game. Don't forget to check in `qmodmanager_log-Subnautica.txt` if you're having problems.

As you can see, you can slowly start to add more and more features to you mod, enhancing and testing as you go.

Some ideas to take this even further:

1. The knife damage modifier is only applied in the `Start` method, so the player will have to restart the game if they want to change this while in mid-game. How could you solve this?
2. Perhaps the player should pay a penalty for using an overpowered knife? How could you deplete the players oxygen by an appropriate amount, perhaps because of the effort involved in doing the extra damage?

The answers are there, they just need a lot of digging to find, a lot of time and patience, and help and advice from a very friendly and helpful Discord group!

