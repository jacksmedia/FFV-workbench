/**
 * Track-assignment verification CLI
 *
 * Loads a ROM file, runs the real detection + track-index + sequence-parse
 * pipeline, and prints one line per track: index, name, file offset, and
 * header sanity (length, channel count). Use this to verify a ROM (or a
 * community-submitted tracklist) end-to-end without the web UI.
 *
 * Usage: npx tsx scripts/verify-tracks.ts <rom-path> [trackIndex]
 */

import { readFileSync } from 'node:fs';
import { detectGame } from '../src/services/game-detector';
import { readTrackPointers } from '../src/parsers/ff5/track-index';
import { parseSequenceHeader, getActiveChannelCount, FF5_HEADER_SIZE } from '../src/parsers/ff5/header-parser';
import { parseSequence } from '../src/services/parser-service';

const romPath = process.argv[2];
if (!romPath) {
  console.error('Usage: npx tsx scripts/verify-tracks.ts <rom-path> [trackIndex]');
  process.exit(1);
}

const rom = new Uint8Array(readFileSync(romPath));
const gameInfo = detectGame(rom);
if (!gameInfo) {
  console.error('Detection failed: unknown ROM');
  process.exit(1);
}

console.log(`\nDetected: ${gameInfo.name} [${gameInfo.id}/${gameInfo.region}] mapping=${gameInfo.mapping} header=${gameInfo.hasHeader} tracks=${gameInfo.trackCount}\n`);

if (gameInfo.id !== 'ff5' && gameInfo.id !== 'ffmq') {
  console.log('Track table dump currently supports FF5/FFMQ only.');
  process.exit(0);
}

const pointers = readTrackPointers(rom, gameInfo);
let sane = 0;

for (const p of pointers) {
  if (p.offset + FF5_HEADER_SIZE > rom.length) {
    console.log(`  [${p.index.toString(16).padStart(2, '0')}] ${p.name.padEnd(34)} offset=0x${p.offset.toString(16).toUpperCase().padStart(6, '0')}  ** PAST ROM END **`);
    continue;
  }
  const header = parseSequenceHeader(rom, p.offset);
  const channels = getActiveChannelCount(header);
  // Sanity: length must be plausible and the duplicate first entry must
  // equal startAddr (structural invariant of the FF5 song header)
  const dupOk = header.channels[0] === header.startAddr;
  const lenOk = header.length > 0 && header.length < 0x8000;
  const ok = dupOk && lenOk;
  if (ok) sane++;
  console.log(
    `  [${p.index.toString(16).padStart(2, '0')}] ${p.name.padEnd(34)} offset=0x${p.offset.toString(16).toUpperCase().padStart(6, '0')}  len=0x${header.length.toString(16).padStart(4, '0')} ch=${channels}  ${ok ? 'OK' : '** HEADER INVALID **'}`
  );
}

console.log(`\n${sane}/${pointers.length} tracks have structurally valid headers.`);

// Optional deep-parse of one track
const trackArg = process.argv[3];
if (trackArg !== undefined) {
  const idx = parseInt(trackArg, 10);
  const result = parseSequence(rom, gameInfo, idx);
  if (result.success && result.ast) {
    const notes = result.ast.tracks.reduce((n, t) => n + t.nodes.filter(x => x.type === 'note').length, 0);
    console.log(`\nDeep parse of track ${idx} (${result.ast.songName}): ${result.ast.tracks.filter(t => t.nodes.length > 0).length} channels, ${notes} notes, instruments [${result.ast.instrumentSet.join(', ')}]`);
  } else {
    console.log(`\nDeep parse of track ${idx} FAILED: ${result.error}`);
  }
}
