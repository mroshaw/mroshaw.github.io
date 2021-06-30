---
layout: default
title: Composition and inheritance
nav_order: 2
parent: Advanced modding
---

## Composition and inheritance

The Subnautica games are written using the Unity development environment. You can find out a wealth of information about Unity from a huge number of sources, though you might want to start at the [Unity home page](https://unity.com/).

While an in-depth knowledge of Unity isn't required for modding, understanding it's core concepts will make it much easier to implement some of your ideas.

One of the first "Eureka!" moments for me, was learning about Composition and how it differs from my ingrained knowledge of Object Orientated Programming. I'm going to try to explain in the way that I rationalise this in my head, so please bear with me!

In my head, OOP is about class hierarchy. When I first started trying to mod Subnautica, I was straight into asking these sorts of questions:

- I was to mod the cab that the player is driving. What's the parent class of `SeaTruckMotor`?
- I want to add a Creature to a Sea Truck Aquarium module. How do I go from the Sea Truck cab to an instance of a `SeaTruckAquarium`?

I went hunting in dnSpy, looking for classes and class members that gave me the hierarchy that I was expecting. And, as you can guess, the hierarchy was nowhere to be found.

To understand hierarchy and inheritance, here's a simple example:

![](.\media\carclasshierarchy.png)

So, here we have both inheritance and hierarchy. The class `Vehicle` provides some fields and methods. The class `Car` inherits those fields and methods and extends those with it's own. The `Car` class has instances of `Wheel`(as a list) and `Engine`, that all relate via this defined hierarchy.

This, I found, is not how Composition, and therefore Unity, works. Composition, as it was explained to me, is where objects are brought together within the context of other objects, to provide behaviour and functionality. So rather than inheriting functionality, and extending functionality through hierarchy, Composition allows us to bundle up all of the objects that provide the functionality that we need.

I found this great definition of Composition from this [source](https://abhiandroid.com/java/composition#:~:text=For%20example%3A%20A%20car%20has,then%20it%20is%20called%20composition.):

> When an object contains the other object and the contained object cannot exist without the other object, then it is called composition.

For the example above becomes quite different:

