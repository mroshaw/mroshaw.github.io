---
title: Installation and set-up
nav_order: 2
parent: Setting up for SN2 development
---

# Installation and Set-up

When I set up a Dev environment, I like to keep everything together. I have a dedicated 1TB SSD on my machine that I have mounted as E: and I put everything development related into E:\\Dev\UnrealDev. I create subfolders in there for FModel and UAssetGUI, which keeps everything neat and tidy. You can do whatever you want, go with defaults, or put stuff where it's accessible for you.

Remember, you don't need to install everything, only the tools you need for the mod you're creating. For the purpose of the simple tutorial, you only need:

- UE4SS
- FModel
- Visual Studio Code with the LUA extension

You don't need to install the full Unreal Engine to get started.

## UE4SS

You want to download and install the "DEV" version of UE4SS from Nexus mods:

![](.\media\ue4ssdownload.png)

I prefer the "Manual download" method: simply download the mod ZIP file and extract the contents to `\Subnautica2\Subnautica2\Binaries\Win64`. Make sure you unzip the contents straight into this folder. Don't copy/leave the ZIP file there and don't copy in the wrapper folder from the mod download. Your Subnautica 2 installation folder should look like this:

![](.\media\ue4ssinstallfolder.png)

## FModel

Having downloaded the FModel ZIP file, there are a few steps need to get it working.

### Generate a USMAP file

First up, we need something from UE4SS, that will allow you to decode the assets in the game to JSON structures for you to view:

1. With UE4SS installed, launch the game.
2. You should see a UE4SS window:![](.\media\ue4sswindow.png)

3. Click the "Dumpers" button at the top.
4. Click the "Generate .usmap file - UnrealMappingsDumper by OutTheShade" button.
5. This will create a file in the UE4SS folder: `Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Subnautica2-x.y.z-nnnnn.usmap`. The x, y, z, and n, represent different values depending on the version and build of the game.

6. You can now quit the game.

### Configure FModel

Now to set up FModel:

1. Unzip the file and copy `FModel.exe` to your Dev folder. I put it in E:\Dev\UnrealDev\FModel.
2. Run the exe file.
3. If you are prompted to "Download or update .NET", click "Download it now".
4. This will download an executable to your default downloads folder, called something like `windowsdesktop-runtime-8.0.27-win-x64.exe`.
5. Run this and click "Install" and close the installer once it's done.
6. Close the FModel window and launch the EXE again and you should see a "Directory Selector" window appear.
7. Assuming FModel doesn't yet know about Subnautica 2, under "Add undetected game", click the 2 arrows to expand the window.
8. Enter the name, "Subnautica2"
9. Click the "..." button on the right of Directory and select your Subnautica 2 installation folder:![](.\media\fmodelconfig.png)
10. Click the "+" button to add the new game.
11. FModel should detect the Unreal Engine version, in this case "GAME_UE5_6" :![](.\media\fmodelconfigsn2.png)
12. Now click "OK".
13. You should see a list of Subnautica 2 files under Game Archives, all being well.
14. Click the Settings menu item and enable "Local Mapping File (drag & drop)".
15. You can either drag and drop the ".usmap" file created earlier, or click the three dots button and locate it. Remember, it was created by UE4SS as `Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Subnautica2-x.y.z-nnnnn.usmap`.
16. Click OK.
17. You can test everything is working by double clicking "Subnautica2-Windows.utoc", then expanding "Subnautica2 > Content > Blueprints" until you see some assets. Doubling clicking a Blueprint asset should display a JSON file describing the asset contents:![](.\media\fmodeltesting.png)

## UAssetGUI

Just download the `UAssetGUI.exe`file from the latest release on Github, and copy it to your Dev folder. I put it in `E:\Dev\UnrealDev/UAssetGUI`.

## Visual Studio Code

You can set up Visual Studio Code as a nice little IDE for editing your LUA mod code.

### Generate game LUA types

We can again leverage UE4SS to improve things even further by dumping LUA bindings for use in VS code:

1. Having installed UE4SS, launch the game.

2. Click the "Dumpers" button at the top of the screen.

3. Click the "Generate Lua Types" button.

4. This will generate a load of files in `\Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Mods\shared\types`.

5. In the `\Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Mods` folder, create a file called `.luarc.json`.

6. Open it and paste in this text:

   ```json
   
   ```

   

### Install VS code

1. Download the Visual Studio code installer and run it.
2. Launch Visual Studio Code and click "Open Folder".
3. Open your UE4SS "mods" folder, `\Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Mods`.
4. Go to File > Save Workspace As... and save the ".code-workspace" file to `\Subnautica2\Subnautica2\Binaries\Win64\ue4ss\Mods`
5. Go to File > Preferences > Extensions
6. Search for "LUA" and find the extension by "sumneko".
7. Click "Install" next to that extension.
8. Click "Trust publisher and install".
9. In the root of the workspace create a file called `.luarc.json`
10. Open this file and paste in this text:

```json
{
    "$schema": "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
    "workspace.maxPreload": 50000,
    "workspace.preloadFileSize": 5000,
    "workspace.library": ["../shared", "Scripts"]
}
```

11. Go to File > Close Workspace, then File > Open Workspace From File, and reopen the workspace file you saved.
12. You'll have a really useful, lightweight IDE environment in which to develop your code:![](.\media\visualstudiocodelua.png)

## retoc

This is another easy one. Just download the latest version from Github and unzip to your Dev folder. For example, I downloaded `retoc_cli-x86_64-pc-windows-msvc.zip` and unzipped it into `E:\Dev\UnrealDev\retoc`.

## Unreal Engine

Installing Unreal 5 set up is relatively easy:

1. Download and install the Epic Games Launcher and run it.
2. Run the Launcher.
3. Click "Unreal Engine" on the left, and click the "Library" tab.
4. Click the "+" button next to "Unreal versions", then click the little drop down to select the version you want to install:![](.\media\chooseunrealversion.png)
5. Once you've selected the version, click the "Install" button.
6. Cand select a target folder and click Install. I like to keep everything together, but you can install it anywhere:![](.\media\installunreal5.png)

## Installing Visual Studio/Windows SDK

Some complex mods require a Windows build environment, and the easiest way to set that up is to install Visual Studio Community Edition.

1. Download the Visual Studio Community Edition installer and run it.
2. In the workloads tab, under Desktop & Mobile, enable the following :
   - NET desktop development
   - Desktop development with C++
   - .NET Multi-platform App UI development
   - Under Gaming, enable Game development with C++.
3. In the installer's Installation Details panel, expand Game development with C++ and enable the following options:
   - C++ profiling tools
   - C++ AddressSanitizer
   - Windows 10 or 11 SDK (10.0.18362 or Newer)
   - Unreal Engine installer![](.\media\visualstudioinstalloptions.png)
4. Click Install

## GitHub Desktop

Again, totally optional. I just find the desktop tool gives me a warm fuzzy feeling that my code is safe, and nothing is ever lost! [Download](software.md#downloads) and install using the installer, following the prompts. Simples!

## Vortex

Install Vortex if you want to manage Subnautica 2 mods, but also if you want to package your own mods for distribution via Vortex and Nexus mods. This will allow you to test your own mod packages when you publish them.

Follow these simple steps to install and configure Vortex:

1. Download Vortex from Nexus mods and simply run the installer.
2. Once installed, run Vortex.
3. Click the "Games" item under "General" in the top left and search for "Subnautica".
4. Find "Subnautica 2" and click the "Manage" button.
5. Click "Download" to download the Subnautica 2 extension.
6. Vortex will restart.
7. When prompted, point Vortex to your Subnautica 2 game folder and select the appropriate platform.
8. You'll now be able to download and manage Subnautica 2 mods, including the ones you build and upload.
