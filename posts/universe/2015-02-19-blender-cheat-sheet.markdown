---
title: Blender Cheat-sheet
tags: howto
---

## Blender Cheat-sheet

### Entering edit mode and editing object effectively

 - Shift+a — create a primitive (we should have something to edit first, don't we?)
 - Tab — enter edit mode
 - z — object shading switch (toggles see-through "wireframe")
 - Ctrl+r — enter median-cut mode (you can use mouse wheel to increase number of cuts)
 - N — transform panel
 - Ctrl+l — link certain things across selection

### Selection in edit mode

 - b
    - box with left-click — add vertices to selection
    - box with middle-click — remove vertices from selection
 - Shift+left-click — add a vertex to selection
 - Shift+right-click — remove a vertex from selection
 - a — toggle select all vertices

### Object cuts (in edit mode)

 - Ctrl+r — normal (orthogonal) cut
    - scroll-up — increase number of cuts
    - scroll-down — decrease number of cuts
    - right-click — apply (after application, you can use ``g``/``s`` to move or scale selected vertices)
 - Ctrl+b — corner cut ([Bevel](http://wiki.blender.org/index.php/Doc:2.6/Manual/Modeling/Meshes/Editing/Subdividing/Bevel))
    - move mouse — place the cut
    - scroll-up — increase number of cuts
    - scroll-down — decrease number of cuts

### Viewport manipulation

 - NUM5 — toggle isometry
 - NUM7 — top ortho
 - NUM1 — front ortho
 - NUM3 — right ortho

### Text manipulation

 - [Read this chapter](http://en.wikibooks.org/wiki/Blender_3D:_Noob_to_Pro/Text_in_BGE)

### Moving cursor and origin

 - Shift+s — cursor menu
 - Ctrl+Alt+Shift+c — origin and center of mass manipulation

### Helpful codes

#### Render project on GPU on server

```
time blender \
  -b ./file.blend \
  -o "/tmp/out$(date --iso-8601=seconds)" \
  -F JPEG \
  -P ~/memoricide/goodies/misc/gpurenderpre.py \
  -x 1 -f 1
```

where ``gpurenderpre.py`` is

```
import bpy
bpy.context.scene.render.engine = 'CYCLES'
bpy.data.scenes['Scene'].cycles.samples=500
bpy.context.scene.cycles.device = 'GPU'
```
