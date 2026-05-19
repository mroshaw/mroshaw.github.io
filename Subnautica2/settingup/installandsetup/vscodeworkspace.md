---
title: Create VS Code Workspace
nav_order: 5
parent: Installation and set-up for SN2
---

## Create a modding workspace

Remeber we created that folder structure earlier on in the guide? This will help us create a really nice VS Code development environment with features like code completion/IntelliSense.

To set up a workspace, follow these steps:

1. In VS Code, select File > Open Folder...

2. Open your development "mods" folder, for example `\UnrealDev\Subnautica2Mods\mods`.

3. Go to File > Save Workspace As... and save the ".code-workspace" file to `\UnrealDev\Subnautica2Mods\mods\mods.code-workspace`

4. Now, still in VS Code, in the root of the workspace create a file called `.luarc.json`

5. Open this file and paste in this text:

   ```json
   {
       "$schema": "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
       "workspace.maxPreload": 50000,
       "workspace.preloadFileSize": 5000,
       "workspace.library": ["../shared", "Scripts"]
   }
   ```

6. What this does is tells the LUA extension to look in the `shared` folder for the "types" files that we dumped earlier from UE4SS. There are a large number of these files, so we also tell VS code to expect lots of files and to process all of them.

7. To refresh everything with the new settings, go to File > Close Workspace, then File > Open Workspace From File, and reopen the workspace file you saved.

## Test your setup

At this point, we can create a little mod just to make sure everything is working as it should:

1. In VS code, create a folder in the `mods` folder called `LuaModTest`.

2. Within that, create a file called `enabled.txt`. Just leave this blank.

3. Create a folder within `LuaModTest` called `scripts`.

4. Within that, create a file called `main.lua`.

5. Don't worry what this all means - we'll cover this all later on in the "your first mod" section.

6. In the `main.lua` file, paste this code:

   ```lua
   local UEHelpers = require("UEHelpers")
   local MOD_NAME = "BeginnersGuideCheatMod"
   
   ---@type APlayerController
   local playerController = UEHelpers.GetPlayerController()
   
   print(string.format("[%s] Lua Mod Test Successfully Loaded!\n", MOD_NAME))
   ```

7. Now, if you hover your mouse over `playerController`, you should see a little popup that describes the properties of the `APlayerController` class:![](.\media\vscodeluaintellitest.png)

8. This shows the `shared` folder is in the right place and the workspace is configured correctly.

9. If you don't see this popup, go back and check that:

   - You've dumped the game LUA types.
   - You've copied the resulting `shared` folder into your development folder `mods` folder.
   - You've created the `.luarc.json` in the `mods` folder and added the content as shown above.
   - You've reloaded the workspace. Close and re-open VS Code, just to be sure.

10. Now launch the game.

11. Open the UE4SS window and have a look in the console tab. You should see this somewhere near the bottom:

    ```
    [11:31:23.4858223] Starting mods (from enabled.txt (E:\Dev\UnrealDev\Subnautica2Mods\mods), no defined load order)...
    [11:31:23.4867904] Mod 'LuaModsTest' has enabled.txt, starting mod.
    [11:31:23.4938163] [Lua] [LuaTestMod] Lua Mod Test Successfully Loaded!
    ```

12. If not, check:

    - That you've modified the `UE4SS-settings.ini` file correctly, adding your `\UnrealDev\Subnautica2Mods\mods` folder.
    - You've created the test mod in the right place, `\UnrealDev\Subnautica2Mods\mods`
    - You've created the `enabled.txt` file in the specific folder that you created for the mod, `\UnrealDev\Subnautica2Mods\mods\LuaModTest`

VS Code is now all set up and ready to go!

