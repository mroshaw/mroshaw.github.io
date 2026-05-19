---
title: Installing FModel
nav_order: 3
parent: Installation and set-up for SN2
---

# Installing FModel

FModel is another essential tool for modding, as it allows you to very easily view and browse the structure, layout and content of files and assets within a UE game, such as Subnautica 2.

Installation and setup of FModel is pretty straight-forward:

1. Unzip the file and copy `FModel.exe` to the "FModel" folder in the modding folder you created earlier.
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

