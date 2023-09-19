---
title: Subnautica Runtime Editor
nav_order: 4
parent: Advanced modding
---

# Subnautica Runtime Editor

One of the biggest challenges when you begin modding is finding out, well, where to begin! The Unity component framework, and the developers individual style and process to implement Subnautica, mean it can be quite a challenge to dig around class, fields and code to try to find what you need.

A fantastic way to help you with this is by using one of the many awesome "Runtime Editor" tools that are out there today. Whereas dnSpy allows you to peruse the de-compiled code for logic, methods names and parameter definitions, these tools allow you to explore "real time" instances of game objects within the game, so you can directly observe the configuration and components in use, their behaviour and the changes your code is making to the game.

I've been using  "Subnautica Runtime Editor", which is a branch of a great open source tool called "Unity Runtime Editor". You can download this great tool from [Submodica](https://submodica.xyz/mods/sn1/109), or you can download and install the "Unity" version from the [authors GitHub](https://github.com/ManlyMarco/RuntimeUnityEditor).

There are a number of such tools available for download, and you're encouraged to search them out, give them a try, and find out what works best for you.

Simply unzip the DLL and copy it into the game BepInEx plugins folder. For me, that's:

`<game>\BepInDex\plugins`

Now launch the game and you should see something like this. If you don't, try pressing F7 to toggle the display of the console windows:

![](.\media\runtimeeditor.png)

Once you've got this working, click play and load up a save game.

Within the Object Explorer, search for "Player".Click on the "Player", and you'll see a "real time" view of properties of the player character. You can review and tweak properties within this, to find values of interest and observe the behaviour of changes that you make, in real time.

![](.\media\runtimeeditorplayer.png)

In the bottom right, click `LiveMixin`. This is a frequently used component that gives a game object functionality and fields that manage health and damage. You'll see a field called `health`. Click that, and change the value to "50.0". Press F7 to toggle away the windows, and you should see that your player character health has dropped to 50%:

![](.\media\unityexplorerplayerhealth50.png)

You now know exactly how to impact the player's current health, and you know exactly how that change will be reflected in the game and in the players gaming experience. As you can imagine, this is a significantly more efficient process than looking up info in dnSpy, writing code, building a DLL, deploying, reloading the game and testing.

I'll add more information in here as I begin to explore the functionality and possibilities of this superb tool.
