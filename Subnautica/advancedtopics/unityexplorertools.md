---
layout: default
title: Unity explorer tools
nav_order: 3
parent: Advanced modding
---

# Unity explorer tools

One of the biggest challenges when you begin modding is finding out, well, where to begin! The Unity component framework, and the developers individual style and process to implement Subnautica, mean it can be quite a challenge to dig around class, fields and code to try to find what you need.

A fantastic way to help you with this is by using one of the many awesome "Unity Explorer" tools that are out there today. Whereas dnSpy allows you to peruse the compiled code for information, these tools allow you to explore "real time" instances of the code, so you can directly observe behaviour and the changes your code is making to the game.

For this tutorial, I'm using "Unity Explorer" by sinai-dev. You can download this great tool from [their GitHub repository](https://github.com/sinai-dev/UnityExplorer/releases).

There are a number of such tools available for download, and you're encouraged to search them out, give them a try, and find out what works best for you.

For now, down the latest version of "Unity Explorer" for BepInEx version 5, which is the version that ships with QModManager at the time of writing. Be sure to check the [QModManager](https://github.com/SubnauticaModding/QModManager/wiki) Wiki for any changes to this dependency.

Simply unzip the DLL and copy it into the game BepInEx plugins folder. For me, that's:

`<game>\BepInDex\plugins`

Now launch the game and you should see something like this. If you don't, try pressing F7 to toggle the display of the console windows:

![](.\media\unityexplorerhome.png)

Once you've got this working, click play and load up a save game.

Within the Object Explorer, search for "Player". You should see a "top level" object called "Player", shown in green text. Click on this, and you'll see a "real time" view of properties of the player character. You can review and tweak properties within this, to find values of interest and observe the behaviour of changes that you make, in real time.

![](.\media\unityexplorerplayerhealth.png)

In the `Components` window, click `LiveMixin`. This is a frequently used Component that gives a Game Object functionality and fields that manage health and damage. You'll see a field called `health`. Click that, and change the value to "50.0" and click `Apply`. Press F7 to toggle away the windows, and you should see that your player character health has dropped to 50%:

![](.\media\unityexplorerplayerhealth50.png)

You now know exactly how to impact the player's current health, and you know exactly how that change will be reflected in the game and in the players gaming experience. As you can imagine, this is a significantly more efficient process than looking up info in dnSpy, writing code, building a DLL, deploying, reloading the game and testing.

I'll add more information in here as I begin to explore the functionality and possibilities of this superb tool.
