/**
 * FF5 Sequence Parser
 * Full song parser that reads header, parses all 8 channels, and extracts metadata
 */

import type { SequenceAst, TrackAst } from '@/types/ast';
import type { GameInfo } from '@/types/rom';
import { readU8 } from '@/utils/bytes';
import { FF5_SONG_NAMES, FFMQ_SONG_NAMES } from '@/constants/game-signatures';
import {
  parseSequenceHeader,
  spcToRomOffset,
  isChannelActive,
  getChannelEndOffset,
  FF5_HEADER_SIZE,
  FF5_CHANNEL_COUNT,
} from './header-parser';
import { getTrackPointer } from './track-index';
import { parseTrack, getUsedInstruments } from './track-parser';

/**
 * Parse a complete FF5 sequence (song) into an AST.
 *
 * This reads the sequence header, parses all active channels,
 * and extracts the instrument set used.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info with offsets
 * @param songIndex - Song index (0-71)
 * @returns Complete SequenceAst or null if invalid
 */
export function parseSequence(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number
): SequenceAst | null {
  // Get the sequence offset from pointer table
  const trackPointer = getTrackPointer(rom, gameInfo, songIndex);
  if (!trackPointer) {
    return null;
  }

  const headerOffset = trackPointer.offset;

  // Validate we have enough data for the header
  if (headerOffset + FF5_HEADER_SIZE > rom.length) {
    console.warn(`parseSequence: Header at ${headerOffset.toString(16)} extends past ROM end`);
    return null;
  }

  // Parse the sequence header
  const header = parseSequenceHeader(rom, headerOffset);

  // Validate header sanity
  if (header.length === 0 || header.startAddr === 0) {
    // Empty or invalid sequence (some indices are unused)
    return null;
  }

  // Extract original header bytes for reference
  const headerBytes: number[] = [];
  for (let i = 0; i < FF5_HEADER_SIZE; i++) {
    headerBytes.push(readU8(rom, headerOffset + i));
  }

  // Parse each active channel
  const tracks: TrackAst[] = [];
  const allInstruments = new Set<number>();

  for (let ch = 0; ch < FF5_CHANNEL_COUNT; ch++) {
    if (!isChannelActive(header, ch)) {
      // Add empty track to maintain channel indexing
      tracks.push({ channelIndex: ch, nodes: [] });
      continue;
    }

    const channelSpcAddr = header.channels[ch];
    if (channelSpcAddr === undefined) {
      tracks.push({ channelIndex: ch, nodes: [] });
      continue;
    }

    // Convert SPC address to ROM offset
    const channelStartOffset = spcToRomOffset(channelSpcAddr, header, headerOffset);
    const channelEndOffset = getChannelEndOffset(header, ch, headerOffset);

    // Parse the channel
    const track = parseTrack(rom, channelStartOffset, channelEndOffset, ch);
    tracks.push(track);

    // Collect instruments used
    for (const instr of getUsedInstruments(track)) {
      allInstruments.add(instr);
    }
  }

  // Build the sequence AST
  // Use correct song name table based on game
  const songNames = gameInfo.id === 'ffmq' ? FFMQ_SONG_NAMES : FF5_SONG_NAMES;
  const ast: SequenceAst = {
    sourceGame: gameInfo.id === 'ffmq' ? 'ffmq' : 'ff5',
    songIndex,
    songName: songNames[songIndex] ?? `Song ${songIndex.toString(16).toUpperCase().padStart(2, '0')}`,
    tracks,
    headerBytes,
    instrumentSet: Array.from(allInstruments).sort((a, b) => a - b),
  };

  return ast;
}

/**
 * Parse multiple sequences at once.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info
 * @param indices - Array of song indices to parse (default: all 72)
 * @returns Array of parsed sequences (nulls filtered out)
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

/**
 * Get sequence metadata without full parsing.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info
 * @param songIndex - Song index
 * @returns Metadata or null
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
  if (headerOffset + FF5_HEADER_SIZE > rom.length) {
    return null;
  }

  const header = parseSequenceHeader(rom, headerOffset);
  if (header.length === 0) {
    return null;
  }

  // Count active channels
  let activeChannels = 0;
  for (let ch = 0; ch < FF5_CHANNEL_COUNT; ch++) {
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

/** Lightweight sequence metadata */
export interface SequenceInfo {
  /** Song index */
  index: number;
  /** Song name */
  name: string;
  /** ROM file offset */
  romOffset: number;
  /** Total sequence length in bytes */
  length: number;
  /** SPC RAM start address */
  startAddr: number;
  /** SPC RAM end address */
  endAddr: number;
  /** Number of active channels (1-8) */
  activeChannels: number;
}

/**
 * Dump all sequence metadata for debugging.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info
 * @returns Array of all sequence info
 */
export function dumpAllSequenceInfo(
  rom: Uint8Array,
  gameInfo: GameInfo
): SequenceInfo[] {
  const infos: SequenceInfo[] = [];

  for (let i = 0; i < gameInfo.trackCount; i++) {
    const info = getSequenceInfo(rom, gameInfo, i);
    if (info) {
      infos.push(info);
    }
  }

  return infos;
}

/**
 * Validate a sequence can be parsed without errors.
 *
 * @param rom - The ROM data buffer
 * @param gameInfo - Game detection info
 * @param songIndex - Song index
 * @returns Validation result
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

  if (headerOffset + FF5_HEADER_SIZE > rom.length) {
    return { valid: false, errors: ['Header extends past ROM end'], warnings: [] };
  }

  const header = parseSequenceHeader(rom, headerOffset);

  if (header.length === 0) {
    warnings.push('Sequence length is 0 (empty or unused)');
    return { valid: true, errors: [], warnings };
  }

  // Check start address is reasonable
  if (header.startAddr < 0x0200 || header.startAddr > 0xFFFF) {
    warnings.push(`Unusual start address: ${header.startAddr.toString(16)}`);
  }

  // Check channel pointers are within sequence
  for (let ch = 0; ch < FF5_CHANNEL_COUNT; ch++) {
    const ptr = header.channels[ch];
    if (ptr !== undefined && ptr !== 0) {
      if (ptr < header.startAddr || ptr >= header.endAddr) {
        errors.push(`Channel ${ch} pointer ${ptr.toString(16)} outside sequence bounds`);
      }
    }
  }

  // Try to parse and check for issues
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

/** Sequence validation result */
export interface ValidationResult {
  valid: boolean;
  errors: string[];
  warnings: string[];
}
