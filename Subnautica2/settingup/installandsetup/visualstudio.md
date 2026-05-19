---
title: Installing Visual Studio
nav_order: 7
parent: Installation and set-up for SN2
---

# Visual Studio

Some complex mods require a Windows build environment, and the easiest way to set that up is to install Visual Studio Community Edition. Again, you don't need this if you're developing simple LUA mods, and I recommend only installing Visual Studio when you really need it.

To install, follow these steps:

1. Download the Visual Studio Community Edition installer and run it.
2. In the workloads tab, under Desktop & Mobile, enable the following :
   - NET desktop development
   - Desktop development with C++
   - .NET Multi-platform App UI development
   - Under Gaming, enable Game development with C++.
3. In the installer's Installation Details panel, expand Game development with C++ and enable the following options:
   - C++ profiling tools
   - C++ AddressSanitizer
   - Windows 10 or 11 SDK (10.0.18362 or Newer)
   - Unreal Engine installer![](.\media\visualstudioinstalloptions.png)
4. Click Install

Visual Studio fits into the broader tool chain when creating more complex mods in Unreal Engine, which we'll cover in detail in the "Advanced Modding" section of the guide.
