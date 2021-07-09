---
layout: default
title: Configuring the Assembly
nav_order: 3
parent: Your first mod
---

## Configuring the Assembly

You'll want to change some of the settings of your compiled DLL.

Right click the project in the Solution Explorer and select `Properties`.

In case you've forgotten, your project sits within your solution and can be seen in the Solution Explorer:

![](.\media\SolutionProject.png)

In the image above, the `solution` is in red, and the `project` is in yellow. It's the project that you want to right click.

You'll see an Assembly Name and Default Namespace. If you've done a good job in picking a project name, you can leave these as is. Click the `Assembly` button and you'll see something like this:

![](.\media\assemblyinformation.png)

Again, you can leave Title as it is, or change it, and you can set some of the data items here with your name and copyright info. Your initial version will be 1.0.0.0, so leave this as is too. Click OK to close that dialog.

Still in Properties, click the Build item. Here, we want to `Allow unsafe code`. This prevents any issues when we try to use protected methods and fields that have been "unlocked" for us via the Publicizer. If you've chosen not to use the Publicizer, you can leave this as is.

One more thing we can do here is to setup our project to automatically deploy our mod after each successful build. We do this via the `Build Events` options. In Post-build event command line, you can add something like this:

```
mkdir "C:\Games\Steam\steamapps\common\SubnauticaZero\QMods\$(TargetName)"
copy /Y "$(TargetPath)" "C:\Games\Steam\steamapps\common\SubnauticaZero\QMods\$(TargetName)"
copy /Y "$(ProjectDir)\mod.json" "C:\Games\Steam\steamapps\common\SubnauticaZero\QMods\$(TargetName)\mod.json"
```

What this does is:

1.  Creates a folder for our mod in the QMod folder, if one doesn't already exist

2.  Copies the compiled mod DLL into the folder

3.  Copies the `mod.json` file into the folder

Right, I think we're about ready to write some code!
