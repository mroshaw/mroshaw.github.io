---
title: Below Zero Layers and Collisions
nav_order: 2
parent: References
---

# Below Zero Layers and Collisions

These are the layers and the layer collision matrix currently in use in Subnautica: Below Zero.

## Layers

| Layer Index | Layer Name            |
| ----------- | --------------------- |
| 0           | Default               |
| 1           | TransparentFX         |
| 2           | Ignore Raycast        |
| 4           | Water                 |
| 5           | UI                    |
| 8           | Viewmodel             |
| 9           | OnlyVehicle           |
| 10          | BuildPreview          |
| 11          | BuiltEntities         |
| 12          | HardPoints            |
| 13          | Useable               |
| 14          | IgnoreDepthWorldUI    |
| 15          | SpyPengin             |
| 16          | IgnoreHoverbike       |
| 17          | Vehicle               |
| 18          | FrontEnd              |
| 19          | Player                |
| 21          | Trigger               |
| 22          | NotUseable            |
| 24          | RenderForAllCameras   |
| 25          | ControlRoomMinimap    |
| 26          | AllowPlayerAndVehicle |
| 27          | IntroSpace            |
| 28          | BaseClipProxy         |
| 29          | Sky                   |
| 30          | TerrainCollider       |
| 31          | DebugOverlays         |

## Layer Collision Matrix

| Layer                 | Default | TransparentFX | Ignore Raycast | Water | UI   | Viewmodel | OnlyVehicle | BuildPreview | BuiltEntities | HardPoints | Useable | IgnoreDepthWorldUI | SpyPengin | IgnoreHoverbike | Vehicle | FrontEnd | Player | Trigger | NotUseable | RenderForAllCameras | ControlRoomMinimap | AllowPlayerAndVehicle | IntroSpace | BaseClipProxy | Sky  | TerrainCollider | DebugOverlays |
| --------------------- | ------- | ------------- | -------------- | ----- | ---- | --------- | ----------- | ------------ | ------------- | ---------- | ------- | ------------------ | --------- | --------------- | ------- | -------- | ------ | ------- | ---------- | ------------------- | ------------------ | --------------------- | ---------- | ------------- | ---- | --------------- | ------------- |
| Default               | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| TransparentFX         | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Ignore Raycast        | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Water                 | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| UI                    | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Viewmodel             | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| OnlyVehicle           | x       | x             | x              | x     | x    | x         | x           | x            | x             | x          | x       | x                  | x         | x               | ✓       | x        | x      | x       | x          | x                   | x                  | x                     | x          | x             | x    | x               | x             |
| BuildPreview          | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| BuiltEntities         | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| HardPoints            | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Useable               | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | x                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| IgnoreDepthWorldUI    | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| SpyPengin             | ✓       | x             | x              | ✓     | x    | x         | x           | x            | x             | ✓          | ✓       | x                  | x         | ✓               | ✓       | x        | ✓      | ✓       | ✓          | x                   | ✓                  | ✓                     | ✓          | x             | x    | ✓               | x             |
| IgnoreHoverbike       | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | x               | ✓       | x        | ✓      | x       | ✓          | x                   | x                  | ✓                     | ✓          | x             | x    | x               | x             |
| Vehicle               | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | ✓           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | x                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| FrontEnd              | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Player                | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | x                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Trigger               | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| NotUseable            | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| RenderForAllCameras   | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| ControlRoomMinimap    | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| AllowPlayerAndVehicle | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | x       | ✓                  | ✓         | ✓               | x       | ✓        | x      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| IntroSpace            | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | ✓               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| BaseClipProxy         | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| Sky                   | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| TerrainCollider       | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |
| DebugOverlays         | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | x         | x               | ✓       | ✓        | ✓      | ✓       | ✓          | ✓                   | ✓                  | ✓                     | ✓          | ✓             | ✓    | ✓               | ✓             |