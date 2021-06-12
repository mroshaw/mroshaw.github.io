---
layout: default
title: Creating a Visual Studio project
nav_order: 1
parent: Your first mod
---

# Creating a Visual Studio C# project

Hop into Visual Studio and create a new project. You can use the "Class Library (.NET Framework)" template for this:

![](.\media\classlibrarytemplate.png)

The "Class Library" template is not the one you want as it targets .NET Standard or .NET Core. You specifically want to select the template for .NET Framework

Let's call it `MyFirstSubnauicaMod_BZ`, set a location and select `.NET Framework 4.7.2`. Click the Create button, and you're done! Who said this was difficult, right?!

You must select `.NET Framework 4.7.2`. If you don't see it, go back to the Visual Studio installer and select it. Alternatively, you can download it manually from [Microsoft.com](https://dotnet.microsoft.com/download/visual-studio-sdks)

Okay, there's more to it than that before we start.

Within Visual Studio, there are concepts of `solutions` and `projects`. The `solution` is like a container, and can contain many projects. The `project` contains code, configuration and files related to a specific assembly - in our case, our mod DLL. I like to use a single solution to keep all my mods together, you can do the same or otherwise. Like most things in coding, it's really down to personal preference.

In the Solution Explorer window, right click the `Solution` and change the name to something like `My Subnautica Mods`. This will allow us to create multiple mod projects within the same solution, allow code reuse and have a single Git repository keeping everything together.

You should have something like this:

![](.\media\newprojectsolutionexplorer.png)

You can ignore the other projects that you can see there.

So you've got your `solution` and `project` set up, ready to do some damage!
