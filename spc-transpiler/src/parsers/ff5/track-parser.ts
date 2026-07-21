/**
 * FF5 Track Parser
 * Parses a single channel's sequence data into an AST
 */

import type { TrackAst, SequenceNode, OctaveNode } from '@/types/ast';
import { readU8 } from '@/utils/bytes';
import { decodeNote, isNoteType } from './note-decoder';
import { decodeCommand, isEndCommand } from './command-decoder';

/** Default octave when none has been set */
const DEFAULT_OCTAVE = 4;

/** Maximum bytes to parse before giving up (safety limit) */
const MAX_TRACK_LENGTH = 0x10000; // 64KB

/**
 * Parse a single FF5 channel track into an AST.
 *
 * The parser walks through bytes, dispatching each to either:
 * - Note decoder (00-D1): notes, ties, rests
 * - Command decoder (D2-FF): volume, pan, vibrato, etc.
 *
 * Parsing stops when an End command (F2 or FC-FF) is encountered,
 * or when endOffset is reached.
 *
 * @param rom - The ROM data buffer
 * @param startOffset - ROM offset where channel data begins
 * @param endOffset - ROM offset where channel data ends (exclusive)
 * @param channelIndex - Channel number (0-7) for the AST
 * @returns Parsed TrackAst with all nodes
 */
export function parseTrack(
  rom: Uint8Array,
  startOffset: number,
  endOffset: number,
  channelIndex: number = 0
): TrackAst {
  const nodes: SequenceNode[] = [];
  let offset = startOffset;
  let currentOctave = DEFAULT_OCTAVE;
  let bytesProcessed = 0;

  while (offset < endOffset && bytesProcessed < MAX_TRACK_LENGTH) {
    const byte = readU8(rom, offset);

    // Try to decode as note/tie/rest (00-D1)
    if (isNoteType(byte)) {
      const noteResult = decodeNote(byte, offset, currentOctave);
      if (noteResult) {
        nodes.push(noteResult);
        offset += 1;
        bytesProcessed += 1;
        continue;
      }
    }

    // Decode as command (D2+)
    const cmdResult = decodeCommand(rom, offset);
    if (cmdResult) {
      nodes.push(cmdResult.node);

      // Track octave changes
      if (cmdResult.node.type === 'octave') {
        currentOctave = (cmdResult.node as OctaveNode).value;
      } else if (cmdResult.node.type === 'octave_relative') {
        currentOctave += cmdResult.node.delta;
        // Clamp to valid range
        if (currentOctave < 0) currentOctave = 0;
        if (currentOctave > 7) currentOctave = 7;
      }

      offset += cmdResult.bytesConsumed;
      bytesProcessed += cmdResult.bytesConsumed;

      // Stop on end command
      if (isEndCommand(byte)) {
        break;
      }

      continue;
    }

    // Should not reach here - unknown byte
    console.warn(`parseTrack: Unknown byte ${byte.toString(16)} at offset ${offset.toString(16)}`);
    offset += 1;
    bytesProcessed += 1;
  }

  return {
    channelIndex,
    nodes,
  };
}

/**
 * Calculate track statistics for debugging/display.
 *
 * @param track - Parsed track AST
 * @returns Statistics object
 */
export function getTrackStats(track: TrackAst): TrackStats {
  let noteCount = 0;
  let restCount = 0;
  let tieCount = 0;
  let commandCount = 0;
  let totalTicks = 0;

  for (const node of track.nodes) {
    switch (node.type) {
      case 'note':
        noteCount++;
        totalTicks += node.duration;
        break;
      case 'rest':
        restCount++;
        totalTicks += node.duration;
        break;
      case 'tie':
        tieCount++;
        totalTicks += node.duration;
        break;
      case 'end':
        // Don't count as command
        break;
      default:
        commandCount++;
        break;
    }
  }

  return {
    noteCount,
    restCount,
    tieCount,
    commandCount,
    totalTicks,
    totalNodes: track.nodes.length,
  };
}

/** Track statistics */
export interface TrackStats {
  noteCount: number;
  restCount: number;
  tieCount: number;
  commandCount: number;
  totalTicks: number;
  totalNodes: number;
}

/**
 * Extract all unique instrument indices used in a track.
 *
 * @param track - Parsed track AST
 * @returns Array of instrument indices (sorted, unique)
 */
export function getUsedInstruments(track: TrackAst): number[] {
  const instruments = new Set<number>();

  for (const node of track.nodes) {
    if (node.type === 'instrument') {
      instruments.add(node.index);
    }
  }

  return Array.from(instruments).sort((a, b) => a - b);
}

/**
 * Check if track has any loop constructs.
 *
 * @param track - Parsed track AST
 * @returns true if track contains loops
 */
export function hasLoops(track: TrackAst): boolean {
  for (const node of track.nodes) {
    if (node.type === 'loop_start' || node.type === 'jump') {
      return true;
    }
  }
  return false;
}

/**
 * Get the first note's pitch info (useful for key detection).
 *
 * @param track - Parsed track AST
 * @returns First note's pitch or null if no notes
 */
export function getFirstNotePitch(track: TrackAst): { semitone: number; octave: number } | null {
  for (const node of track.nodes) {
    if (node.type === 'note') {
      return { semitone: node.pitch.semitone, octave: node.pitch.octave };
    }
  }
  return null;
}
