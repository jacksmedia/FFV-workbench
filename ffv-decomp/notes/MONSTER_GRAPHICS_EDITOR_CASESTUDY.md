# Building a Custom ff6tools Editor: Monster Graphics Case Study

**Author:** Claude (with xj4x)  
**Date:** June 2026  
**Purpose:** Teaching document for building future ff6tools editors

---

## Introduction

This document chronicles the construction of a custom Monster Graphics editor for FFV within the ff6tools webapp. It's written as a pedagogical guide — part narrative, part technical reference — so that future developers (human or AI) can learn from the patterns, pitfalls, and "aha moments" encountered along the way.

The ff6tools codebase is a mature HTML5 application without modern framework reactivity. Understanding its architecture is essential before attempting modifications.

---

## Part 1: Understanding ff6tools Architecture

### The Core Classes

ff6tools is built around a few key abstractions:

1. **ROMEditor** — Base class for all editors. Provides lifecycle methods and common UI patterns.
2. **ROMObserver** — The reactivity system. Editors register callbacks that fire when ROM data changes.
3. **PropertyList** — Renders the right-side property panel based on ROM object assemblies.
4. **GFX.PPU** — A software PPU emulator for rendering SNES graphics.

### Editor Lifecycle

Every editor follows this lifecycle:

```
User selects item in hierarchy
    └─> propertyList.showEditor(editor)
            └─> editor.show()           // Setup, attach sensors
            └─> editor.selectObject()   // Load specific item
                    └─> loadData()      // Editor-specific loading
                    └─> resetControls() // Rebuild toolbar
                    └─> resize()        // Calculate dimensions
                    └─> redraw()        // Render to canvas
```

When the user navigates away:
```
propertyList.hide()
    └─> editor.hide()   // Detach sensors, stop observing
```

### The Observer Pattern

This is perhaps the most important concept. ff6tools doesn't use React-style state management or two-way binding. Instead, it uses a classic Observer pattern:

```javascript
// In your editor's load method:
this.observer.startObservingSub(this.gfxProperties, this.loadMonster);

// What this does:
// 1. Iterates through all properties in gfxProperties.assembly
// 2. Registers loadMonster as a callback on each property
// 3. When ANY property calls notifyObservers(), loadMonster fires
```

**Critical Gotcha #1:** The observer callback only fires your registered method. If that method doesn't call `redraw()`, nothing visual happens. The property panel will update (it has its own observer calling `showProperties()`), but your canvas won't.

**The Fix:** Ensure your data-loading chain ends with a redraw:
```javascript
loadMonster() {
    // ... load data ...
    this.loadMap();
}

loadMap() {
    // ... process map data ...
    this.buildTilemap();
    this.updateInfo();  // Update any info displays
    this.redraw();      // THIS IS ESSENTIAL
}
```

---

## Part 2: Browsing vs. Editing — The Properties Array Pattern

### The Problem

Monster graphics data in FFV is heavily deduplicated. Multiple monsters share the same graphics, palettes, and tile maps. The ROM stores:
- ~50 unique graphics blobs
- ~60 unique palettes  
- ~80 unique tile maps
- 384 monster entries that reference these via pointers

If you browse the deduplicated arrays directly, you see raw data without context. Users want to browse "monsters" and see their complete visual representation.

### The Solution: Properties Arrays

ff6tools uses a "properties array" pattern. Instead of browsing the raw data, you browse a parallel array that holds pointers:

```javascript
// In ff5u-sfc.json:
"monsterGraphicsProperties": {
    "type": "array",
    "arrayLength": 384,
    "assembly": {
        "graphicsPointer": { "type": "property", "pointerTo": "monsterGraphics" },
        "palette": { "type": "property", "pointerTo": "monsterPalette" },
        "smallMap": { "type": "property", "mask": "0x7F" },
        "largeMap": { "type": "property", "mask": "0x7F" },
        "useLargeMap": { "type": "property", "mask": "0x80" },
        "is3bpp": { "type": "property", "mask": "0x80" }
    }
}
```

**Key Insight:** Your editor's `selectObject()` receives items from this properties array, not the raw data. To get actual graphics bytes, you resolve the pointer:

```javascript
const graphicsObject = this.gfxProperties.graphicsPointer.target;
this.graphicsData = graphicsObject.data;
```

### The .target Resolution

When a property has `pointerTo`, it becomes a pointer property. The `.target` getter resolves the pointer to the actual ROM object:

```javascript
// Property definition says: pointerTo: "monsterPalette"
// Property value is: 0x12 (index 18)
// .target returns: rom.monsterPalette.item(18)
```

This indirection is powerful — changing the dropdown in the property panel changes `.target`, and your observer callback fires automatically.

---

## Part 3: Rendering with the PPU

### Setting Up a PPU Layer

The `GFX.PPU` class emulates SNES graphics rendering. Here's the pattern:

```javascript
redraw() {
    // 1. Create fresh PPU
    this.ppu = new GFX.PPU();
    this.ppu.pal = this.rom.gammaCorrectedPalette(this.paletteData);
    this.ppu.width = pixelWidth;
    this.ppu.height = pixelHeight;

    // 2. Configure layer 0 (sprite layer for monsters)
    this.ppu.layers[0].format = GFX.tileFormat.snesSpriteTile;
    this.ppu.layers[0].cols = this.mapSize;
    this.ppu.layers[0].rows = this.mapSize;
    this.ppu.layers[0].gfx = this.graphicsData;
    this.ppu.layers[0].tiles = this.tiles;  // Your tilemap array
    this.ppu.layers[0].main = true;

    // 3. Render to ImageData
    const imageData = ctx.createImageData(pixelWidth, pixelHeight);
    this.ppu.renderPPU(imageData.data);
    ctx.putImageData(imageData, 0, 0);
}
```

### Tile 0 Convention

SNES sprites treat tile 0 as transparent. If your graphics data starts at tile 1, you need to pad:

```javascript
// Leave first tile (64 bytes for 4bpp) blank
this.graphicsData = new Uint8Array(graphicsObject.data.length + 64);
this.graphicsData.set(graphicsObject.data, 64);  // Offset by one tile
```

Your tilemap should use 0 for transparent positions, 1+ for actual tiles.

### 3bpp vs 4bpp Formats

Monster graphics can be either format. The flag is stored in the properties:

```javascript
const format = this.gfxProperties.is3bpp.value ? 'snes3bpp' : 'snes4bpp';
if (graphicsObject.format !== format) {
    graphicsObject.format = format;
    graphicsObject.disassemble(graphicsObject.parent.data);  // Re-decode
}
```

**Gotcha #2:** If you don't check and update the format, you'll render garbage when switching between 3bpp and 4bpp monsters.

---

## Part 4: PNG Import/Export

### Using ROMGraphicsExporter

For export, create an exporter and pass a configuration object:

```javascript
exportGraphics() {
    const exporter = new ROMGraphicsExporter();
    exporter.export({
        tilemap: this.tiles,
        graphics: this.graphicsData,
        palette: this.paletteData,
        width: this.mapSize,       // Tiles wide
        tileWidth: 8,
        tileHeight: 8,
        backColor: false           // Don't include background color
    });
}
```

### Using ROMGraphicsImporter

Import is trickier — you need a "mock graphics view" that mimics what the importer expects:

```javascript
importGraphics() {
    const self = this;
    
    function callback(graphics, palette) {
        self.rom.beginAction();  // Start undo group
        
        if (graphics && graphicsObject) {
            // Remove the blank first tile we added
            const importData = graphics.subarray(64);
            graphicsObject.setData(importData);
        }
        
        if (palette && paletteObject) {
            paletteObject.setData(new Uint8Array(palette.buffer));
        }
        
        self.rom.endAction();  // End undo group
        self.loadMonster();
        self.redraw();
    }

    // Mock view object
    const mockGraphicsView = {
        rom: this.rom,
        format: this.gfxProperties.is3bpp.value 
            ? GFX.graphicsFormat.snes3bpp 
            : GFX.graphicsFormat.snes4bpp,
        graphics: this.graphicsData,
        width: this.mapSize,
        height: this.mapSize,
        tileWidth: 8,
        tileHeight: 8,
        backColor: false,
        paletteView: {
            palette: this.paletteData,
            colorsPerPalette: 16,
            colorsPerRow: 16,
            rowsPerPalette: 1,
            p: 0
        },
        selection: { 
            w: this.mapSize, 
            h: this.mapSize, 
            tilemap: this.tiles 
        }
    };

    new ROMGraphicsImporter(this.rom, mockGraphicsView, callback);
}
```

**Gotcha #3:** The original implementation was using the YAML export path instead of calling ROMGraphicsExporter. Compare against working editors (like Character Graphics) when something doesn't work.

---

## Part 5: UX Refinements

### Toolbar Buttons

Add custom buttons in `resetControls()`:

```javascript
resetControls() {
    super.resetControls();  // Get zoom slider, etc.
    
    const buttonDiv = document.createElement('div');
    buttonDiv.style.display = 'inline-flex';
    buttonDiv.style.gap = '4px';
    
    // Import button (folder icon = "open")
    const importBtn = document.createElement('button');
    importBtn.classList.add('toolbox-button');
    importBtn.innerHTML = '<i class="fas fa-folder-open"></i> PNG';
    importBtn.onclick = () => this.importGraphics();
    buttonDiv.appendChild(importBtn);
    
    // Export button (save icon = "save")
    const exportBtn = document.createElement('button');
    exportBtn.classList.add('toolbox-button');
    exportBtn.innerHTML = '<i class="fas fa-save"></i> PNG';
    exportBtn.onclick = () => this.exportGraphics();
    buttonDiv.appendChild(exportBtn);
    
    this.editControls.appendChild(buttonDiv);
}
```

**UX Insight:** Button order should match app conventions. The app's main toolbar has "Open ROM" (folder) before "Save ROM" (diskette), so import should come before export.

### Dynamic Info Display

Show contextual information that updates with the data:

```javascript
// In resetControls():
const infoDiv = document.createElement('div');
infoDiv.id = 'monster-info';  // ID for later updates
this.editControls.appendChild(infoDiv);

// Separate update method:
updateInfo() {
    const infoDiv = document.getElementById('monster-info');
    if (infoDiv && this.gfxProperties) {
        const mapType = this.gfxProperties.useLargeMap.value 
            ? 'Large (16x16)' : 'Small (8x8)';
        const format = this.gfxProperties.is3bpp.value ? '3bpp' : '4bpp';
        infoDiv.innerHTML = `Map: ${mapType} | Format: ${format}`;
    }
}
```

Call `updateInfo()` from your observer chain so it updates when properties change.

---

## Part 6: Edge Cases and Special Handling

### Nonstandard Entries

Some ROM entries don't follow the normal pattern. Document these:

```
Entries 363-383: Special/unused slots
Entries 370-371: Use hardcoded graphics at D9:2D00 and D9:2D90
                 (3bpp format, 0x80 bytes each)
                 These don't use the normal pointer system
```

For a robust editor, you may need special-case handling:

```javascript
if (this.m >= 370 && this.m <= 371) {
    // Load from hardcoded addresses instead of pointer
    const offset = this.m === 370 ? 0x0D2D00 : 0x0D2D90;
    // ... special loading logic ...
}
```

### ResizeSensor for Responsive Layout

The editor area can resize. Use ResizeSensor to respond:

```javascript
show() {
    const editTop = document.getElementById('edit-top');
    if (!this.resizeSensor) {
        this.resizeSensor = new ResizeSensor(editTop, () => {
            this.resize();
            this.redraw();
        });
    }
}

hide() {
    if (this.resizeSensor) {
        this.resizeSensor.detach(editTop);
        this.resizeSensor = null;
    }
}
```

---

## Part 7: Checklist for Building a New Editor

1. **Define the data model**
   - What ROM arrays will you browse?
   - Do you need a properties array for indirection?
   - What pointers need resolving?

2. **Create the editor class**
   ```javascript
   class MyEditor extends ROMEditor {
       constructor(rom) {
           super(rom);
           this.name = 'MyEditor';
           this.observer = new ROMObserver(rom, this);
           // ... canvas setup ...
       }
   }
   ```

3. **Implement lifecycle methods**
   - `show()` — Attach sensors, initialize
   - `hide()` — Detach sensors, stop observing
   - `selectObject(object)` — Load specific item
   - `resetControls()` — Build toolbar
   - `resize()` — Calculate dimensions
   - `redraw()` — Render graphics

4. **Wire up the observer**
   - Call `startObservingSub()` or `startObserving()` in your load method
   - Ensure the callback chain ends with `redraw()`

5. **Register the editor** in the ROM definition JSON:
   ```json
   "monsterGraphicsProperties": {
       "editor": "FF5MonsterGraphicsEditor",
       ...
   }
   ```

6. **Test the full flow**
   - Selecting items in the list
   - Changing properties in the panel (do they trigger redraws?)
   - Import/export if applicable
   - Edge cases and special entries

---

## Lessons Learned

1. **The observer pattern is the reactivity model.** Don't fight it with event listeners — use it.

2. **Always end your observer callback chain with redraw().** The property panel updates automatically; your canvas doesn't.

3. **Browse properties arrays, not raw data.** Users think in terms of "monsters," not "graphics blob index 47."

4. **The .target getter is your friend.** It resolves pointers and makes the code read naturally.

5. **Compare against working editors.** When stuck, read how Character Graphics or Map Editor do things.

6. **Document edge cases.** Future you (or future Claude) will thank you.

7. **Match existing UX conventions.** Button order, icon choices, and info displays should feel consistent with the app.

---

## Files Referenced

- `tools/ff5/ff5-monster-graphics.js` — The editor built in this case study
- `tools/gui/romgui.js` — ROMGraphicsExporter, ROMGraphicsImporter
- `tools/gui/property-list.js` — Property panel rendering
- `tools/rom/rom-observer.js` — Observer pattern implementation
- `tools/rom/romtools.js` — Core ROM classes (ROMObject, ROMProperty, etc.)
- `tools/ff5/ff5u-sfc.json` — FFV ROM definition

---

*This document was written to help future editors get built faster and with fewer false starts. Good luck, and happy hacking!*
