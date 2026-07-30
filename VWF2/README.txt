VWF2 - FFV Advanced Menu Font Project
======================================
Collected 2026-07-22

THE ROM TO TEST
---------------
  ff5c_v5_poolfix.sfc   <-- LOAD THIS ONE IN MESEN

  This ROM has:
  - Full menu VWF v5 installed (all text proportionally spaced)
  - Left-aligned narrow glyphs (i, l, I, T, :, ;, etc.) with tighter widths
  - Pool-reset fix to prevent tile flash on sub-window close
  - Assembled from asm/menu_vwf_v5.asm + asm/menu_vwf_widths.asm

BACKUP
------
  ff5c_v4bak.sfc        - v4.2 (digit-only VWF, pre-v5) for rollback

HOW TO REBUILD
--------------
  1. Edit font tiles in TileMolester (the ROM's font is at $D1F000 / file 0x11F000)
  2. Run: python tools/gen_menu_width_table.py
     (reads ff5c.sfc in parent dir, writes asm/menu_vwf_widths.asm)
  3. Copy widths back: cp asm/menu_vwf_widths.asm ../ffv-decomp/asm/
  4. Assemble: cd asm && ./asar.exe menu_vwf_v5.asm ../../ff5c.sfc
  5. Copy result: cp ../../ff5c.sfc ./ff5c_v5_poolfix.sfc

FILE REFERENCE
--------------
asm/
  menu_vwf_v5.asm       - Current VWF code (v5 + pool-reset fix)
  menu_vwf_widths.asm   - Generated width table (4-8px per glyph)
  menu_vwf_v4.asm       - Previous version (digit-only MVP)
  menu_vwf_v3.asm       - Earlier iteration
  menu_vwf_v2.asm       - Earlier iteration
  menu_vwf.asm          - Original v1
  asar.exe              - Assembler

tools/
  gen_menu_width_table.py   - Measures glyph widths from font pixels
  prototype_2bpp_vwf.py     - Renderer/decoder library (used by generator)

docs/
  VWF2-project-precis.pdf        - Project overview + Claude Fable convo log
  VFW_2BPP_QUEST_HANDOFF.md      - Technical architecture notes

ffv_menufont_ff5c.tbl   - TileMolester table file for font tile mapping

WHAT TO TEST
------------
1. Reload ff5c_v5_poolfix.sfc in Mesen (full reload, not reset)
2. Open any menu - narrow letters (i, l, !, .) should look tighter
3. Navigate into a sub-window (item details, job abilities, shop)
4. Back out - the "chaotic flash" should be gone or much reduced
5. Try the shop list and other dense text areas
