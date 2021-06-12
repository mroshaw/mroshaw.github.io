---
layout: default
title: Coding your mod
nav_order: 4
parent: Your first mod
---

# Coding your mod

In order to activate your mod, QModManager needs to know a bit about it. This is where the `mod.json` file comes in. Every mod has to have a `mod.json` file, so right click your project, select `Add new item...` and in the name, use `mod.json`. If Visual Studio has picked a template, don't worry, just select all and delete the content that it's added.

Now, enter in the details about your mod:

```json
{
  "Id": "MyFirstSubnauticaMod_BZ",
  "DisplayName": "My First Subnautica Mod",
  "Author": "Oli Ollerenshaw",
  "Version": "1.0.0",
  "Enable": true,
  "AssemblyName": "MyFirstSubnauticaMod_BZ.dll",
  "VersionDependencies": {
    "SMLHelper": "2.9.6"
  },
  "Game": "BelowZero"
}
```

The important items here are the Assembly name, dependencies and game.

-   **Assembly name** -- must match the name of the DLL that you are building

-   **Version Dependencies** -- must call out other dependent mods and the version supported

-   **Game** -- can be either BelowZero or Subnautica

**NOTE:** It's a good idea to keep on top of this, as well as the details of your Assembly, as mods like VersionChecker and QModManager itself, can make good use these values.

Okay, we're looking good. Now we can write some C#.

What I do, and this is completely down to personal preference, is to have a single class to handle registering the mod and managing options. I always call this class `QMod`, but you can call it whatever you want. We'll stick with this for the tutorial.

**NOTE:** When I refer to `your project`, don't confuse that with `your solution`! Your solution is `Subnautica Mods`, your project is `MyFirstSubnauticaMod_BZ`.

By default, the template will have created a class for you. Right click `Class1.cs` within your project and choose rename. Give the class a name such as `QMod`. Visual Studio will helpfully rename the class for you, as well as the file.

You\'ll want to refer to those lovely references we added, so first up, add these statements. This will also set you up with a great feature of QMod, which is a log file that you can write to for debugging:

```c#
using System.Reflection;
using HarmonyLib;
using QModManager.API.ModLoading;
using Logger = QModManager.Utility.Logger;
```

We'll need to tell Harmony to patch our code, so add this into the `Patch()` method:

```c#
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
```

The `modName` generated above needs to be unique across mods -- this prevents mods interfering or otherwise messing with each other. The `<someuniquevalue>` should be replaced with something, well, unique. I tend to use my Discord / Github username, but it's entirely up to you:

```c#
var modName = ($"mroshaw_{assembly.GetName().Name}");
```

**NOTE:** You'll see some calls to the Logger here. These are super useful to help debug your code. Just remember to use `Level.Info` for high level logging only. For detailed logging, especially in code that gets called a lot, remember to use `Level.Debug`. The last thing you need is to fill players log files with millions of lines of debug text!

Okay, so we probably want to do something with the game code! Again, personal preference, but I like to create a new class for each class that I'm impacting. For the tutorial, we'll just go with something simple. Do that by right clicking on your project and selecting `Add item...`. Select `Class` and give it a sensible name. For this tutorial, we'll go for `MyFirstMod.cs`.

At this stage, your Visual Studio project should look a bit like this:

![](.\media\firstmodclassproject.png)

Open up new class file and add these using statements. This gives us the basics of what we need to tell Harmony what we're up to, and for us to reference game objects within our mod code:

```{csharp}
using HarmonyLib;
```

We're going to patch the "Knife", and make it do mega damage. So, we'll tell Harmony to patch the "Awake" method of the "Knife" class:

```c#
[HarmonyPatch(typeof(Knife))]
[HarmonyPatch("Start")]
internal class KnifeDamageMod
{
}
```

The `Start` method is a really useful class method. If implemented in a class, it's something we can use that's always run only once when it comes to instances of that class. So, if we want to tweak something when a knife instance is created, this is the place to do it.

**NOTE:** What you call your classes isn't important. It's the attributes that matter. You can find lots of information about these, and how Harmony works, in the [Harmony user guide.](https://harmony.pardeike.net/articles/intro.html)

We're going to manipulate the properties of the Knife, after it's been started. At this point, we're going to tweak the damage field to make it super powerful. This is what the code looks like:

```c#
[HarmonyPatch(typeof(Knife))]
[HarmonyPatch("Start")]
internal class KnifeDamageMod
{
    [HarmonyPostfix]
    public static void Postfix(Knife __instance)
    {
	// Double the knife damage
	float knifeDamage = __instance.damage;
	float newKnifeDamage = knifeDamage * 2;
	__instance.damage = newKnifeDamage;
	Logger.Log(Logger.Level.Debug, $"Knife damage was: {knifeDamage}," +
	    $" is now: {newKnifeDamage}");
    }
}
```

And we're done!

You can build this now by right clicking the project and selecting `Build`. All going well, you'll see `Build succeeded`. If not, go back through and check your code. You can also find the full source for this part of the tutorial [on my GitHub](https://github.com/mroshaw/SubnauticaMods/tree/main/MyFirstSubnauticaMod_BZ).
