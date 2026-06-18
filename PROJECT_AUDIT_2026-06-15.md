# Project Audit & Archival Strategy
**Date:** 2026-06-15  
**Directory:** `C:\Users\xj4x\Documents\5work\crawler`

---

## Executive Summary

This directory contains 6 distinct project threads, 2 git repositories, and extensive reference materials. The primary VCS concern is that **ff6tools** (the most active codebase) lacks an upstream remote to the original `everything8215/ff6tools` repository, which will complicate future sync/PR workflows.

---

## Project Inventory

### 1. ff6tools Fork (ACTIVE - HIGH PRIORITY)
**Location:** `./tools/`  
**Git Remote:** `https://github.com/jacksmedia/tools.git`  
**Branch:** `ff5-metadata-update`  
**Commits:** 244 total, 15+ in 2026  

**Status:** Active development. Recent work includes:
- Monster Graphics custom editor (Jun 14-15)
- FFV UI overhaul  
- 3,803 named string table entries
- Event/trigger map integration

**VCS Issues:**
- ❌ No `upstream` remote configured to `https://github.com/everything8215/ff6tools`
- ❌ Working on feature branch, no clear merge strategy to main
- ❌ gh-pages branch exists but unclear deployment status

**Recommended Actions:**
```bash
cd tools
git remote add upstream https://github.com/everything8215/ff6tools.git
git fetch upstream
# Then periodically:
git merge upstream/gh-pages --allow-unrelated-histories
```

---

### 2. Wounded Wardrobe ASM Hack (ACTIVE)
**Location:** Root directory (scattered files)  
**Git:** None  

**Key Files:**
- `_WIP.txt` - Comprehensive work log (380 lines)
- `patch_WW_v1_2.py`, `patch_WW_v2.py` - Patch generators
- `WW_v0_*.ips` - Generated patches
- `WW_sprites/` - Custom sprite assets
- `ww-log.pdf`, `WW1.3-progress.png` - Documentation

**Status:** Phase 1 COMPLETE (NOP at C1:B1C7). Phase 2 (job-specific KO sprites) in progress.

**Recommended Actions:**
- Create `wounded-wardrobe/` subdirectory
- Initialize git repo for patch scripts and sprites
- Keep ROMs and binaries in `.gitignore`

---

### 3. SPC-700 / Sound Driver Quest (ACTIVE)
**Location:** Multiple  
**Git:** `./out/spcmake_byFF5/` (clone of pgate1/spcmake_byFF5)

**Key Files:**
- `disasm_spc700.py` - Custom disassembler
- `FFV_sound_driver_notes.txt` - Decoded driver documentation
- `spc-transpiler/` - New webapp (TypeScript/Vite, unversioned)
- `SPC-700 libs.md` - Reference URLs
- `FF5_soundo.pdf` - Reference doc

**Status:** Core quest DONE (Jun 12). 46 vcmds identified. Next: poke tests + webapp decoder.

**Recommended Actions:**
- Initialize git in `spc-transpiler/`
- Consider merging documentation into single location

---

### 4. FFV Documentation/Decomp Quest (REFERENCE)
**Location:** Root directory  
**Git:** None

**Key Files:**
- `DOC_GAP_AUDIT.md` - Gap analysis document
- `Bank_C*_disassembly_*.txt` - Third-party disassemblies
- `c2battle_by_Modoh.asm` - Battle system decomp
- `context.md` - 124KB context document
- Python scripts: `doc_gap_audit.py`, `disasm65816.py`, etc.
- Generated JSONs: `ffv_event_names_*.json`, `ffv_map_atlas.json`, etc.

**Status:** Ongoing reference work. DOC_GAP_AUDIT.md tracks what's missing from community decomps.

**Recommended Actions:**
- Create `docs/` or `decomp-reference/` subdirectory
- Keep third-party disassemblies separate from original work

---

### 5. FF1 Three.js Experiment (DORMANT)
**Location:** Root directory  
**Git:** None

**Key Files:**
- `ff1_demo.html` - Demo page
- `ff1_assets.js` - 1.3MB asset file
- `ff1_world_preview.png`

**Status:** Experimental/dormant. Not recently touched.

**Recommended Actions:**
- Move to `experiments/ff1-threejs/` or archive separately

---

### 6. Mesen2-Expanded (TOOL - EXTERNAL)
**Location:** `./Mesen2-Expanded/`  
**Git:** Separate repo (not checked)

**Status:** Fork of Mesen emulator with MCP server. Used as debugging tool. Breakpoints don't work; memory read/edit only.

**Recommended Actions:**
- Document in README that this is an external tool
- No need to track in main project VCS

---

## Directory Reorganization Proposal

```
crawler/
├── CLAUDE.md
├── PROJECT_AUDIT_2026-06-15.md
├── README.md (NEW - project overview)
│
├── tools/                    # ff6tools fork (existing git repo)
│   └── ...
│
├── wounded-wardrobe/         # NEW - consolidate WW hack
│   ├── _WIP.txt
│   ├── patches/
│   ├── sprites/
│   └── scripts/
│
├── spc-700/                  # NEW - consolidate sound work
│   ├── spc-transpiler/       # webapp
│   ├── notes/
│   └── tools/
│
├── decomp-reference/         # NEW - third-party docs
│   ├── disassemblies/
│   └── guides/
│
├── experiments/              # NEW - dormant/exploratory
│   └── ff1-threejs/
│
├── roms/                     # NEW - consolidate ROM files
│   └── .gitignore           # NEVER commit ROMs
│
└── Mesen2-Expanded/          # External tool (unchanged)
```

---

## Git Strategy for ff6tools

### Immediate Actions
1. Add upstream remote
2. Fetch upstream branches
3. Document divergence from upstream

### Branch Strategy
- `main` or `gh-pages` - sync with upstream
- `ff5-metadata-update` - current feature work
- Consider: `ffv-dev` long-running branch for all FFV enhancements

### Commit Conventions
Current: Using emoji prefixes (🛠️, ✨, 🐛)  
Recommendation: Continue, but add scope: `✨(monster-gfx) Add tile arrangement editor`

---

## Archival Priorities

| Priority | Project | Action |
|----------|---------|--------|
| HIGH | ff6tools | Add upstream, document fork status |
| HIGH | wounded-wardrobe | Consolidate files, init git |
| MEDIUM | spc-transpiler | Init git |
| LOW | ff1-threejs | Archive or move to experiments |
| N/A | Mesen2-Expanded | Leave as external tool |

---

## Memory Files Status

13 memory files in `.claude/projects/.../memory/`:
- Project overview, user profile
- Quest-specific notes (KO hack, SPC-700, doc audit)
- Technical patterns (Monster Graphics editor)

All current and accurate as of this audit.

---

## Next Steps

1. [ ] Add upstream remote to `tools/`
2. [ ] Create `wounded-wardrobe/` directory structure  
3. [ ] Init git for `spc-transpiler/`
4. [ ] Create root `README.md` with project overview
5. [ ] Move scattered files to organized subdirectories
6. [ ] Add `.gitignore` templates for ROM files

---

*Generated by Claude Code audit session*
