---
title: About Monobehaviour
nav_order: 3
parent: Advanced modding
---

# About Monobehaviour

We talked in the previous topic about components and we talked a bit about inheritance. Core to Unity game development, and a crucial weapon in modding Unity games, is the fact that all Unity component scripts inherit from a class called `MonoBehaviour`. This class gives components that are built in Unity access to some fundamental methods and properties that make Unity development consistent, fast and intuitive.

If there's one thing that you should know about Monobehaviours it's that components that inherit from this class all listen for a number of Unity `messages`. You'll have come across some of these already, if you've been following the tutorial: `Start` and `Awake`. These are basically methods that get called automatically at certain points in the lifetime of a component. For example, the `Awake` method will be called when the component is initialised at run-time. The `Start` method will be called once all components `Awake` methods have been called.

This link shows a timeline of when these methods are called:

https://docs.unity3d.com/Manual/ExecutionOrder.html

