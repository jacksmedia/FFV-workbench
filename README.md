# FFV Romhacking & Tools Workspace

Personal workspace for Final Fantasy V romhacking, decomp research, and ff6tools development.

## Directory Structure

```
crawler/
├── tools/                    # ff6tools fork (git repo)
│   └── Fork of everything8215/ff6tools with FFV enhancements
│
├── WW-project/               # Wounded Wardrobe ASM hack
│   ├── _WIP.txt              # Main work log
│   ├── scripts/              # Patch generators, debug tools
│   ├── patches/              # Generated IPS files
│   ├── docs/                 # Screenshots, progress logs
│   └── *sprites/             # Custom sprite work
│
├── ffv-decomp/               # FFV decomp & research
│   ├── third-party/          # Community disassemblies & guides
│   ├── analysis-tools/       # Python scripts for ROM analysis
│   ├── generated-data/       # JSON/TXT data extracts
│   ├── sound/                # SPC-700 driver research
│   ├── notes/                # Documentation & audits
│   └── screencaps/           # Reference screenshots
│
├── spc-transpiler/           # SPC-700 webapp (future standalone repo)
│
├── experiments/              # Dormant/exploratory projects
│   └── ff1-threejs/          # FF1 Three.js map viewer
│
├── Mesen2-Expanded/          # Emulator with MCP server (external tool)
│
└── out/                      # Build outputs (not tracked)
    └── spcmake_byFF5/        # Clone of pgate1/spcmake_byFF5
```

## Git Repositories

| Location | Remote | Status |
|----------|--------|--------|
| `tools/` | jacksmedia/tools (upstream: everything8215/ff6tools) | Active |
| `out/spcmake_byFF5/` | pgate1/spcmake_byFF5 | Reference clone |

## ROMs

ROM files (*.sfc, *.smc, *.nes) are kept in root for easy access. **Never commit ROM files.**

## Key Documents

- `PROJECT_AUDIT_2026-06-15.md` - Full project survey
- `WW-project/_WIP.txt` - Wounded Wardrobe development log
- `ffv-decomp/notes/DOC_GAP_AUDIT.md` - FFV decomp coverage analysis

---
*Maintained with Claude Code*
