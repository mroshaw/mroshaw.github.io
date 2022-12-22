---
title: Visual Studio configuration
nav_order: 4
parent: Advanced modding
---



# Visual Studio configuration

There are a number of tools and tricks that you can use in Visual Studio to make your life as a modder that much easier. I'll add more to this as I progress!

## Build events

Compiling your project produces an assembly in the default location within your project folder structure. Normally, this is within `bin\Debug` or `bin\Release`, depending on your compile options.

Build events allow us to a bit more with the compiled assembly, and associated files, pre or post build. A good use case here is for a post build activity to deploy your mod to the Subnautica game, so that you can test it. This avoids having to manually copy and paste DLL files each time you want to test.

Here's a really straight forward `Post-build event` script that will run immediately after a successful build:

```powershell
mkdir "C:\Games\Steam\steamapps\common\SubnauticaZero\QMods\$(TargetName)"
xcopy /q/y/i "$(TargetPath)" "C:\Games\Steam\steamapps\common\SubnauticaZero\QMods\$(TargetName)" /E /H /C
xcopy /q/y/i "$(ProjectDir)\mod.json" "C:\Games\Steam\steamapps\common\SubnauticaZero\QMods\$(TargetName)\mod.json" /E /H /C
```

This will copy the output assembly (your mod DLL in this case) to a folder in the Below Zero mod folder. The script will attempt to create the folder first, in case it doesn't already exist. It will also copy over the `mod.json` file for your chosen mod, assuming it's in the root of your project.

It's really useful to have this in each of your projects, and there is a way to "default" this for new projects. See the next section for details!

## Compiling for both Subnautica and Below Zero

As the games are so similar in structure, it is often possible to build a mod that works with both games. As you might expect, there are difference that you may have to account for in your code, but there are ways to achieve this in Visual Studio.

First up, we'll create some `configurations` to allow us to do different things with different games:

1. In Visual Studio, click the `Build` menu and select `Configuration Manager`
2. In `Active solution configuration` click the drop down and select `New...`
3. Give it a name, `Subnautica`, copy settings from `Release` and click `OK`
4. Repeat for a new configuration called `Below Zero`
5. While `Below Zero` is selected as the `Active solution configuration`, go down the list and tick `Build` next to the mods relevant to that game
6. Now select `Subnautica` and do the same

As you can see from the screenshots below, I have a bunch of mods that will work with Below Zero, one that'll work with Subnautica, and one that will work for both:

![](.\media\associatedconfig_bz.png)

![](.\media\associatedconfig_sn.png)

Okay, we're getting somewhere!

For each of you projects, right click, select `Properties` and go into the `Build` item. If you then select one of your game configurations from the `Configuration` drop down, you can set a series of constant values that will be used to explicitly ring fence code intended for that game only.

So pick `Below Zero` from the drop down, and enter `BELOWZERO;BZ` in the `Conditional compilation symbols` box. Change the drop down to `Subnautica` and enter `SUBNAUTICA;SN` in the box.

You can now ring fence code for compilation only when the target configuration is Below Zero or Subnautica using these `if` and `endif` directives, something like the following:

```c#
    public class Class1
    {
        void Test()
        {
#if SN
            Console.Write("This is for Below Zero!");
#endif

#if BZ
            Console.Write("This is for Subnautica!");
#endif
        }
    }
```

What's really cool here is that Visual Studio will only syntax highlight the relevant code when you select the corresponding configuration, so you can see exactly what you're going to get when the mod is compiled for that particular game.

So, you can now select your game configuration and right click and `Build` for each of the mods in your solution, automatically deploying them to the appropriate game location!



