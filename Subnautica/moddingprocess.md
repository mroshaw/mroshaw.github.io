# Your first Subnautica mod

## Creating a Visual Studio C# project

Hop into Visual Studio and create a new project. You can use the "Class Library (.NET Framework)" template for this:

![](media/image4.png){width="3.188976377952756in" height="2.1181102362204722in"}

![](media/image1.png){width="0.44027777777777777in" height="0.44027777777777777in"}**NOTE:** The "Class Library" template is not the one you want as it targets .NET Standard or .NET Core. You specifically want to select the template for .NET Framework

Let's call it "MyFirstSubnauicaMod_BZ", set a location and select ".NET Framework 4.7.2". Click the Create button, and you're done! Who said this was difficult, right?!

![](media/image5.png){width="3.188976377952756in" height="2.0984251968503935in"}

![](media/image1.png){width="0.44027777777777777in" height="0.44027777777777777in"}**NOTE:** You must select ".NET Framework 4.7.2". If you don't see it, go back to the Visual Studio installer and select it. Alternatively, you can download it manually from [Microsoft.com](https://dotnet.microsoft.com/download/visual-studio-sdks)

Okay, there's more to it than that before we start.

In the Solution Explorer window, right click the "Solution" and change the name to something like "My Subnautica Mods". This will allow us to create multiple mod projects within the same solution, allow code reuse and a single Git repository keeping everything together.

You should have something like this:

![](media/image6.png){width="2.177165354330709in" height="1.5039370078740157in"}

You can ignore the other projects that you can see there.

## Adding References

Now we need to add references into our new project, so that we can reference our tools and Subnautica files.

Right click "References" and select "Add Reference". Click "Browse" and locate and add the following files:

-----------------------------------------------------------------------------------
  Filename                     Default / sample location                    Got it!
---------------------------- -------------------------------------------- ---------
  UnityEngine.dll              \<game>\\SubnauticaBelowZero_Data\\Managed   

  UnityEngine.CoreModule.dll   \<game>\\SubnauticaBelowZero_Data\\Managed   

  UnityEngine.UI.dll           \<game>\\SubnauticaBelowZero_Data\\Managed   

  0Harmony.dll                 \<game>\\ BepInEx\\Core                      

  QModInstaller.dll            \<game>\\BepInEx\\plugins\\QModManager       

  SMLHelper.dll                \<game>\\BepInEx\\Core                       
  -----------------------------------------------------------------------------------

If you've run Publicizer, as recommended, you should add these references:

------------------------------------------------------------------------------------------------------------------------
  Filename                                   Default / sample location                                           Got it!
------------------------------------------ ------------------------------------------------------------------- ---------
  Assembly-CSharp_publicized.dll             \<game>\\SubnauticaBelowZero_Data\\Managed\\publicized_assemblies   

  Assembly-CSharp-firstpass_publicized.dll   \<game>\\SubnauticaBelowZero_Data\\Managed\\publicized_assemblies   
  ------------------------------------------------------------------------------------------------------------------------

If you've not run Publicizer, add these:

------------------------------------------------------------------------------------
  Filename                        Default / sample location                  Got it!
------------------------------- ------------------------------------------ ---------
  Assembly-CSharp.dll             game>\\SubnauticaBelowZero_Data\\Managed   

  Assembly-CSharp-firstpass.dll   game>\\SubnauticaBelowZero_Data\\Managed   
  ------------------------------------------------------------------------------------

## Configuring your Assembly

You'll want to change some of the settings of your compiled DLL.

Right click the project in the Solution Explorer and select "Properties".

You'll see an Assembly Name and Default Namespace. If you've done a good job in picking a project name, you can leave these as is. Click the "Assembly" button and you'll see something like this:

![](media/image7.png){width="2.5078740157480315in" height="1.795275590551181in"}

Again, you can leave Title as it is, or change it, and you can set some of the data items here with your name and copyright info. Your initial version will be 1.0.0.0, so leave this as is too. Click OK to close that dialog.

Still in Properties, click the Build item. Here, we want to "Allow unsafe code". This prevents any issues when we try to use protected methods and fields that have been "unlocked" for us via the Publicizer. If you've chosen not to use the Publicizer, you can leave this as is.

One more thing we can do here is to setup our project to automatically deploy our mod after each successful build. We do this via the "Build Events" options. In Post-build event command line, you can add something like this:

mkdir \"C:\\Games\\Steam\\steamapps\\common\\SubnauticaZero\\QMods\\\$(TargetName)\"

copy /Y \"\$(TargetPath)\" \"C:\\Games\\Steam\\steamapps\\common\\SubnauticaZero\\QMods\\\$(TargetName)\"

copy /Y \"\$(ProjectDir)\\mod.json\" \"C:\\Games\\Steam\\steamapps\\common\\SubnauticaZero\\QMods\\\$(TargetName)\\mod.json\"

What this does is:

1.  Creates a folder for our mod in the QMod folder, if one doesn't already exist

2.  Copies the compiled mod DLL into the folder

3.  Copies the mod.json file into the folder

Right, I think we're about ready to write some code!

## Coding your mod

In order to activate your mod, QModManager needs to know a bit about it. This is where the "mod.json" file comes in. Every mod has to have a "mod.json" file, so right click your project, select "Add new item..." and in the name, use "mod.json". If Visual Studio has picked a template, don't worry, just select all and delete the content that it's added.

Now paste in the details about your mod:

{

\"Id\": \"MyFirstSubnauticaMod_BZ\",

\"DisplayName\": \"My First Subnautica Mod\",

\"Author\": \"Oli Ollerenshaw\",

\"Version\": \"1.0.0\",

\"Enable\": true,

\"AssemblyName\": \"MyFirstSubnauticaMod_BZ.dll\",

\"VersionDependencies\": {

\"SMLHelper\": \"2.9.6\"

},

\"Game\": \"BelowZero\"

}

The important items here are the Assembly name, dependencies and game.

-   **Assembly name** -- must match the name of the DLL that you are building

-   **Version Dependencies** -- must call out other dependent mods and the version supported

-   **Game** -- can be either BelowZero or Subnautica

![](media/image1.png){width="0.44027777777777777in" height="0.44027777777777777in"}**NOTE:** It's a good idea to keep on top of this, as well as the details of your Assembly, as mods like VersionChecker and QModManager itself, can make good use these values.

Okay, we're looking good. Now we can write some C#.

What I do, and this is completely down to personal preference, is to have a single class to handle registering the mod and managing options. I always call this class "QMod", but you can call it whatever you want. We'll stick with this for now.

![](media/image1.png){width="0.44027777777777777in" height="0.44027777777777777in"}**NOTE:** When I refer to "your project", don't confuse that with "your solution"! Your solution is "Subnautica Mods", your project is "MyFirstSubnauticaMod_BZ.

By default, the template will have created a class for you. Right click "Class1.cs" within your project and choose rename. Give the class a name such as "QMod". Visual Studio will helpfully rename the class for you, as well as the file.

You\'ll want to refer to those lovely references we added, so first up, add these statements. This will also set you up with a great feature of QMod, which is a log file that you can write to for debugging:

using System.Reflection;

using HarmonyLib;

using QModManager.API.ModLoading;

using Logger = QModManager.Utility.Logger;

You'll want your class to be static, and you'll need Harmony attributes to tell it how to patch in your code:

Update your class and add the attributes and Patch method as shown in the code below:

namespace MyFirstSubnauticaMod_BZ

{

\[QModCore\]

public static class QMod

{

\[QModPatch\]

public static void Patch()

{

}

}

}

We'll need to tell Harmony to patch our code, so add this into the Patch() method:

public static void Patch()

{

var assembly = Assembly.GetExecutingAssembly();

var modName = (\$\"\<someuniquevalue>\_{assembly.GetName().Name}\");

Logger.Log(Logger.Level.Info, \$\"Patching {modName}\");

Harmony harmony = new Harmony(modName);

harmony.PatchAll(assembly);

Logger.Log(Logger.Level.Info, \"Patched successfully!\");

}

The "modName" generated above needs to be unique across mods -- this prevents mods interfering or otherwise messing with each other. The \<someuniquevalue> should be replaced with something, well, unique. I tend to use my Discord / Github username, but it's entirely up to you:

var modName = (\$\"mroshaw\_{assembly.GetName().Name}\");

![](media/image1.png){width="0.44027777777777777in" height="0.44027777777777777in"}**NOTE:** You'll see some calls to the Logger here. These are super useful to help debug your code. Just remember to use Level.Info for high level logging only. For detailed logging, especially in code that gets called a lot, remember to use Level.Debug. The last thing you need is to fill players log files with millions of lines of debug text!

Okay, so we probably want to do something with the game code! Again, personal preference, but I like to create a new class for each class that I'm impacting. For the tutorial, we'll just go with something simple. Do that by right clicking on your project and selecting "Add item...". Select "Class" and give it a sensible name. For this tutorial, we'll go for "MyFirstMod.cs".

At this stage, your Visual Studio project should look a bit like this:

![](media/image8.png){width="2.5511811023622046in" height="1.5866141732283465in"}

Open up new class file and add these using statements. This gives us the basics of what we need to tell Harmony what we're up to, and for us to reference game objects within our mod code:

using HarmonyLib;

We're going to patch the "Knife", and make it do mega damage. So, we'll tell Harmony to patch the "Awake" method of the "Knife" class:

using HarmonyLib;

using UnityEngine;

namespace MyFirstSubnauticaMod_BZ

{

/// \<summary>

/// Class to mod the knife

/// \</summary>

class MyFirstMod

{

\[HarmonyPatch(typeof(Knife))\]

\[HarmonyPatch(\"Awake\")\]

internal class KnifeDamageMod

{

}

}

}

The "Start" method is a really useful class method. If implemented in a class, it's something we can use that's always "run only once" when it comes to instances of that class. So, if we want to tweak something when a knife instance is created, this is the place to do it.

![](media/image1.png){width="0.44027777777777777in" height="0.44027777777777777in"}**NOTE:** What you call your classes isn't important. It's the attributes that matter. You can find lots of information about these, and how Harmony works, in the [Harmony user guide.](https://harmony.pardeike.net/articles/intro.html)

We're going to manipulate the properties of the Knife, after it's been "started". At this point, we're going to tweak the damage field to make it super powerful. This is what the code looks like:

class MyFirstMod

{

\[HarmonyPatch(typeof(Knife))\]

\[HarmonyPatch(\"Start\")\]

internal class KnifeDamageMod

{

\[HarmonyPostfix\]

public static void Postfix(Knife \_\_instance)

{

// Double the knife damage

float knifeDamage = \_\_instance.damage;

float newKnifeDamage = knifeDamage \* 2;

\_\_instance.damage = newKnifeDamage;

Logger.Log(Logger.Level.Debug, \$\"Knife damage was: {knifeDamage},\" +

\$\" is now: {newKnifeDamage}\");

}

}

And we're done!

You can build this now by right clicking the project and selecting "Build". All going well, you'll see "Build succeeded". If not, go back through and check your code. You can also find the full source for this part of the tutorial [on my GitHub](https://github.com/mroshaw/SubnauticaMods/tree/main/MyFirstSubnauticaMod_BZ).

## Testing you mod

You should now be able to fire up the game and do some testing.

Once you've launched Subnautica, go into Options \> Mods and check "Enable debug logs":

![](media/image9.png){width="3.34251968503937in" height="1.641732283464567in"}

Exit the game and launch it once again. Load up a game and equip your knife -- take a few swings while you're at it. You should now alt tab back to your desktop and get back into Windows Explorer. Navigate to your \<game> folder, and you should see a file called: qmodmanager_log-SubnauticaZero.txt.

![](media/image10.png){width="4.669291338582677in" height="2.3858267716535435in"}

Open this in Notepad or your favourite text editor and have a look. You'll see lots of information in here, and you should also see entries prefixed with your mod name:

\[SMLHelper/Debug\] Attempting to handle console command: tools

\[SMLHelper/Debug\] No command listener registered for \[tools\].

\[MyFirstSubnauticaMod_BZ:DEBUG\] Knife damage was: 20, is now: 40

Now get out there and stab some sea life!

## Checking in to GitHub

Well, mod created. Good work! If you took my advice and registered for an account on GitHub -- good for you! You won't regret it! Now you've tested your first build, you can check your code into GitHub. This is easy in Visual Studio, or you can use GitHub Desktop.

In Visual Studio, right click your "Solution", not your Project, and select "Git \> Commit or Stash". You can now commit your code and start to share and collaborate.

Well done!

# The Modding Process

Okay, so you can ignore this section if you like. I think it's useful to talk a bit about planning, designing and balancing your mod.

There are a load of reasons for modding a game and it can be a very personal thing. In fact, many mod authors build mods for themselves, to make the game more like the game they themselves wanted it to be. They share their mods because, well, because they're generally very nice people who just like to share the love of their favourite games with people who feel the same way.

That said, if you want to build mods to enhance the game, build on the universe and systems that the game presents, and you want it to enhance the game of others, it's worth having a plan. Think about what you're trying to achieve and how it will "play" for other players and how you might balance some pro's and con's of what you're bringing into the game world. While you're doing that, it's also worthwhile thinking about what objects, classes and methods you might need to work with to build your wonder mod.

## Plan your mod

\<TODO>

### Balancing

\<TODO>

\<GIVE AND TAKE?>

## Using dnSpy

\<TODO>

\<A BIT ABOUT SEARCHING FOR CLASSES, METHODS, FIELDS, CONSTANTS>

## Allowing player configuration

\<TODO>

\<SML HELPER, VARIOUS CONTROL TYPES, ALLOWING DYNAMIC CHANGES>

## Harmony(X)

\<TODO>

\<A BIT ABOUT HARMONY FRAMEWORK>

## Manipulating the game

\<TODO>

\<HOW TO WORK WITH METHOD HOOKS, MANIPULATING INSTANCE FIELDS, GAMEOBJECTS AND UNITY>

# Case Study: Booster Tank Speed Mod

The process in practice

## Plan your mod

\<TODO>

### Balancing

\<TODO>

## Using DNSpy

\<TODO>

## Allow player configuration

\<TODO>

## Harmony(X)

\<TODO>

## Manipulating the game

\<TODO>
