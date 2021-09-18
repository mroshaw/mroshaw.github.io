---
layout: default
title: Adding references
nav_order: 2
parent: Your first Subnautica mod
---



# Adding References

Now we need to add references into our new project, so that we can reference our tools and Subnautica files.

Right click `References` and select `Add Reference`. Click `Browse` and locate and add the following files:

| Filename                   | Default / Sample Location              |
| -------------------------- | -------------------------------------- |
| UnityEngine.dll            | \<game>\\Subnautica_Data\\Managed      |
| UnityEngine.CoreModule.dll | \<game>\\Subnautica_Data\\Managed      |
| UnityEngine.UI.dll         | \<game>\\Subnautica_Data\\Managed      |
| 0Harmony.dll               | \<game>\\ BepInEx\\Core                |
| QModInstaller.dll          | \<game>\\BepInEx\\plugins\\QModManager |
| SMLHelper.dll              | \<game>\\QMods\SMLHelper_BZ            |

If you've run Publicizer, as recommended, you should add these references:

| Filename                                 | Default / Sample Location                                |
| ---------------------------------------- | -------------------------------------------------------- |
| Assembly-CSharp_publicized.dll           | \<game>\\Subnautica_Data\\Managed\\publicized_assemblies |
| Assembly-CSharp-firstpass_publicized.dll | \<game>\\Subnautica_Data\\Managed\\publicized_assemblies |

If you've not run Publicizer, add these:

| Filename                      | Default / Sample Location       |
| ----------------------------- | ------------------------------- |
| Assembly-CSharp.dll           | game>\\Subnautica_Data\\Managed |
| Assembly-CSharp-firstpass.dll | game>\\Subnautica_Data\\Managed |

With regards to references: you're not going to need all of these, all of the time. You might not need any of them, you might need to add new references if you decide to use a different set of modding tools and libraries.

Things change all the time, and there are often many ways to "skin a cat" in the coding world. These references give me what I need to make my simple mods, and your mileage may vary.
