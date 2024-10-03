---
title: Prefabs
nav_order: 6
parent: Advanced modding
---

# Prefabs

Unity, and therefore the Subnautica games, have a concept of `prefabs`, knowledge of which can really help you in your modding life.

## What is a prefab?

Think of a prefab as a template or blueprint, if you like, that describes an object in your game that be used to create many instances of that object, without having to reconfigure each and every instance.

So, we may have a `Snowstalker` prefab, that contains all of the components and definitions that make a working, moving, murderising Snowstalker.  That includes the component code to make it move, react to danger, perform actions, as well as the models, textures and animations that the players see on screen. To create a gang of murderous beasts, you need simply use the prefab to generate 20 new `SnowStalker` instances from that prefab, and place them around the map using their `Transform`.  We do not have to create an empty game object from scratch and configure dozens of components.

A cool feature of prefabs is that if we subsequently amend the prefab definition, all 20 instances inherit this change straight away. This makes life really easy for a developer or modder who wants to create new object instances and tweak them. So to change all of your spawned Snowstalker's blue, just change the prefab definition and voila, a heard of blue beasties!

Conversely, once you've used a prefab to create a new instance, you're free to mess around with that instance without impacting other instances or the prefab itself. So, you can increase the aggressiveness of just one of your new Snowstalkers, or even add new behaviours and components to change the way it behaves, without effecting any of the other instances that you've spawned.

## How to use prefabs

You can get hold and reuse a number of pre-created prefabs included in both of the Subnautica games. However, the process of using these to create instances is different in Subnautica and in Below Zero. The critical difference is that the original game has a `synchronous` method and Below Zero has an `asynchronous` mechanism. This isn't as complex as it might seem at first, and actually, calling `asycnhronous` co-routines will very quickly become a well used tool in your modders toolbox, once you get the hang of it and come to recognise the benefits of freeing up valuable update cycles while Unity does it's thing.

Either way, follow these steps and you'll be able to spawn and use your own object instances within you mod, and here's how it's done.

First up, create the following static class method:

```c#
private static IEnumerator SetupNewGameObject(Vector3 spawnPosition, Quaternion spawnRotation, TechType objectTechType)
{
    CoroutineTask<GameObject> task = CraftData.GetPrefabForTechTypeAsync(objectTechType);
    yield return task;
    GameObject gameObjectPrefab = task.GetResult();
    GameObject gameObject = GameObject.Instantiate(gameObjectPrefab);
}
```

This sets up what's called a `Coroutine` in Unity parlance. This is an asynchronous mechanism that allows us to say to Unity: instantiate this please, but continue processing frames while we wait.

This can then be invoked as follows:

```c#
// Run the async co-routine to spawn the object
UWE.CoroutineHost.StartCoroutine(SetupNewGameObject(TechType.SnowStalkerBaby));
```

What you might see here is that at no point have I "returned" the `GameObject`. Due to the asynchronous nature of the call to get the prefab, I don't know when it's going to complete, so I can't wait around for it to happen. Doing so would defeat the purpose of the asynchronous call and slow down the game engine.

There are a few ways you can deal with this, specifically if you need to actually do something with the instance that is spawned. In some circumstances, we simply want to spawn a new instance, and don't really care if and when Unity has done so.

If we do care, we can:

1. Take care of everything we need to do inside the asynchronous co-routine.

or

2. Wait somewhere else for the spawn to complete and pick up where we left off once we've detected it's ready.

Option 1 is easy, and we can simply extend our co-routine to do what we want:

```c#
private static IEnumerator SetupNewGameObject(Vector3 spawnPosition, Quaternion spawnRotation, TechType objectTechType)
{
    CoroutineTask<GameObject> task = CraftData.GetPrefabForTechTypeAsync(objectTechType);
    yield return task;
    GameObject gameObjectPrefab = task.GetResult();
    GameObject gameObject = GameObject.Instantiate(gameObjectPrefab);
    
    // Configure our Snowstalker instance
    SnowStalker snowStalker = gameObject.GetComponent<SnowStalker>();
	...
}
```

Option 2 is more challenging, and I'm going to leave it at that as homework! Possible solutions could include:

- Adding the instantiated instance to a global list that's polled in an `Update` event elsewhere
- Spawning another co-routine to wait for the object instance to be created

### Spawned instance position and rotation

When you instantiate a new game object, you'll probably want to control where in the world you put it. The spawned game object's `Transform` is where you'll find, and modify, it's position and rotation. Transforms have a position and rotation within the game world, and also relative position and rotation within the game object hierarchy to which they might belong. So if you spawn a creature instance within a base room, for example, the `localPositon` and `localRotation` of the object transform would be relative to the parent base room `Transform`.

Something you might want to do, is to base the spawn position on the position of the player. This is made super easy, not least by the helpful inclusion of a `Player` static class that you can use to immediately reference the player `GameObject`. So, you could use something like this:

```c#
// Use the player position as the basis for the spawn location, plus two meters ahead
Vector3 spawnPosition = Player.main.transform.position() + (Player.main.transform.forward * 2.0f);
// Have the spawned object facing the same direction as the player
Quaternion spawnRotation = Player.main.transform.rotation();
```

You can use these new variables in the `GameObject.Instantiate` method calls, to place the new object just in front of the player:

```c#
GameObject gameObject = GameObject.Instantiate(gameObjectPrefab, spawnPosition, spawnRotation);
```

Or you can immediately modify the instance `Transform` once it has been spawned:

```c#
gameObject.transform.position = spawnPosition;
gameOPbject.transform.rotation = spawnRotation;
```

Prefabs are great and give you immediate access to fully configured bundles of components that bring creatures, pickupables and vehicles into the game with a few lines of code. You can even create your own prefabs as Asset Bundles, and we'll look at those later on in the tutorial.

## Pro Tip - Nautilus makes working with prefabs easy!

The fantastic Nautilus framework, developed and supported by the Subnautica modding community, makes dealing with prefabs really easy. Head over to the [Nautilus documentation pages](https://subnauticamodding.github.io/Nautilus/tutorials/prefabs-overview.html) for more info.

