---
title: About Harmony
nav_order: 6
---

# About Harmony and HarmonyX

Harmony, and a fork called HarmonyX, are tools that are integral to modding Subnautica, and indeed many other games. This is a beginners guide, so I won't go into too much detail (as I beginner myself, I actually can't!), but some background is useful to give context to the tutorial ahead. When I refer to Harmony, you can apply the same context to HarmonyX in terms of this guide.

Very simply put, Harmony provides the mechanism that allows you to run your mod code within the game code environment. It allows you to "inject" your own code at specific points within the game, and gives us the access to the game objects that we then modify to deliver our mod functionality.

A good place to start learning is the official documentation for [Harmony](https://harmony.pardeike.net/) or [HarmonyX](https://github.com/BepInEx/HarmonyX/wiki).

If there's one key takeaway that you should get from digging into Harmony, it's this:

You will typically apply one of four types of patch

1. **Prefix**  - use this to run your code before the method that you're patching. So, if you want to do something before some code is run, use a prefix patch.
2. **Postfix** - use this to run your code after the method that you're patching. So, if you want to do something after some code is run, use a postfix patch.
3. **Finaliser** - use this is you want your code to run, no matter what!
4. **Transpiler** - a complex patch type that allows you to inject low level CIL (Common Intermedia Language) code. I won't be going anywhere near this for a long, long time!

We'll talk about `Prefix` and `Postfix` in the tutorial. The other two are more complex and beyond the scope of this beginners guide.

Note also that BepInEx "abstracts" many features of Harmony, making direct use of it unnecessary. There may be situations where you want to use Harmony directly, or even situations where you don't need Harmony, BepInEx, or Nautilus at all. There may be situations where other tools that abstract Harmony (or don't!) become relevant. It all depends on your approach and needs, so you should always keep an open mind as to how you might achieve the goal of your mod.

I really recommend you go through the docs linked at the top of the page and familiarise yourself with these tools.
