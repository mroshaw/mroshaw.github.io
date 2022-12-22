---
title: Coding your mod - BepInEx
nav_order: 6
parent: Your first Subnautica mod

---

# Coding your mod

![](..\images\bepinex.png) 

Unlike QmodManager, BepInEx doesn't need or use a `mod.json` file. Details of the mod are provided in the patch code.

Time to write some C# code. Just to note, each time we add some code, I'll show the full content of the file at that point in time. It will make this section seem longer, but it will hopefully remove any confusion of what goes where and when.

What I do, and this is completely down to personal preference, is to have a single class to handle registering the mod and managing options. I always call this class `QMod`, but you can call it whatever you want. We'll stick with this for the tutorial.

**NOTE:** When I refer to `your project`, don't confuse that with `your solution`! Your solution is `Subnautica Mods`, your project is `MyFirstSubnauticaMod_BZ`.

By default, the template will have created a class for you. Right click `Class1.cs` within your project and choose rename. Give the class a name such as `KnifeDamagePlugin`. Visual Studio will helpfully rename the class for you, as well as the file.

You\'ll want to refer to those lovely references we added, so first up, add these statements. This allows us access to the Harmony classes and methods necessary to patch in our mod code, as well as BepInEx classes and methods for things like logging:

```c#
using BepInEx;
using BepInEx.Logging;
using HarmonyLib;
```

We'll need to tell Harmony to patch our code, so add this into an `Awake()` method with the appropriate annotations in place:

```c#
using BepInEx;
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

        private static readonly Harmony harmony = new Harmony(myGUID);

        public static ManualLogSource logger;

        private void Awake()
        {
            harmony.PatchAll();
            Logger.LogInfo(pluginName + " " + versionString + " " + "loaded.");
            logger = Logger;
        }
    }
}
```

Some things to note:

1. The `myGUID` value aims to be unique across all mods. This can technically be anything, but a recommended approach is to use something like: `Your name / Discord name.Mod Name`, as I've done in the example above.
2. The second and third parameters should reflect the name of the mod and current version.

Great stuff. This gives us what we need to load a mod, patch some code, and do some good!

So, we probably want to do something with the game code. Again, personal preference, but I like to create a new class for each class that I'm impacting. For the tutorial, we'll just go with something simple, and create a new class file to hold our custom knife code. Do that by right clicking on your project and selecting `Add item...`. Select `Class` and give it a sensible name. For this tutorial, we'll go for `KnifeDamageMod.cs`.

At this stage, your Visual Studio project should look a bit like this:

![](.\media\firstmodclassproject_bepinex.png)

Open up new class file and add these using statements. This gives us the basics of what we need to tell Harmony what we're up to, and for us to reference game objects within our mod code:

```{csharp}
using HarmonyLib;
```

We're going to patch the `PlayerTool`, remember, and because that's the class underpinning the `Knife` class that we want to patch. So, we'll tell Harmony to patch the `Awake` method of the `PlayerTool` class:

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
				// Our code goes here
            }
        }
    }
}
```

The `Start` and `Awake` methods are really useful `MonoBehavior` class methods. If implemented in a class, these are thungs that we can use that always run only once when an instance of that class is created. So, if we want to tweak something when a knife instance is created, this is the place to do it. Something that you should be aware of is that the `Start` and `Awake` methods are executed for **every instance** of the class. This is important when you're patching object instances that might be components in more than one parent. For example, `SeaTrackMotor` class instances are used in a number of game objects, including not only the "Cab", but also the Aquarium and Docking modules. So patching `Start` or `Awake` on the `SeaTruckMotor`class will impact all of those instances, which may or may not be what you want.

**NOTE:** What you call your classes isn't important. It's the `annotations`that matter - those are the values you see in square brackets within the code. You can find lots of information about these, and how Harmony works, in the [Harmony user guide](https://harmony.pardeike.net/articles/intro.html), but we'll talk a little about these below. I would suggest a convention, such as the one in the examples. That is, a class named after the type of object that you're patching, and methods that reflect the patched method, with either a Prefix or Postfix part on the end.

First of all, we want to see if the `PlayerTool` that has been woken up, so to speak, is actually the base class instance of our `Knife`:

```c#
using HarmonyLib;
using Logger = QModManager.Utility.Logger;

namespace Mroshaw.KnifeDamageModSN
{
    public static class KnifeDamageMod_SN
    {
        [HarmonyPatch(typeof(PlayerTool))]
        public static class PlayerTool_Patch
        {
            [HarmonyPatch(nameof(PlayerTool.Awake))]
            [HarmonyPostfix]
            public static void Awake_Postfix(PlayerTool __instance)
            {
                // Check to see if this is the knife
                if (__instance.GetType() == typeof(Knife))
                {
					// Our code goes here
                }
            }
        }
    }
}
```

So, we have an instance of `PlayerTool` and we've cast it to the `Knife` type, so that we can start to make some changes.

What you can also see here is that if the object is not of type `Knife`, we do nothing. As this is a `PostFix` patch, we just let the game carry on as if nothing has happened. Only when we see the `Knife` waking up, do we want to execute code. So, any other `PlayerTool` that's instantiated and waking will continue to be unaffected by our mod.

We're going to manipulate the properties of the Knife, so if we refer back to our dnSpy analysis, you'll recall the `Knife` had a `damage` attribute. We can access that now that we've got a handle to the `Knife` object:

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
                    Knife knife = __instance as Knife;
                    // Double the knife damage
                    float knifeDamage = knife.damage;
                    float newKnifeDamage = knifeDamage * 2.0f;
                    knife.damage = newKnifeDamage;
  
                    KnifeDamagePlugin_SN.logger.Log(LogLevel.Info, $"Knife damage was: {knifeDamage}," +
                        $" is now: {newKnifeDamage}");
                }
            }
        }
    }
}
```

You're probably wondering what those first two lines are:

```c#
[HarmonyPatch(nameof(PlayerTool.Awake))]
[HarmonyPostfix]
```

and this one:

`[HarmonyPostfix]`

These are what are called "annotations" and these form the basis of how Harmony hooks your code into the game. In the first two lines, you're telling harmony to patch the `Start` method of the `Knife` class, executing your `KnifeDamageMod`code.

And at what point should Harmony run your code? Well, that's where `[HarmonyPostfix]` comes in. You might remember in an earlier section where we talked about Harmony patching, and how we can run code before the game code (`[HarmonyPrefix`) or after the game code (`[HarmonyPostfix]`). Here, we want to tweak the `Knife` instance after it's been created, so we use `HarmonyPostfix`.

One other thing to consider here is the method definition. We have some options here around what parameters we specify in our `PostFix` method:

1. We can always include `__instance` in our method arguments, and this will always pass in the class instance on which the method was invoked.

2. We can also pass in parameters from the game method, if we want to manipulate or refer to those, either directly or by reference.

3. We can specify `__result` as a `ref` parameter of the same type used by the patched method, to override the return value of the patched method, if it happens to have a return value. For example, if we're patching a method that takes two `int` parameters and returns a `float`, and we wanted to manipulate that return value, we could write:

```c#
[HarmonyPostPreFix]
public static bool KnifeMethodWithReturn(Knife __instance, int param1, int param2, ref float __result)
{
    // Check the input params
    if(param1 > param2)
    {
        // Manipulate the float return
        __result = 0.0f;
​
        // Bypass the patched method
        return false;
    }
    else
    {
        // Continue to call the patched method
        return true;
    }
}
```

Note that in a scenario where you are using a `HarmonyPrefix` patch, you can use a return type of `bool` to determine whether to continue to execute the game class method (return `true`) or whether to skip the game class method (return `false`). That way, you can choose to do something first, then allow the method to continue or completely override the method altogether, bypassing the game code.

Things get quite involved at this point, as there are a number of rules and options that apply to your method definition, depending on what you want to do and what Harmony annotation you're using. The best place to find out more is in the [Harmony documentation](https://harmony.pardeike.net/articles/patching.html), which explains the concepts in detail.

Anyway, enough of this theoretical nonsense! Go back to your code and check it's all there. If so, we're good to go!

You can build this now by right clicking the project and selecting `Build`. All going well, you'll see `Build succeeded`. If not, go back through and check your code.

You can also find the full source for this part of the tutorial [in this GitHub repository](https://github.com/mroshaw/BeginnersGuideModSubnautica), so if you have any problems whatsoever, have a look at the source in the repo and compare it to what you have.

Your `Post Build Scripts` should also have run, creating a folder in your game location and copying in the DLL file, giving the game everything it needs to run your snazzy new mod!

