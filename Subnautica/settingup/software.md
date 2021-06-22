---
layout: default
title: Software and tools
nav_order: 1
parent: Setting up for development
---

# Software you'll need

You'll want to setup your development machine with the following tools:

-   **Visual Studio** - this is where we'll write our mod code.

-   **dnSpy** - this essential tool helps you to explore the code in the game and find useful methods and fields to target and modify.

-   **QMod Manager** - this will help integrate your mod into the game, as well as provide useful functions to simplify your code.

-   **SML Helper** - not mandatory, but this mod provides loads of useful functions so that you don't have to "reinvent the wheel" when it comes to working with the lower level tools and functions involved in modding the game. For example, SML Helper takes away a lot of work when it comes to hooking methods with Harmony, and presenting menus with QMod Manager.

-   **BepInExPublicizer** - not mandatory, but this plugin "unlocks" protected methods and fields in game objects that makes modding much more powerful.

-   **Vortex** - not mandatory, but useful for installing and updated base mods in your games.

-   **GitHub Desktop** - not mandatory, but good to manage your source code in a Git repository, which will allow you to share and collaborate with others.

-   **Subnautica / Below Zero** - you'll need to have games themselves installed, of course!

Here's a simple checklist of the tools, the versions used at the time of writing, and where to get them:

| Tool Name                | Version Used           | Where to download                                            |
| ------------------------ | ---------------------- | ------------------------------------------------------------ |
| Visual Studio            | 2019 Community Edition | [Microsoft.com](https://visualstudio.microsoft.com/vs/community/) |
| dnSpy                    | 6.18                   | [Github.com](https://github.com/dnSpy/dnSpy/releases)        |
| QModManager              | 4.2                    | [Nexusmods.com](https://www.nexusmods.com/subnautica/mods/201?tab=files) |
| SML Helper               | 2.9.7                  | [Nexusmods.com](https://www.nexusmods.com/subnautica/mods/113?tab=files) |
| QModManager (Below Zero) | 4.2                    | [Nexusmods.com](https://www.nexusmods.com/subnauticabelowzero/mods/1?tab=files) |
| SML Helper (Below Zero)  | 2.9.7                  | [Nexusmods.com](https://www.nexusmods.com/subnauticabelowzero/mods/34?tab=files) |
| BepInEx-Publicizer       | 1.0.0                  | [Github.com](https://github.com/MrPurple6411/Bepinex-Tools/releases/tag/1.0.0-Publicizer) |
| Vortex                   | 1.4.12                 | [Nexusmods.com](https://www.nexusmods.com/site/mods/1?tab=files) |
| GitHub Desktop           | 2.8.3                  | [Github.com](https://desktop.github.com/)                    |

Don't forget to endorse the mods that you download and use from Nexusmods.

Now, there are loads of tools and applications out there that can be used in modding games. The ones I've listed above have given me everything I need to make the simple mods I've been building, but you may find you need something more, or something different. There's no right answer to what tools and software to use: have a look around, and find the right thing for you and for what you want to do.

Something to be very aware of is that development of these tools is pretty active and things tend to change quite frequently. It's really, really important to avail yourself of the latest versions and double check compatibility and support.

On that note, it's worth bookmarking these pages:

- [QModManager wiki](https://github.com/SubnauticaModding/QModManager/wiki)
- [SMLHelper wiki](https://github.com/SubnauticaModding/SMLHelper/wiki)
- [VersionChecker wiki](https://github.com/tobeyStraitjacket/VersionChecker/wiki)

Once you've got everything downloaded, let's get it all setup and ready to go.

Don't worry too much about version numbers. Generally, the latest is fine, though look out for .NET Framework and compatibility between mods.
