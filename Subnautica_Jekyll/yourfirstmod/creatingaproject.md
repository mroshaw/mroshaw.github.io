---
layout: default
title: Creating a Visual Studio project
nav_order: 1
parent: Your first mod
---

# Creating a Visual Studio C# project

Hop into Visual Studio and create a new project. You can use the "Class Library (.NET Framework)" template for this:

![](.\media\classlibrarytemplate.png)

**NOTE:** The "Class Library" template is not the one you want as it targets .NET Standard or .NET Core. You specifically want to select the template for .NET Framework

Let's call it `MyFirstSubnauicaMod_BZ`, set a location and select `.NET Framework 4.7.2`. Click the Create button, and you're done! Who said this was difficult, right?!

**NOTE:** You must select `.NET Framework 4.7.2`. If you don't see it, go back to the Visual Studio installer and select it. Alternatively, you can download it manually from [Microsoft.com](https://dotnet.microsoft.com/download/visual-studio-sdks)

Okay, there's more to it than that before we start.

In the Solution Explorer window, right click the "Solution" and change the name to something like `My Subnautica Mods`. This will allow us to create multiple mod projects within the same solution, allow code reuse and a single Git repository keeping everything together.

You should have something like this:

![](.\media\newprojectsolutionexplorer.png)

You can ignore the other projects that you can see there.
