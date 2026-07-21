/**
 * FF6 Sequence Parser
 *
 * Full song parser for FF6 format.
 * FF6 uses similar header structure to FF5 but with different pointer offsets.
 */

import type { SequenceAst, TrackAst } from '@/types/ast';
import type { GameInfo } from '@/types/rom';
import { readU8, readU16LE, readU24LE, snesToRomOffset } from '@/utils/bytes';
import { FF6_SONG_NAMES } from '@/constants/game-signatures';
import { parseTrack, getUsedInstruments } from './track-parser';

const FF6_HEADER_SIZE = 22;
const FF6_CHANNEL_COUNT = 8;

interface SequenceHeader {
  length: number;
  startAddr: number;
  channels: number[];
  endAddr: number;
}

/**
 * Read 3-byte pointer from ROM and convert to file offset
 */
function readPointer(rom: Uint8Array, offset: number): number {
  return readU24LE(rom, offset);
}

/**
 * Convert SNES address to ROM file offset.
 * FF6 is a HiROM game: banks $C0-$FF map the full 64KB each, so the
 * file offset is the address masked to 22 bits (no $8000 adjustment —
 * the previous LoROM-style subtraction shifted every pointer by 32KB).
 */
function snesAddrToRomOffset(snesAddr: number, headerOffset: number): number {
  return snesToRomOffset(snesAddr, 'hirom') + headerOffset;
}

/**
 * Parse sequence header (22 bytes)
 */
function parseSequenceHeader(rom: Uint8Array, offset: number): SequenceHeader {
  const length = readU16LE(rom, offset);
  const startAddr = readU16LE(rom, offset + 2);

  const channels: number[] = [];
  for (let i = 0; i < FF6_CHANNEL_COUNT; i++) {
    channels.push(readU16LE(rom, offset + 4 + i * 2));
  }

  const endAddr = readU16LE(rom, offset + 20);

  return { length, startAddr, channels, endAddr };
}

/**
 * Check if channel is active (has valid pointer)
 */
function isChannelActive(header: SequenceHeader, channelIndex: number): boolean {
  const ptr = header.channels[channelIndex];
  return ptr !== undefined && ptr !== 0 && ptr >= header.startAddr && ptr < header.endAddr;
}

/**
 * Convert SPC address to ROM offset within sequence
 */
function spcToRomOffset(spcAddr: number, header: SequenceHeader, headerOffset: number): number {
  const relativeOffset = spcAddr - header.startAddr;
  return headerOffset + FF6_HEADER_SIZE + relativeOffset;
}

/**
 * Get channel end offset
 */
function getChannelEndOffset(header: SequenceHeader, channelIndex: number, headerOffset: number): number {
  // Find next channel's start or sequence end
  let nextAddr = header.endAddr;

  for (let i = channelIndex + 1; i < FF6_CHANNEL_COUNT; i++) {
    const ptr = header.channels[i];
    if (ptr && ptr > (header.channels[channelIndex] ?? 0) && ptr < nextAddr) {
      nextAddr = ptr;
      break;
    }
  }

  return spcToRomOffset(nextAddr, header, headerOffset);
}

/**
 * Get track pointer from pointer table
 */
function getTrackPointer(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): { offset: number; name: string } | null {
  const pointerTableOffset = gameInfo.sequencePointerBase;
  const pointerOffset = pointerTableOffset + songIndex * 3;

  if (pointerOffset + 3 > rom.length) {
    return null;
  }

  const snesAddr = readPointer(rom, pointerOffset);
  if (snesAddr === 0 || snesAddr === 0xFFFFFF) {
    return null;
  }

  const romOffset = snesAddrToRomOffset(snesAddr, gameInfo.headerOffset);
  const name = FF6_SONG_NAMES[songIndex] ?? `Song ${songIndex.toString(16).toUpperCase().padStart(2, '0')}`;

  return { offset: romOffset, name };
}

/**
 * Parse a complete FF6 sequence into AST
 */
export function parseSequence(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): SequenceAst | null {
  const trackPointer = getTrackPointer(rom, gameInfo, songIndex);
  if (!trackPointer) {
    return null;
  }

  const headerOffset = trackPointer.offset;

  if (headerOffset + FF6_HEADER_SIZE > rom.length) {
    console.warn(`parseSequence: Header at ${headerOffset.toString(16)} extends past ROM end`);
    return null;
  }

  const header = parseSequenceHeader(rom, headerOffset);

  if (header.length === 0 || header.startAddr === 0) {
    return null;
  }

  // Extract header bytes
  const headerBytes: number[] = [];
  for (let i = 0; i < FF6_HEADER_SIZE; i++) {
    headerBytes.push(readU8(rom, headerOffset + i));
  }

  // Parse each channel
  const tracks: TrackAst[] = [];
  const allInstruments = new Set<number>();

  for (let ch = 0; ch < FF6_CHANNEL_COUNT; ch++) {
    if (!isChannelActive(header, ch)) {
      tracks.push({ channelIndex: ch, nodes: [] });
      continue;
    }

    const channelSpcAddr = header.channels[ch];
    if (channelSpcAddr === undefined) {
      tracks.push({ channelIndex: ch, nodes: [] });
      continue;
    }

    const channelStartOffset = spcToRomOffset(channelSpcAddr, header, headerOffset);
    const channelEndOffset = getChannelEndOffset(header, ch, headerOffset);

    const track = parseTrack(rom, channelStartOffset, channelEndOffset, ch);
    tracks.push(track);

    for (const instr of getUsedInstruments(track)) {
      allInstruments.add(instr);
    }
  }

  return {
    sourceGame: 'ff6',
    songIndex,
    songName: trackPointer.name,
    tracks,
    headerBytes,
    instrumentSet: Array.from(allInstruments).sort((a, b) => a - b),
  };
}

/**
 * Parse multiple sequences
 */
export function parseSequences(
  rom: Uint8Array,
  gameInfo: GameInfo,
  indices?: number[]
): SequenceAst[] {
  const trackCount = gameInfo.trackCount;
  const toProcess = indices ?? Array.from({ length: trackCount }, (_, i) => i);
  const sequences: SequenceAst[] = [];

  for (const index of toProcess) {
    const seq = parseSequence(rom, gameInfo, index);
    if (seq) {
      sequences.push(seq);
    }
  }

  return sequences;
}

/** Sequence metadata */
export interface SequenceInfo {
  index: number;
  name: string;
  romOffset: number;
  length: number;
  startAddr: number;
  endAddr: number;
  activeChannels: number;
}

/**
 * Get sequence info without full parsing
 */
export function getSequenceInfo(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): SequenceInfo | null {
  const trackPointer = getTrackPointer(rom, gameInfo, songIndex);
  if (!trackPointer) {
    return null;
  }

  const headerOffset = trackPointer.offset;
  if (headerOffset + FF6_HEADER_SIZE > rom.length) {
    return null;
  }

  const header = parseSequenceHeader(rom, headerOffset);
  if (header.length === 0) {
    return null;
  }

  let activeChannels = 0;
  for (let ch = 0; ch < FF6_CHANNEL_COUNT; ch++) {
    if (isChannelActive(header, ch)) {
      activeChannels++;
    }
  }

  return {
    index: songIndex,
    name: trackPointer.name,
    romOffset: headerOffset,
    length: header.length,
    startAddr: header.startAddr,
    endAddr: header.endAddr,
    activeChannels,
  };
}

/** Validation result */
export interface ValidationResult {
  valid: boolean;
  errors: string[];
  warnings: string[];
}

/**
 * Validate sequence
 */
export function validateSequence(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): ValidationResult {
  const errors: string[] = [];
  const warnings: string[] = [];

  const trackPointer = getTrackPointer(rom, gameInfo, songIndex);
  if (!trackPointer) {
    return { valid: false, errors: ['Song index out of range'], warnings: [] };
  }

  const headerOffset = trackPointer.offset;
  if (headerOffset + FF6_HEADER_SIZE > rom.length) {
    return { valid: false, errors: ['Header extends past ROM end'], warnings: [] };
  }

  const header = parseSequenceHeader(rom, headerOffset);
  if (header.length === 0) {
    warnings.push('Sequence length is 0 (empty or unused)');
    return { valid: true, errors: [], warnings };
  }

  try {
    const seq = parseSequence(rom, gameInfo, songIndex);
    if (!seq) {
      errors.push('Failed to parse sequence');
    }
  } catch (e) {
    errors.push(`Parse error: ${e instanceof Error ? e.message : String(e)}`);
  }

  return {
    valid: errors.length === 0,
    errors,
    warnings,
  };
}
