---
title: Subnautica Layers and Collisions
nav_order: 1
parent: References
---

# Subnautica Layers and Collisions

These are the layers and the layer collision matrix currently in use in Subnautica.

## Layers

| Layer Index | Layer Name          |
| ----------- | ------------------- |
| 0           | Default             |
| 1           | TransparentFX       |
| 2           | Ignore Raycast      |
| 4           | Water               |
| 5           | UI                  |
| 8           | Viewmodel           |
| 9           | OnlyVehicle         |
| 10          | BuildPreview        |
| 11          | BuiltEntities       |
| 12          | HardPoints          |
| 13          | Useable             |
| 14          | IgnoreDepthWorldUI  |
| 15          | Minimap             |
| 16          | HUDRenderTexture    |
| 17          | Vehicle             |
| 18          | FrontEnd            |
| 19          | Player              |
| 20          | TouchScreen         |
| 21          | Trigger             |
| 22          | NotUseable          |
| 23          | SubRigidbodyExclude |
| 24          | RenderForAllCameras |
| 26          | DiveReel            |
| 27          | Occluder            |
| 28          | BaseClipProxy       |
| 29          | Sky                 |
| 30          | TerrainCollider     |
| 31          | DebugOverlays       |

## Layer Collision Matrix

| Layer               | Default | TransparentFX | Ignore Raycast | Water | UI   | Viewmodel | OnlyVehicle | BuildPreview | BuiltEntities | HardPoints | Useable | IgnoreDepthWorldUI | Minimap | HUDRenderTexture | Vehicle | FrontEnd | Player | TouchScreen | Trigger | NotUseable | SubRigidbodyExclude | RenderForAllCameras | DiveReel | Occluder | BaseClipProxy | Sky  | TerrainCollider | DebugOverlays |
| ------------------- | ------- | ------------- | -------------- | ----- | ---- | --------- | ----------- | ------------ | ------------- | ---------- | ------- | ------------------ | ------- | ---------------- | ------- | -------- | ------ | ----------- | ------- | ---------- | ------------------- | ------------------- | -------- | -------- | ------------- | ---- | --------------- | ------------- |
| Default             | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | x                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| TransparentFX       | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Ignore Raycast      | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Water               | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| UI                  | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Viewmodel           | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| OnlyVehicle         | x       | x             | x              | x     | x    | x         | x           | x            | x             | x          | x       | x                  | x       | x                | ✓       | x        | x      | x           | x       | x          | ✓                   | x                   | x        | x        | x             | x    | x               | x             |
| BuildPreview        | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| BuiltEntities       | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| HardPoints          | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Useable             | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | x                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| IgnoreDepthWorldUI  | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Minimap             | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| HUDRenderTexture    | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Vehicle             | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | ✓           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| FrontEnd            | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Player              | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| TouchScreen         | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Trigger             | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| NotUseable          | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| SubRigidbodyExclude | x       | ✓             | ✓              | ✓     | ✓    | ✓         | ✓           | ✓            | ✓             | ✓          | x       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| RenderForAllCameras | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| DiveReel            | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Occluder            | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| BaseClipProxy       | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| Sky                 | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| TerrainCollider     | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |
| DebugOverlays       | ✓       | ✓             | ✓              | ✓     | ✓    | ✓         | x           | ✓            | ✓             | ✓          | ✓       | ✓                  | ✓       | ✓                | ✓       | ✓        | ✓      | ✓           | ✓       | ✓          | ✓                   | ✓                   | ✓        | ✓        | ✓             | ✓    | ✓               | ✓             |

