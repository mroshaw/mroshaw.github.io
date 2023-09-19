---
title: Creating a Visual Studio project
nav_order: 1
parent: Your first mod
---

# Creating a Visual Studio C# project

Hop into Visual Studio and create a new project. You must use the "Class Library (.NET Framework)" template for this:

![](.\media\classlibrarytemplate.png)

Note that the "Class Library" template is not the one you want as it targets .NET Standard or .NET Core. You specifically want to select the template for .NET Framework.

Let's call the project `KnifeDamageMod`, set a location and select `.NET Framework 4.7.2`. Click the Create button, and you're done! Who said this was difficult, right?!

![](.\media\vsprojectconfiguration.png)

Just to reiterate: you **must** select `.NET Framework 4.7.2`. If you don't see it, go back to the Visual Studio installer and select it. Alternatively, you can download it manually from [Microsoft.com](https://dotnet.microsoft.com/download/visual-studio-sdks)

Okay, there's more to it than that before we start.

Within Visual Studio, there are concepts of `solutions` and `projects`. The `solution` is like a container, and can contain many projects. The `project` contains code, configuration and files related to a specific assembly - in our case, our mod DLL. I like to use a single solution to keep all my mods together, you can do the same or otherwise. Like most things in coding, it's really down to personal preference.

In the Solution Explorer window, right click the `Solution` and change the name to something like `My Subnautica Mods`. In the example below, I've called it "BeginnersGuideMod", but you won't want yours called the same. Having a single solution will allow us to create multiple mod projects within the same solution, allow code reuse and have a single Git repository keeping everything together.

You should have something like this:

![](.\media\newprojectsolutionexplorer.png)

So, what you have now are

- A `solution` - shown in red above.

- A `project` - show in yellow above.


Try and remember these terms as we go through the tutorial.

## Pro Tip - using the NuGet template package

There is another way to set up a new project, which is to use the community maintained project templates.

To install and use the templates, you can follow these steps:

1. In Visual Studio, create a new solution or open an existing solution.
2. Select Tools > NuGet Package Manager > Manage NuGet Packages for Solution...
3. Click "Browse"

4. Set "Package Source" to "All"

5. Tick "Include prerelease"

6. Search for "Subnautica"
7. Select "Subnautica.Templates"
8. On the right, click "Install"
9. Click "Apply"

When you now go to create a new project, you'll see a number of new project templates that you can choose from:

![](.\media\subnauticanugettemplateprojects.png)
