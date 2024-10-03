---
title: Software and tools
nav_order: 1
parent: Setting up for development
---

# Software you'll need

You'll want to setup your development machine with the following tools:

## Essential

-   **Visual Studio** - this is where we'll write our mod code. Note that you'll need the full fat "Visual Studio Community Edition" or equivalent, if you want to follow this tutorial. Do not use "Visual Studio Code".

-   **dnSpy** - this essential tool helps you to explore the code in the game and find useful methods and fields to target and modify.

-   **BepInEx** - this is a patcher/plug-in framework for Unity games. It does the hard lifting when it comes to hooking your mods into the Subnautica games. Installing BepInEx will also get you the Harmony software that we talked about earlier.

-   **Subnautica / Below Zero** - you'll need to have games themselves installed, of course!

## Recommended

-   **Nautilus** - not mandatory, but highly recommended! Nautilus is a modding library, designed, built and maintained by the Subnautica modding community, that provides loads of features and functions to make modding the games easier.

-   **BepInExPublicizer** - not mandatory, but this plugin "unlocks" protected methods and fields in game objects that makes modding much more powerful.

-   **Subnautica Runtime Editor** - again, not mandatory, but incredibly useful for exploring runtime games objects and components directly within the Subnautica games.

-   **Subnautica NuGet packages** - community built packages of code and libraries to make setting up new modding projects simple. Not mandatory, but highly recommended.

## Optional

-   **GitHub Desktop** - not mandatory, but good to manage your source code in a Git repository, which will allow you to share and collaborate with others.
-   **Vortex** - a plugin manager from Nexusmods. Not essential, but handy for installing and managing mods in the games.

## Downloads

Here's a simple checklist of the tools that I've used in this tutorial and where to get them:

| Category    | Tool Name                           | Where to download                                            | Mirror                                                       |
| ----------- | ----------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Essential   | Visual Studio Community Edition     | [Microsoft.com](https://visualstudio.microsoft.com/vs/community/) |                                                              |
| Essential   | dnSpy                               | [Github.com](https://github.com/dnSpy/dnSpy/releases/latest) |                                                              |
| Essential   | BepInEx Pack for Subnautica         | [Submodica.net](https://www.submodica.net/mods/sn1/141)      | [Nexusmods.com](https://www.nexusmods.com/subnautica/mods/1108) |
| Essential   | BepInEx Pack for Below Zero         | [Nexusmods.com](https://www.nexusmods.com/subnauticabelowzero/mods/344) |                                                              |
| Recommended | Nautilus                            | [Submodica.net](https://www.submodica.net/mods/sn1/250)      | [Nexusmods.com](https://www.nexusmods.com/subnautica/mods/1262) |
| Recommended | Nautilus BZ                         | [Submodica.net](https://www.submodica.net/mods/sbz/251)      | [Nexusmods.com](https://www.nexusmods.com/subnauticabelowzero/mods/373) |
| Recommended | BepInEx-Publicizer                  | [Github.com](https://github.com/MrPurple6411/Bepinex-Tools/releases/latest) |                                                              |
| Recommended | Subnautica Runtime Editor           | [Submodica.net](https://www.submodica.net/mods/sn1/109)      |                                                              |
| Recommended | Subnautica Modding NuGet package    | [Nuget.org](https://www.nuget.org/packages/Subnautica.Nautilus) |                                                              |
| Recommended | Below Zero Modding NuGet package    | [Nuget.org](https://www.nuget.org/packages/SubnauticaZero.Nautilus/) |                                                              |
| Recommended | Subnautica Modding Templates for VS | [Nuget.org](https://www.nuget.org/packages/Subnautica.Templates) |                                                              |
| Optional    | Vortex                              | [Nexusmods.com](https://www.nexusmods.com/site/mods/1?tab=files) |                                                              |
| Optional    | GitHub Desktop                      | [Github.com](https://desktop.github.com/)                    |                                                              |

Now, there are loads of other tools and applications out there that can be used in modding games. The ones I’ve listed above have given me everything I need to make the simple mods I’ve been building, but you may find you need something more, or something different. There’s no right answer to what tools and software to use: have a look around, and find the right thing for you and for what you want to do.

Something to be very aware of is that development of these tools is pretty active and things tend to change quite frequently. It's really, really important to avail yourself of the latest versions and double check compatibility and support between various tools and game versions.

On that note, it's worth bookmarking these pages, where you'll always find the latest and greatest versions and details of these tools:

- [Nautilus GitHub pages](https://github.com/SubnauticaModding/Nautilus)
- [Subnautica modding NuGet gallery](https://www.nuget.org/profiles/SubnauticaModding)

Don't forget to endorse the mods that you download and use from Nexusmods.

Once you’ve got everything downloaded, let’s get it all setup and ready to go.
