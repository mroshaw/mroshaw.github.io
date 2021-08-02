---
layout: default
title: Prefabs
nav_order: 5
parent: Advanced modding



---

# Prefabs

Unity, and therefore the Subnautica games, have a concept of `prefabs`, knowledge of which can really help you in your modding life.

## What is a prefab?

Think of a prefab as a template or blueprint, if you like, that describes an object in your game that be used to create many instances of that object, without having to reconfigure each and every instance.

So, we may have a `Snowstalker` prefab, that contains all of the components and definitions that make a working, moving, murderising Snowstalker. To create a gang of murderous beasts, you need simply use the prefab to generate 20 new `SnowStalker` objects from that prefab, and place them around the map using their `Transform`. This makes life really easy for a developer or modder who wants to create new object instances and tweak them.

Once you've used a prefab to create a new instance, you're free to mess around without impacting other instances. So, you can increase the aggressiveness of your new Snowstalker, or even add new behaviours and components to change the way it behaves.

## How to use prefabs

Creating game object instances from prefabs is different in Subnautica and in Below Zero. The critical difference is that the original game has a `synchronous` method and Below Zero has an `asynchronous` mechanism.

Either way, follow these steps and you'll be able to spawn and use your own object instances within you mod.

### Subnautica

The code to create a new gameobject is really straight forward and only requires that you know the `TechType` of the object you want to create.

```c#
private static GameObject SetupNewGameObject(TechType objectTechType)
{
	GameObject gameObjectPrefab = CraftData.GetPrefabForTechType(objectTechType);
	GameObject gameObject = Object.Instantiate(gameObjectPrefab);
	return gameObject;
}
```

You can then simply invoke this when you want to create a new instance:

```c#
GameObject snowStalkerBaby = SetupNewGameObject(TechType.SnowStalkerBaby)
```

In Visual Studio, typing `TechType.` will automatically present you with a list of accepted `TechType` values that you can use when invoking this method.

### Below Zero

The code for BZ is a little more complex, and due to the async nature requires some additional steps.

First up, create the following class method:

```c#
private static IEnumerator SetupNewGameObject(Vector3 spawnPosition, Quaternion spawnRotation, TechType objectTechType)
{
    CoroutineTask<GameObject> task = CraftData.GetPrefabForTechTypeAsync(objectTechType);
    yield return task;
    GameObject gameObjectPrefab = task.GetResult();
    GameObject gameObject = GameObject.Instantiate(gameObjectPrefab);
}
```

This can then be invoked as follows:

```c#
// Run the async co-routine to spawn the object
UWE.CoroutineHost.StartCoroutine(SetupNewGameObject(TechType.SnowStalkerBaby));
```

What you might see here is that at no point have I "returned" the GameObject. Due to the async nature of the call to get the prefab, I don't know when it's going to complete, so I can't wait around for it to happen. Doing so would defeat the purpose of the async call and slow down the game engine.

What I can do at this point, however, is hook the `Start` or `Awake` method of my new game object, in order to make some changes and implement my additional mod functionality.

```c#
class CreatureOverride
{
    [HarmonyPatch(typeof(Creature))]
    [HarmonyPatch("Start")]
    internal class CreatureStart
    {
        [HarmonyPostfix]
        public static void PatchCreatureStart(Creature __instance)
        {
            if (__instance.GetType == typeof(SnowstalkerBaby))
            {
                GameObject snowStalkerBaby = __instance;
                // Mod code here...
            }
        }
    }
```

### Spawn position

When you instantiate a new game object, you'll probably want to control where in the world you put it. One possibility is to base the spawn position on the position of the player, and you can use the following code to do this really easily:

```c#
// Use the player position as the basis for the spawn location, plus two meters ahead
Vector3 spawnPosition = Player.main.transform.position() + (Player.main.transform.forward * 2.0f);
// Have the spawned object facing the same way as the player
Quaternion spawnRotation = Player.main.transform.rotation();
```

You can use these new variables in the `GameObject.Instantiate` method calls, to place the new object just in front of the player:

```c#
GameObject gameObject = GameObject.Instantiate(gameObjectPrefab, spawnPosition, spawnRotation);
```



