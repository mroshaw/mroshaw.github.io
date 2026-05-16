---
title: Creating a UE5 project
nav_order: 1
parent: Blueprint script mod
---

# Creating a UE5 project

Fire up Unreal Engine 5 from the Epic Games Launcher, and create a new project. We'll use this to develop some of our mods.

1. Pick the "Blank" template, ensure the type is `Blueprint` (not `C++`) and give the project a location and name. Let's call it `Subnautica2Mods` for now:![](.\media\ue5newproject.png)
2. Click "Create"
3. First up, let's add GAS - the Gameplay Ability System. This is used for a number of things in Subnautica 2, and we can leverage it to make our own changes.
4. Go to Edit > Plugins...
5. Search for "Gameplay Abilities"
6. Tick the box to the left of "Gameplay Abilities" and click the "Restart Now" button.
7. Click the "Content Drawer" in the bottom left.
8. Right click on "Content" and add a new folder, "Blueprints".
9. Add additional folders in a hierarchy: AbilitySystem, Effects, Player. It should look like this:![](E:\Dev\DAG\Subnautica Modding Guide\Subnautica Modding Tutorial\mroshaw.github.io\Subnautica2\yourfirstmod\media\contentfolders.png)

10. Go to Edit > Project Settings...
11. Click "Packaging" and ensure these options are checked:
    1. Use Pak file
    2. Use Io store
    3. Generate chunks![](E:\Dev\DAG\Subnautica Modding Guide\Subnautica Modding Tutorial\mroshaw.github.io\Subnautica2\yourfirstmod\media\projectsettings.png)
12. Close the Project S
13. Okay, that gives us a nice starter project to make some mods!