---
title: Installation and set-up
nav_order: 2
parent: Setting up for development
---

# Installation and Set-up

When I set up a Dev environment, I like to keep everything together. I have a dedicated 1TB SSD on my machine that I have mounted as D: and I put everything development related into D:\\Dev. You can do whatever you want, go with defaults, or put stuff where it's accessible for you.

## Visual Studio

Run the Visual Studio installer and pick the ".NET desktop development" Workload. You'll also want to ensure you pick the ".NET 4.7.2 SDK". That's it, really, the setup process is pretty straightforward these days, and VS installs a much smaller footprint than it used to.

## dnSpy

Simple download dnSpy and unzip it to a folder location. Simple as that!

## QModManager ![](..\images\qmm.png)

Make sure you download and install the correct version from Nexusmods. Once you've done so, simply run the installer and let it do it's thing. You'll need to have the Subnautica game installed at this point, obviously, though I think it's same to assume this one since you're reading this guide! Installing QMM will result in a folder called "QMods" in your game folder location. This is where your mods will go.

Remember that QModManager is being deprecated!

## BepInEx ![](..\images\bepinex.png)

**BepInEx**

Download the latest version from Nexus. Unzip the file to your game folder, and everything you need will be in the right place. You'll find a folder called "plugins" where you'll put your mod DLLs.

## Vortex

This is entirely optional for mod development, but I recommend it anyway for playing with mods and supporting the Nexusmods community. Simply download this from Nexusmods and run the installer. Within Vortex, get yourself logged in and add Subnautica and / or Below Zero to your managed games. This will set everything up to download mods direct from the Nexusmods site.

## SML Helper

Optional but highly recommended! If you've installed Vortex, simply go to the Nexusmods page for SML Helper and click "MOD Manager Download". Within Vortex, find the mod and change the status to "Enabled". If you skipped Vortex, download the mod manually and unzip to the QMods folder in your game installation location.

## BepExIn-Publicizer

I really recommend downloading this tool and going through the process documented below. It will enhance your modding experience no-end and unlock a whole load of potential that you'd have to do without.

Unzip the file that you download into \<game>\\BepInEx\\plugins\\Bepinex-Publicizer. You should have folder that looks like this:

![](.\media\bepinexinstall.png)

Run the game then exit. Return to Windows Explorer and go to this folder:

`<game>\SubnauticaZero_Data\Managed\publicized_assemblies`

You'll see some new files that we'll include in our project.

## GitHub Desktop

Again, totally optional. In fact, Visual Studio will give you everything you need to manage your code. I just find the desktop tool gives me a warm fuzzy feeling that my code is safe, and nothing is ever lost! Install using the installer, following the prompts. Simples!
