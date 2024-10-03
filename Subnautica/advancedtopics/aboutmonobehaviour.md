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

As I've mentioned elsewhere in this guide, these offer great opportunities to "hook" our code into particular game classes. `Start`, `Awake`, and `OnEnable` are opportunities to tweak or completely override default behaviour, right at the point a component comes to life. This is often important so as to "seamlessly" manipulate code to make it behave how we want. Any time after those events have been triggered, and a component is likely to have exhibited some of it's default behaviour to the player, and we may not want that for our mod.

The `Update` and `LateUpdate` events are also very useful, as they run every frame. This gives us a way to influence a component's behaviour every single frame refresh, and so can be used to do things like change the movement path of an object. You do have to be careful when hooking into these events, as code you write is literally executed once per frame - so possibly 30, 60 or 120 times per second. Inefficiencies in your coding can be quickly magnified and cause unwanted dips in performance.
