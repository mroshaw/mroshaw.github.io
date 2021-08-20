---
layout: default
title: Composition and inheritance
nav_order: 2
parent: Advanced modding


---

# Composition and inheritance

The Subnautica games are written using the Unity development environment. You can find out a wealth of information about Unity from a huge number of sources, though you might want to start at the [Unity home page](https://unity.com/).

While an in-depth knowledge of Unity isn't required for modding, understanding it's core concepts will make it much easier to implement some of your ideas.

## What is Composition?

One of the first "Eureka!" moments for me, was learning about composition and how it differs from my ingrained knowledge of object oriented programming. I'm going to try to explain in the way that I rationalise this in my head, so please bear with me!

For me, OOP is about class hierarchy. When I first started trying to mod Subnautica, I was straight into asking myself questions about what classes inherited certain behaviour, what the parent, child and grandchild classes and methods were and so on.

I went hunting in dnSpy, looking for classes and class members that gave me the hierarchy that I was expecting. And, as you can guess, what I was expecting was nowhere to be found.

I think the easiest way I've found to think of it is to look at the `LiveMixin` class. This class provides methods and fields that give something `Life` - not in the literal sense, but in terms of managing player and creature health - and death!

In an inheritance world, you might define a parent class called `LivingThing`, from which a number of classes inherit behaviour. So players, fish, creatures etc. You'd say that `Player` *is a*  `LivingThing`. Bizarrely, you might want a Seatruck to have a concept of `health` so maybe `Vehicle` also inherits from this class. Now, it may be that `LivingThing` has very little in the way of useful methods and fields, other than those for managing health. So what if we want another parent class called `TwoLegged`, which has properties and methods that are useful for two legged beings, like our `Player`? We can very quickly end up with a lot of complex class hierarchies that are very difficult to understand and maintain. And what if I change a parent class to fix a problem for one child and it breaks the others? Things get very messy and liable to break.

Composition takes a different approach. Instead of `Player` *is a*`LifeObject`, composition says `Player` *has a* `LifeObject`. In addition, `Creature` *has a* `LifeObject`, and so on. The `Player` can also *have a* `TwoLeggedObject`, and make use of the functionality that this gives. There is no direct inherited behaviour, and so the risk of breaking parent and child class functionality when you make changes is greatly reduced.

This allows us to add many components into the `Player` object to give it various capabilities and functions, without the problems and risks of a complex hierarchy.

What this means to modding is that it's actually really easy to get at class instances within the game!

Instead of having to travel up and down a hierarchy, you can simply search within a game object for instances of class types that you want to use. So, in the case above, getting hold of the class instance that manages player health is simple:

```c#
LiveMixin playHealth = Player.main.GetComponent<LiveMixin>();
```

You can also use other Unity methods to grab lists of components. For example, to get all of the Aquarium Modules attached to the Seatruck:

```c#
SeaTruckAquarium[] seaTruckAquariums = seaTruck.GetComponentsInChildren<SeaTruckAquarium>();
foreach (SeaTruckAquarium seaTruckAquarium in seaTruckAquariums)
{
	Logger.Log(Logger.Level.Debug, $"{seaTruckAquarium.name}");
}
```

Now, there are use cases for inheritance and use cases for composition. Whilst it's true that lots of the game functionality in Subnautica is coded using components, inheritance still plays a part, and it's typically that you'll find both in use while developing mods for these games.

## Why is Composition "good" for modding?

Composition is great, because you don't need to know everything about an object to start to tweak and change it. 

