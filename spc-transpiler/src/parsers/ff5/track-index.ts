/**
 * FF5 Track Index Parser
 * Reads all BGM pointers from the sequence pointer table
 */

import type { GameInfo } from '@/types/rom';
import { readU24LE, snesToRomOffset } from '@/utils/bytes';

/** Track pointer entry with metadata */
export interface TrackPointer {
  /** Song index (0-71) */
  index: number;
  /** ROM file offset to sequence data */
  offset: number;
  /** Song name from the game's track name table */
  name: string;
}

/** Number of BGM tracks in FF5 */
export const FF5_TRACK_COUNT = 72;

/** Size of each pointer entry in bytes (24-bit LE) */
export const POINTER_SIZE = 3;

/**
 * Read all BGM track pointers from the ROM.
 *
 * The pointer table (FF5: $043B97) contains one 3-byte little-endian
 * SNES address per song, pointing at that song's sequence data.
 *
 * FF5 is a HiROM game: the stored addresses use banks $C5-$C6 (plus
 * $D0 for one late-added song), and the file offset is simply the
 * address masked to 22 bits. The gameInfo.mapping field selects the
 * correct conversion so FFMQ (LoROM, same engine) also decodes here.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info with header offset and mapping
 * @returns Array of track pointers with index, offset, and name
 */
export function readTrackPointers(rom: Uint8Array, gameInfo: GameInfo): TrackPointer[] {
  const pointers: TrackPointer[] = [];

  for (let i = 0; i < gameInfo.trackCount; i++) {
    const pointer = getTrackPointer(rom, gameInfo, i);
    if (pointer) {
      pointers.push(pointer);
    }
  }

  return pointers;
}

/**
 * Get a single track pointer by index.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info
 * @param index - Song index (0 to trackCount-1)
 * @returns Track pointer or null if out of range
 */
export function getTrackPointer(
  rom: Uint8Array,
  gameInfo: GameInfo,
  index: number
): TrackPointer | null {
  if (index < 0 || index >= gameInfo.trackCount) {
    return null;
  }

  // gameInfo.sequencePointerBase already includes the header offset
  const pointerOffset = gameInfo.sequencePointerBase + (index * POINTER_SIZE);

  const snesAddr = readU24LE(rom, pointerOffset);
  const romOffset = snesToRomOffset(snesAddr, gameInfo.mapping);
  const finalOffset = romOffset + gameInfo.headerOffset;

  return {
    index,
    offset: finalOffset,
    name: gameInfo.trackNames[index] ?? `Song ${index.toString(16).toUpperCase().padStart(2, '0')}`,
  };
}
