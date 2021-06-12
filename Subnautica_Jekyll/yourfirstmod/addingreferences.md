​---
layout: default
title: Adding references
nav_order: 2
parent: Your first mod
​---

# Adding References

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

