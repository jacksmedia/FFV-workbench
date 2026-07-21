# SPC-700 Cross-Game Music Transpiler

## Feature Overview

A Vite + TypeScript webapp that enables cross-game SNES SPC-700 music transpilation between FF4, FF5, FF6, and FFMQ. Users can load ROMs, extract music tracks, preview playback via WebAudio, transpile to another game's encoding, and inject back into ROMs.

## Reference Documentation

- `chillyfeez-FF4-music-hacking.txt` - FF4 sequence format, note tables, commands
- `FF5_soundo.pdf` - FF5 ROM offsets, sample locations, sequence pointers
- `Gnilda-guide-FFV.pdf` - FF5 control codes (D2-FB range)
- `Gnilda-guide-FF6.pdf` - FF6 control codes (C4-FF range)
- `FFMQ-rom-map.txt` - FFMQ sequence offsets, note encoding (same as FF5)

## Reference Repositories

- pgate1/spcmake_byFF4, spcmake_byFF5, spcmake_byFF6
- astriiddev/Super-BRR-Converter
- gocha/split700

---

## Phase 1: Project Setup

- [ ] T001 Initialize Vite + TypeScript project with `npm create vite@latest . -- --template vanilla-ts`
- [ ] T002 Configure tsconfig.json with strict mode and path aliases in `tsconfig.json`
- [ ] T003 Install dependencies: Install tailwindcss, @headlessui/react (if React), or vanilla CSS in `package.json`
- [ ] T004 Create project directory structure per implementation plan in `src/`
- [ ] T005 Create index.html with basic layout shell in `index.html`
- [ ] T006 Create main entry point and app initialization in `src/main.ts`

## Phase 2: Foundational - Core Types & Constants

- [ ] T007 Define SPC-700 DSP register types and constants in `src/types/dsp.ts`
- [ ] T008 Define BRR sample format types in `src/types/brr.ts`
- [ ] T009 Define intermediate MML AST node types in `src/types/ast.ts`
- [ ] T010 Define ROM metadata and game detection types in `src/types/rom.ts`
- [ ] T011 Define track/sequence data structures in `src/types/sequence.ts`
- [ ] T012 [P] Create FF4 note table constants (00-D1 range, 15 durations) in `src/constants/ff4-tables.ts`
- [ ] T013 [P] Create FF5/FFMQ note table constants (00-B3 range, 15 durations) in `src/constants/ff5-tables.ts`
- [ ] T014 [P] Create FF6 note table constants (00-A7 range, 14 durations) in `src/constants/ff6-tables.ts`
- [ ] T015 [P] Create FF4 command opcode constants (D2-FF) in `src/constants/ff4-commands.ts`
- [ ] T016 [P] Create FF5 command opcode constants (D2-FB) in `src/constants/ff5-commands.ts`
- [ ] T017 [P] Create FF6 command opcode constants (C4-FF) in `src/constants/ff6-commands.ts`
- [ ] T018 [P] Create FFMQ command opcode constants (D2-FF) in `src/constants/ffmq-commands.ts`
- [ ] T019 Create duration tick mapping utility in `src/utils/duration.ts`
- [ ] T020 Create byte manipulation utilities (little-endian reads, etc.) in `src/utils/bytes.ts`

---

## Phase 3: User Story 1 - ROM Loading & Game Detection

**Goal**: User can load a ROM file and the app auto-detects which game it is (FF4, FF5, FF6, or FFMQ).

**Independent Test**: Load each supported ROM type → correct game detected and metadata displayed.

- [ ] T021 [US1] Create ROM file input component in `src/components/RomLoader.ts`
- [ ] T022 [US1] Implement FileReader wrapper for ROM binary loading in `src/services/file-reader.ts`
- [ ] T023 [US1] Define game checksums and known header offsets in `src/constants/game-signatures.ts`
- [ ] T024 [US1] Implement FF4 detection (check header at $7FC0, internal name) in `src/services/detection/ff4-detect.ts`
- [ ] T025 [US1] Implement FF5 detection (check header, sequence pointer at $043B97) in `src/services/detection/ff5-detect.ts`
- [ ] T026 [US1] Implement FF6 detection (check header, known offsets) in `src/services/detection/ff6-detect.ts`
- [ ] T027 [US1] Implement FFMQ detection (check header at $6BDAE) in `src/services/detection/ffmq-detect.ts`
- [ ] T028 [US1] Create unified GameDetector service orchestrating all detectors in `src/services/game-detector.ts`
- [ ] T029 [US1] Create ROM metadata display component showing game info in `src/components/RomInfo.ts`
- [ ] T030 [US1] Implement ROM state management (loaded ROM, detected game) in `src/state/rom-state.ts`

---

## Phase 4: User Story 2 - Track Parsing to AST

**Goal**: User can see a list of all music tracks in the loaded ROM and select one to parse into an intermediate AST.

**Independent Test**: Load ROM → track list displayed → select track → AST generated with correct note/command data.

- [ ] T031 [US2] Create track index reader for FF4 (pointers at $2420F instrument, $3790E sequence) in `src/parsers/ff4/track-index.ts`
- [ ] T032 [US2] Create track index reader for FF5 (pointers at $043B97, 72 BGMs) in `src/parsers/ff5/track-index.ts`
- [ ] T033 [US2] Create track index reader for FF6 (similar structure to FF5) in `src/parsers/ff6/track-index.ts`
- [ ] T034 [US2] Create track index reader for FFMQ (pointers at $6BDAE, sequences at $750FD) in `src/parsers/ffmq/track-index.ts`
- [ ] T035 [US2] Implement FF4 sequence header parser (18-byte header, 8 track pointers) in `src/parsers/ff4/header-parser.ts`
- [ ] T036 [US2] Implement FF5 sequence header parser (22-byte header, 8 channel pointers) in `src/parsers/ff5/header-parser.ts`
- [ ] T037 [US2] Implement FF6 sequence header parser in `src/parsers/ff6/header-parser.ts`
- [ ] T038 [US2] Implement FFMQ sequence header parser in `src/parsers/ffmq/header-parser.ts`
- [ ] T039 [US2] Create FF4 note/tie/rest decoder (00-D1 range) in `src/parsers/ff4/note-decoder.ts`
- [ ] T040 [US2] Create FF5 note/tie/rest decoder (00-D1 range, same as FFMQ) in `src/parsers/ff5/note-decoder.ts`
- [ ] T041 [US2] Create FF6 note/tie/rest decoder (00-C3 range) in `src/parsers/ff6/note-decoder.ts`
- [ ] T042 [US2] Create FF4 command decoder (D2-FF, vibrato, volume, pan, etc.) in `src/parsers/ff4/command-decoder.ts`
- [ ] T043 [US2] Create FF5 command decoder (D2-FB, vibrato D7, tremolo D9, etc.) in `src/parsers/ff5/command-decoder.ts`
- [ ] T044 [US2] Create FF6 command decoder (C4-FF, vibrato C9, tremolo CB, etc.) in `src/parsers/ff6/command-decoder.ts`
- [ ] T045 [US2] Create FFMQ command decoder (D2-FF, note E5 length prefix) in `src/parsers/ffmq/command-decoder.ts`
- [ ] T046 [US2] Implement full FF4 track parser producing AST in `src/parsers/ff4/track-parser.ts`
- [ ] T047 [US2] Implement full FF5 track parser producing AST in `src/parsers/ff5/track-parser.ts`
- [ ] T048 [US2] Implement full FF6 track parser producing AST in `src/parsers/ff6/track-parser.ts`
- [ ] T049 [US2] Implement full FFMQ track parser producing AST in `src/parsers/ffmq/track-parser.ts`
- [ ] T050 [US2] Create unified parser factory selecting correct parser by game in `src/parsers/parser-factory.ts`
- [ ] T051 [US2] Create track list UI component in `src/components/TrackList.ts`
- [ ] T052 [US2] Create AST viewer/debugger component (tree view of parsed data) in `src/components/AstViewer.ts`

---

## Phase 5: User Story 3 - BRR Sample Extraction

**Goal**: User can view and extract BRR samples from the loaded ROM, with fingerprinting to identify sample origin.

**Independent Test**: Load ROM → sample list displayed → select sample → BRR data extracted → fingerprint computed.

- [ ] T053 [US3] Define BRR block structure (9 bytes: 1 header + 8 data) in `src/brr/brr-block.ts`
- [ ] T054 [US3] Implement BRR decoder (ADPCM to PCM conversion) in `src/brr/brr-decoder.ts`
- [ ] T055 [US3] Create FF4 sample table reader (offsets from header) in `src/brr/extractors/ff4-samples.ts`
- [ ] T056 [US3] Create FF5 sample table reader ($0446AA-$05E5E7 range per docs) in `src/brr/extractors/ff5-samples.ts`
- [ ] T057 [US3] Create FF6 sample table reader in `src/brr/extractors/ff6-samples.ts`
- [ ] T058 [US3] Create FFMQ sample table reader ($6BEA1-$6C1E1 indexes, $6C201 data) in `src/brr/extractors/ffmq-samples.ts`
- [ ] T059 [US3] Implement BRR fingerprinting (hash of decoded PCM waveform) in `src/brr/fingerprint.ts`
- [ ] T060 [US3] Create fingerprint database for known Squaresoft samples in `src/brr/fingerprint-db.ts`
- [ ] T061 [US3] Create sample list UI component with playback preview in `src/components/SampleList.ts`
- [ ] T062 [US3] Implement sample-to-WAV export utility in `src/brr/wav-export.ts`

---

## Phase 6: User Story 4 - WebAudio SPC Playback

**Goal**: User can preview source tracks via WebAudio-based SPC emulation before and after transpilation.

**Independent Test**: Parse track → click Play → audio plays correctly → Stop works → scrubbing works.

- [ ] T063 [US4] Create AudioContext wrapper with initialization in `src/audio/audio-context.ts`
- [ ] T064 [US4] Implement SPC-700 CPU emulator core (registers, addressing modes) in `src/audio/spc700/cpu.ts`
- [ ] T065 [US4] Implement SPC-700 DSP emulator (8 voices, BRR playback, ADSR) in `src/audio/spc700/dsp.ts`
- [ ] T066 [US4] Implement DSP voice state machine (keyon, keyoff, envelope) in `src/audio/spc700/voice.ts`
- [ ] T067 [US4] Implement BRR sample interpolation (gaussian) in `src/audio/spc700/interpolation.ts`
- [ ] T068 [US4] Implement echo buffer and FIR filter in `src/audio/spc700/echo.ts`
- [ ] T069 [US4] Create AST-to-SPC-state interpreter (drives DSP from AST) in `src/audio/ast-player.ts`
- [ ] T070 [US4] Implement playback controls (play, pause, stop, seek) in `src/audio/playback-controller.ts`
- [ ] T071 [US4] Create waveform visualizer component in `src/components/Waveform.ts`
- [ ] T072 [US4] Create playback UI with transport controls in `src/components/Player.ts`
- [ ] T073 [US4] Implement tempo/pitch adjustment for preview in `src/audio/tempo-pitch.ts`

---

## Phase 7: User Story 5 - AST to Target Bytecode Transpilation

**Goal**: User can select a target game and transpile the AST to that game's bytecode format with duration quantization.

**Independent Test**: Parse FF5 track → select FF6 target → transpile → output bytecode validates against FF6 format.

- [ ] T074 [US5] Create duration quantization utility (map ticks to nearest valid duration) in `src/transpiler/duration-quantizer.ts`
- [ ] T075 [US5] Create note pitch normalizer (octave + semitone to unified format) in `src/transpiler/pitch-normalizer.ts`
- [ ] T076 [US5] Create command opcode mapper (map semantically equivalent commands) in `src/transpiler/command-mapper.ts`
- [ ] T077 [US5] Implement FF4 bytecode encoder in `src/transpiler/encoders/ff4-encoder.ts`
- [ ] T078 [US5] Implement FF5 bytecode encoder in `src/transpiler/encoders/ff5-encoder.ts`
- [ ] T079 [US5] Implement FF6 bytecode encoder in `src/transpiler/encoders/ff6-encoder.ts`
- [ ] T080 [US5] Implement FFMQ bytecode encoder in `src/transpiler/encoders/ffmq-encoder.ts`
- [ ] T081 [US5] Create sequence header generator for each game in `src/transpiler/header-generator.ts`
- [ ] T082 [US5] Implement full transpilation pipeline (AST → normalize → quantize → encode) in `src/transpiler/transpile.ts`
- [ ] T083 [US5] Create transpilation options UI (target game, quantization mode) in `src/components/TranspileOptions.ts`
- [ ] T084 [US5] Create transpilation diff viewer (show what changed) in `src/components/TranspileDiff.ts`
- [ ] T085 [US5] Add transpilation warnings for lossy operations (duration quantization) in `src/transpiler/warnings.ts`

---

## Phase 8: User Story 6 - ROM Injection

**Goal**: User can inject transpiled sequence data back into a target ROM file and download the modified ROM.

**Independent Test**: Load target ROM → inject transpiled track → download → load in emulator → music plays.

- [ ] T086 [US6] Create ROM expansion utility (if sequence exceeds original size) in `src/rom/rom-expander.ts`
- [ ] T087 [US6] Implement FF4 sequence injection (update pointers at $2420F, $3790E) in `src/rom/injectors/ff4-inject.ts`
- [ ] T088 [US6] Implement FF5 sequence injection (update pointers at $043B97) in `src/rom/injectors/ff5-inject.ts`
- [ ] T089 [US6] Implement FF6 sequence injection in `src/rom/injectors/ff6-inject.ts`
- [ ] T090 [US6] Implement FFMQ sequence injection (update pointers at $6BDAE) in `src/rom/injectors/ffmq-inject.ts`
- [ ] T091 [US6] Create checksum recalculator for SNES ROMs in `src/rom/checksum.ts`
- [ ] T092 [US6] Implement sample injection (if source uses unique samples) in `src/rom/sample-injector.ts`
- [ ] T093 [US6] Create injection preview showing byte changes in `src/components/InjectionPreview.ts`
- [ ] T094 [US6] Create ROM download utility (Blob + download link) in `src/rom/rom-download.ts`
- [ ] T095 [US6] Create injection confirmation UI with warnings in `src/components/InjectConfirm.ts`

---

## Phase 9: User Story 7 - Full UI Integration

**Goal**: Complete integrated workflow from ROM load → track select → preview → transpile → preview transpiled → inject → download.

**Independent Test**: Complete end-to-end workflow with real ROM files for all 4 supported games.

- [ ] T096 [US7] Create main app layout with sidebar navigation in `src/components/AppLayout.ts`
- [ ] T097 [US7] Create workflow wizard component (step-by-step guidance) in `src/components/Wizard.ts`
- [ ] T098 [US7] Implement drag-and-drop ROM loading in `src/components/DragDrop.ts`
- [ ] T099 [US7] Create side-by-side comparison view (source vs transpiled) in `src/components/CompareView.ts`
- [ ] T100 [US7] Implement undo/redo for transpilation edits in `src/state/history.ts`
- [ ] T101 [US7] Create export presets (common transpilation configs) in `src/presets/export-presets.ts`
- [ ] T102 [US7] Implement session persistence (save/restore work in progress) in `src/state/persistence.ts`
- [ ] T103 [US7] Create error boundary and user-friendly error messages in `src/components/ErrorBoundary.ts`
- [ ] T104 [US7] Create loading states and progress indicators in `src/components/LoadingState.ts`
- [ ] T105 [US7] Implement keyboard shortcuts for common actions in `src/utils/keyboard-shortcuts.ts`

---

## Phase 10: Polish & Cross-Cutting Concerns

- [ ] T106 Add comprehensive JSDoc documentation to all public APIs
- [ ] T107 Create README.md with usage instructions and screenshots
- [ ] T108 Add license file (MIT recommended for romhacking community)
- [ ] T109 Configure Vite build optimization (code splitting, tree shaking)
- [ ] T110 Add PWA manifest for offline capability in `public/manifest.json`
- [ ] T111 Create sample data fixtures for testing without real ROMs in `src/fixtures/`
- [ ] T112 Add accessibility attributes (ARIA labels, keyboard navigation)
- [ ] T113 Implement dark/light theme toggle in `src/theme/theme.ts`
- [ ] T114 Add analytics hooks for tracking feature usage (privacy-respecting)
- [ ] T115 Final integration testing across all 4 game combinations

---

## Dependencies

```
Phase 1 (Setup) → Phase 2 (Types/Constants)
                     ↓
              ┌──────┴──────┐
              ↓             ↓
         Phase 3        Phase 5 (can start early with types)
         (ROM Load)     (BRR Extraction)
              ↓             ↓
         Phase 4        Phase 6
         (Parsing)      (Playback) ←── depends on BRR decoder
              ↓             ↓
              └──────┬──────┘
                     ↓
              Phase 7 (Transpile) ←── needs AST from parsing
                     ↓
              Phase 8 (Injection) ←── needs transpiled bytecode
                     ↓
              Phase 9 (Integration)
                     ↓
              Phase 10 (Polish)
```

## Parallel Execution Opportunities

**Within Phase 2**: T012-T018 (all game-specific constants) can run in parallel.

**Within Phase 4**: T031-T034 (track index readers) can run in parallel. T039-T045 (decoders) can run in parallel after T007-T011 complete.

**Within Phase 5**: T055-T058 (sample extractors) can run in parallel.

**Phase 3 + Phase 5**: Can execute simultaneously once Phase 2 completes.

**Within Phase 7**: T077-T080 (encoders) can run in parallel.

**Within Phase 8**: T087-T090 (injectors) can run in parallel.

## Implementation Strategy

**MVP Scope (User Story 1-4 + 5)**:
1. ROM loading and game detection
2. Track parsing for FF5 only (most documented)
3. Basic AST representation
4. WebAudio playback preview
5. Transpilation FF5 → FF6 only (validates architecture)

**Incremental Delivery**:
1. MVP with FF5→FF6 path (2-3 days)
2. Add FF4 support (1 day)
3. Add FFMQ support (0.5 day, same as FF5)
4. Add ROM injection (1 day)
5. Polish and UI integration (1-2 days)

## Technical Notes

### Encoding Families (from documentation review)

- **Family A (FF4)**: Notes 00-D1, durations include triplets (1/3, 1/6, 1/12...)
- **Family B (FF5/FFMQ)**: Notes 00-B3, identical encoding per Japanese docs
- **Family C (FF6)**: Notes 00-A7, no triplet durations, commands shifted down

### Key Offset References

**FF4** (with $200 header):
- Instrument index: $2420F-$2490E
- Sequence data: $3790E-$43AB8

**FF5**:
- BGM sequence pointers: $043B97-$043C6E (72 songs × 3 bytes)
- Sample pointers: $043C6F-$043CD7
- BRR samples: $0446AA-$05E5E7

**FF6**:
- Similar structure to FF5, command bytes shifted

**FFMQ** (unheadered):
- SPC pointers: $6BDAE
- BRR pointers: $6BDFF
- Sample indexes: $6BEA1-$6C1E1
- BRR data: $6C201
- Sequence data: $750FD+

### Tick Durations

| Duration | FF4/FF5/FFMQ | FF6   |
|----------|--------------|-------|
| Whole    | $C0 (192)    | $C0   |
| Half     | $60 (96)     | $60   |
| Quarter  | $30 (48)     | $30   |
| Eighth   | $18 (24)     | $18   |
| 16th     | $0C (12)     | $0C   |
| 32nd     | $06 (6)      | $06   |
| 64th     | $03 (3)      | $03   |
| Triplet  | $20 (32)     | N/A   |

---

## Summary

- **Total Tasks**: 115
- **Phase 1 (Setup)**: 6 tasks
- **Phase 2 (Foundation)**: 14 tasks
- **Phase 3 (US1 ROM Load)**: 10 tasks
- **Phase 4 (US2 Parsing)**: 22 tasks
- **Phase 5 (US3 BRR)**: 10 tasks
- **Phase 6 (US4 Playback)**: 11 tasks
- **Phase 7 (US5 Transpile)**: 12 tasks
- **Phase 8 (US6 Injection)**: 10 tasks
- **Phase 9 (US7 Integration)**: 10 tasks
- **Phase 10 (Polish)**: 10 tasks

**Suggested MVP**: Phases 1-4 + partial Phase 6 (basic playback) + partial Phase 7 (FF5→FF6 only) = ~60 tasks
