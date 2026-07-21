/**
 * One-shot smoke test: parse an FF5 track and transpile it to FF6 bytecode.
 * Usage: npx tsx scripts/smoke-transpile.ts <rom-path> [trackIndex]
 */

import { readFileSync } from 'node:fs';
import { detectGame } from '../src/services/game-detector';
import { transpileTracks, formatTranspileResult } from '../src/services/transpiler-service';

const romPath = process.argv[2];
const trackIndex = parseInt(process.argv[3] ?? '0', 10);
if (!romPath) {
  console.error('Usage: npx tsx scripts/smoke-transpile.ts <rom-path> [trackIndex]');
  process.exit(1);
}

const rom = new Uint8Array(readFileSync(romPath));
const gameInfo = detectGame(rom);
if (!gameInfo) {
  console.error('Detection failed');
  process.exit(1);
}

const batch = await transpileTracks(rom, gameInfo, [trackIndex], 'ff6', {}, () => {});
for (const [idx, result] of batch.results) {
  if (result.success && result.result) {
    console.log(formatTranspileResult(result.result));
  } else {
    console.log(`Track ${idx} FAILED: ${result.error}`);
    process.exit(1);
  }
}
