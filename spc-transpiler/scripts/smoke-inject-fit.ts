/**
 * Smoke test for the inject-fit UI data path: transpile one track, measure
 * slot sizes via getSequenceInfo, and report the fit verdict the result
 * cards display.
 * Usage: npx tsx scripts/smoke-inject-fit.ts <rom-path> [trackIndex] [targetGame]
 */

import { readFileSync } from 'node:fs';
import { detectGame } from '../src/services/game-detector';
import { transpileTrack } from '../src/services/transpiler-service';
import { getSequenceInfo } from '../src/services/parser-service';
import { getEncoder } from '../src/transpiler/encoder-factory';
import type { GameId } from '../src/types/ast';

const romPath = process.argv[2];
const trackIndex = parseInt(process.argv[3] ?? '1', 10);
const targetGame = (process.argv[4] ?? 'ff5') as GameId;
if (!romPath) {
  console.error('Usage: npx tsx scripts/smoke-inject-fit.ts <rom-path> [trackIndex] [targetGame]');
  process.exit(1);
}

const rom = new Uint8Array(readFileSync(romPath));
const gameInfo = detectGame(rom);
if (!gameInfo) {
  console.error('Detection failed');
  process.exit(1);
}

const job = await transpileTrack(rom, gameInfo, trackIndex, targetGame);
if (!job.success || !job.result) {
  console.error(`Transpile failed: ${job.error}`);
  process.exit(1);
}
const encoded = job.result.encoded;

console.log('First 5 slot sizes (available space if injecting in-place):');
for (let i = 0; i < Math.min(5, gameInfo.trackCount); i++) {
  const info = await getSequenceInfo(rom, gameInfo, i);
  console.log(`  #${String(i + 1).padStart(2, '0')} ${info?.name} = ${info?.length} bytes`);
}

const slot = await getSequenceInfo(rom, gameInfo, trackIndex);
if (slot) {
  const delta = slot.length - encoded.totalLength;
  console.log(`\nOutput ${encoded.totalLength} bytes vs slot #${String(trackIndex + 1).padStart(2, '0')} space ${slot.length} bytes -> `
    + (delta >= 0 ? `fits, ${delta} spare` : `OVERFLOWS by ${-delta}`));
}

const cap = (await getEncoder(targetGame)).getMaxSequenceSize();
console.log(`Engine cap: ${encoded.totalLength} / ${cap}`);

const chans = encoded.tracks.filter(t => t.length > 0).map(t => `ch${t.channelIndex}: ${t.length}`).join('  ');
console.log(`Breakdown: header ${encoded.header.length}  ${chans}`);

console.log('\nHex dump head (header 0x00-0x15, track data from 0x16):');
for (let off = 0; off < Math.min(48, encoded.fullData.length); off += 16) {
  const slice = encoded.fullData.subarray(off, Math.min(off + 16, encoded.fullData.length));
  console.log(`  ${off.toString(16).toUpperCase().padStart(4, '0')}: `
    + [...slice].map(b => b.toString(16).toUpperCase().padStart(2, '0')).join(' '));
}
