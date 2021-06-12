# Your first Subnautica mod

## Creating a Visual Studio C# project

Hop into Visual Studio and create a new project. You can use the "Class Library (.NET Framework)" template for this:

![](C:\Users\mrosh\Google Drive\Development\Visual Studio Projects\Subnautica Mods\BeginnersGuide\media\classlibrarytemplate.png)

**NOTE:** The "Class Library" template is not the one you want as it targets .NET Standard or .NET Core. You specifically want to select the template for .NET Framework

Let's call it `MyFirstSubnauicaMod_BZ`, set a location and select `.NET Framework 4.7.2`. Click the Create button, and you're done! Who said this was difficult, right?!

**NOTE:** You must select `.NET Framework 4.7.2`. If you don't see it, go back to the Visual Studio installer and select it. Alternatively, you can download it manually from [Microsoft.com](https://dotnet.microsoft.com/download/visual-studio-sdks)

Okay, there's more to it than that before we start.

In the Solution Explorer window, right click the "Solution" and change the name to something like `My Subnautica Mods`. This will allow us to create multiple mod projects within the same solution, allow code reuse and a single Git repository keeping everything together.

You should have something like this:

![](C:\Users\mrosh\Google Drive\Development\Visual Studio Projects\Subnautica Mods\BeginnersGuide\media\newprojectsolutionexplorer.png)

You can ignore the other projects that you can see there.

## Adding References

Now we need to add references into our new project, so that we can reference our tools and Subnautica files.

Right click `References` and select `Add Reference`. Click `Browse` and locate and add the following files:

| Filename                   | Default / Sample Location                  |
| -------------------------- | ------------------------------------------ |
| UnityEngine.dll            | \<game>\\SubnauticaBelowZero_Data\\Managed |
| UnityEngine.CoreModule.dll | \<game>\\SubnauticaBelowZero_Data\\Managed |
| UnityEngine.UI.dll         | \<game>\\SubnauticaBelowZero_Data\\Managed |
| 0Harmony.dll               | \<game>\\ BepInEx\\Core                    |
| QModInstaller.dll          | \<game>\\BepInEx\\plugins\\QModManager     |
| SMLHelper.dll              | \<game>\\BepInEx\\Core                     |

If you've run Publicizer, as recommended, you should add these references:

| Filename                                 | Default / Sample Location                                    |
| ---------------------------------------- | ------------------------------------------------------------ |
| Assembly-CSharp_publicized.dll           | \<game>\\SubnauticaBelowZero_Data\\Managed\\publicized_assemblies |
| Assembly-CSharp-firstpass_publicized.dll | \<game>\\SubnauticaBelowZero_Data\\Managed\\publicized_assemblies |

If you've not run Publicizer, add these:

| Filename                      | Default / Sample Location                |
| ----------------------------- | ---------------------------------------- |
| Assembly-CSharp.dll           | game>\\SubnauticaBelowZero_Data\\Managed |
| Assembly-CSharp-firstpass.dll | game>\\SubnauticaBelowZero_Data\\Managed |

## Configuring your Assembly

You'll want to change some of the settings of your compiled DLL.

Right click the project in the Solution Explorer and select `Properties`.

You'll see an Assembly Name and Default Namespace. If you've done a good job in picking a project name, you can leave these as is. Click the `Assembly` button and you'll see something like this:

![](C:\Users\mrosh\Google Drive\Development\Visual Studio Projects\Subnautica Mods\BeginnersGuide\media\assemblyinformation.png)

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

## Coding your mod

In order to activate your mod, QModManager needs to know a bit about it. This is where the `mod.json` file comes in. Every mod has to have a `mod.json` file, so right click your project, select `Add new item...` and in the name, use `mod.json`. If Visual Studio has picked a template, don't worry, just select all and delete the content that it's added.

Now, enter in the details about your mod:

```{json}
{
  "Id": "MyFirstSubnauticaMod_BZ",
  "DisplayName": "My First Subnautica Mod",
  "Author": "Oli Ollerenshaw",
  "Version": "1.0.0",
  "Enable": true,
  "AssemblyName": "MyFirstSubnauticaMod_BZ.dll",
  "VersionDependencies": {
    "SMLHelper": "2.9.6"
  },
  "Game": "BelowZero"
}
```

The important items here are the Assembly name, dependencies and game.

-   **Assembly name** -- must match the name of the DLL that you are building

-   **Version Dependencies** -- must call out other dependent mods and the version supported

-   **Game** -- can be either BelowZero or Subnautica

**NOTE:** It's a good idea to keep on top of this, as well as the details of your Assembly, as mods like VersionChecker and QModManager itself, can make good use these values.

Okay, we're looking good. Now we can write some C#.

What I do, and this is completely down to personal preference, is to have a single class to handle registering the mod and managing options. I always call this class `QMod`, but you can call it whatever you want. We'll stick with this for the tutorial.

**NOTE:** When I refer to `your project`, don't confuse that with `your solution`! Your solution is `Subnautica Mods`, your project is `MyFirstSubnauticaMod_BZ`.

By default, the template will have created a class for you. Right click `Class1.cs` within your project and choose rename. Give the class a name such as `QMod`. Visual Studio will helpfully rename the class for you, as well as the file.

You\'ll want to refer to those lovely references we added, so first up, add these statements. This will also set you up with a great feature of QMod, which is a log file that you can write to for debugging:

```{csharp}
using System.Reflection;
using HarmonyLib;
using QModManager.API.ModLoading;
using Logger = QModManager.Utility.Logger;
```

We'll need to tell Harmony to patch our code, so add this into the `Patch()` method:

```{csharp}
[QModPatch]
public static void Patch()
{
    var assembly = Assembly.GetExecutingAssembly();
    var modName = ($"<someuniquevalue>_{assembly.GetName().Name}");
    Logger.Log(Logger.Level.Info, $"Patching {modName}");
    Harmony harmony = new Harmony(modName);
    harmony.PatchAll(assembly);
    Logger.Log(Logger.Level.Info, "Patched successfully!");
}
```

The `modName` generated above needs to be unique across mods -- this prevents mods interfering or otherwise messing with each other. The `<someuniquevalue>` should be replaced with something, well, unique. I tend to use my Discord / Github username, but it's entirely up to you:

```{csharp
var modName = ($"mroshaw_{assembly.GetName().Name}");
```

**NOTE:** You'll see some calls to the Logger here. These are super useful to help debug your code. Just remember to use `Level.Info` for high level logging only. For detailed logging, especially in code that gets called a lot, remember to use `Level.Debug`. The last thing you need is to fill players log files with millions of lines of debug text!

Okay, so we probably want to do something with the game code! Again, personal preference, but I like to create a new class for each class that I'm impacting. For the tutorial, we'll just go with something simple. Do that by right clicking on your project and selecting `Add item...`. Select `Class` and give it a sensible name. For this tutorial, we'll go for `MyFirstMod.cs`.

At this stage, your Visual Studio project should look a bit like this:

![](C:\Users\mrosh\Google Drive\Development\Visual Studio Projects\Subnautica Mods\BeginnersGuide\media\firstmodclassproject.png)

Open up new class file and add these using statements. This gives us the basics of what we need to tell Harmony what we're up to, and for us to reference game objects within our mod code:

```{csharp}
using HarmonyLib;
```

We're going to patch the "Knife", and make it do mega damage. So, we'll tell Harmony to patch the "Awake" method of the "Knife" class:

```{csharp}
[HarmonyPatch(typeof(Knife))]
[HarmonyPatch("Start")]
internal class KnifeDamageMod
{
}
```

The `Start` method is a really useful class method. If implemented in a class, it's something we can use that's always run only once when it comes to instances of that class. So, if we want to tweak something when a knife instance is created, this is the place to do it.

**NOTE:** What you call your classes isn't important. It's the attributes that matter. You can find lots of information about these, and how Harmony works, in the [Harmony user guide.](https://harmony.pardeike.net/articles/intro.html)

We're going to manipulate the properties of the Knife, after it's been started. At this point, we're going to tweak the damage field to make it super powerful. This is what the code looks like:

```{csharp}
[HarmonyPatch(typeof(Knife))]
[HarmonyPatch("Start")]
internal class KnifeDamageMod
{
    [HarmonyPostfix]
    public static void Postfix(Knife __instance)
    {
	// Double the knife damage
	float knifeDamage = __instance.damage;
	float newKnifeDamage = knifeDamage * 2;
	__instance.damage = newKnifeDamage;
	Logger.Log(Logger.Level.Debug, $"Knife damage was: {knifeDamage}," +
	    $" is now: {newKnifeDamage}");
    }
}
```

And we're done!

You can build this now by right clicking the project and selecting `Build`. All going well, you'll see `Build succeeded`. If not, go back through and check your code. You can also find the full source for this part of the tutorial [on my GitHub](https://github.com/mroshaw/SubnauticaMods/tree/main/MyFirstSubnauticaMod_BZ).
