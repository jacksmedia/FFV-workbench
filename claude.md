GM, I do hope you're reporting well.
I'd like your help running some debugging tests in my hobby project, the dir you're in right now.

Goals:
- Deducing how to build a hack, and offering working bytecode is the primary goal.
- Teaching me how the SNES component processors work and pass data back and forth is a secondary goal.

Context is:
- this is a romhacking project of a SNES file, ff5c.sfc (backup without recent test changes is ff5c.sfc.bak)
- user is technical but not expert in romhacking nor debugging and appreciates learning about the methods
- special alpha build of an emulator is available via an MCP server; breakpoints DO NOT work, but memory can be read and edited
- user already has emulator running and unpaused; can do playtesting as needed to aid your data tests
- docs on the special MCP emulator are at /Mesen2-Expanded/README.md (does not admit that breakpoints aren't implemented)
- current quest is to assist user by isolating how to build a minimal ASM hack to edit how the game deals with color palettes
- _WIP.txt has a comprehensive roadmap of the past few weeks; read the bottom 800 lines to get up to speed