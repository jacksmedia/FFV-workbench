/**
 * FF6 Track Parser
 *
 * Parses a single channel from sequence data into AST nodes.
 */

import type { TrackAst, SequenceNode } from '@/types/ast';
import { readU8 } from '@/utils/bytes';
import { isNoteType, decodeNote } from './note-decoder';
import { decodeCommand, isEndCommand } from './command-decoder';

export interface TrackStats {
  noteCount: number;
  restCount: number;
  tieCount: number;
  commandCount: number;
  totalBytes: number;
}

/**
 * Parse a single track from ROM data
 */
export function parseTrack(
  rom: Uint8Array,
  startOffset: number,
  endOffset: number,
  channelIndex: number
): TrackAst {
  const nodes: SequenceNode[] = [];
  let offset = startOffset;
  let currentOctave = 4;

  while (offset < endOffset && offset < rom.length) {
    const byte = readU8(rom, offset);

    // Check for end commands
    if (isEndCommand(byte)) {
      const result = decodeCommand(rom, offset, currentOctave);
      if (result) {
        nodes.push(result.node);
      }
      break;
    }

    // Try note/tie/rest first (00-C3)
    if (isNoteType(byte)) {
      const result = decodeNote(byte, currentOctave, offset);
      if (result) {
        nodes.push(result.node);
        offset += result.bytesConsumed;
        continue;
      }
    }

    // Must be a command (C4+)
    const cmdResult = decodeCommand(rom, offset, currentOctave);
    if (cmdResult) {
      nodes.push(cmdResult.node);
      offset += cmdResult.bytesConsumed;

      // Track octave changes
      if (cmdResult.node.type === 'octave') {
        currentOctave = (cmdResult.node as any).value;
      } else if (cmdResult.node.type === 'octave_relative') {
        const delta = (cmdResult.node as any).delta;
        currentOctave = Math.max(0, Math.min(7, currentOctave + delta));
      }
      continue;
    }

    // Unknown byte - skip
    console.warn(`[FF6 Track ${channelIndex}] Unknown byte ${byte.toString(16)} at ${offset.toString(16)}`);
    offset++;
  }

  return {
    channelIndex,
    nodes,
  };
}

/**
 * Get statistics about a parsed track
 */
export function getTrackStats(track: TrackAst): TrackStats {
  let noteCount = 0;
  let restCount = 0;
  let tieCount = 0;
  let commandCount = 0;

  for (const node of track.nodes) {
    switch (node.type) {
      case 'note':
        noteCount++;
        break;
      case 'rest':
        restCount++;
        break;
      case 'tie':
        tieCount++;
        break;
      default:
        commandCount++;
    }
  }

  return {
    noteCount,
    restCount,
    tieCount,
    commandCount,
    totalBytes: 0, // Would need to track during parsing
  };
}

/**
 * Get list of instruments used in track
 */
export function getUsedInstruments(track: TrackAst): number[] {
  const instruments = new Set<number>();

  for (const node of track.nodes) {
    if (node.type === 'instrument') {
      instruments.add((node as any).index);
    }
  }

  return Array.from(instruments).sort((a, b) => a - b);
}
