/**
 * FF4 Sequence Encoder
 *
 * FF4 note encoding is similar to FF5:
 * - Notes: 00-B3 (12 semitones × 15 durations)
 * - Rests: B4-C2 (15 durations)
 * - Ties: C3-D1 (15 durations)
 * - Commands: D2-FF (simpler set than FF5)
 *
 * Key difference: FF4 has fewer commands, so many will be skipped.
 */

import type { GameEncoder, EncodedTrack, EncodedSequence } from '../encoder-factory';
import type { SequenceAst, TrackAst, SequenceNode, NoteNode, TieNode, RestNode } from '@/types/ast';
import { FF4_DURATION_TICKS, findClosestFF4Duration } from '@/constants/ff4-tables';
import { nodeTypeToCategory, getTargetOpcode } from '../command-mapper';

const HEADER_SIZE = 18; // FF4 header is smaller
const MAX_SEQUENCE_SIZE = 0xFFFF;

// Build duration index lookup
const FF4_DURATION_INDICES: Record<number, number> = {};
FF4_DURATION_TICKS.forEach((ticks, index) => {
  FF4_DURATION_INDICES[ticks] = index;
});

class FF4Encoder implements GameEncoder {
  private currentOctave = 4;
  private skippedCommands = 0;

  encodeNode(node: SequenceNode): Uint8Array {
    switch (node.type) {
      case 'note':
        return this.encodeNote(node);
      case 'tie':
        return this.encodeTie(node);
      case 'rest':
        return this.encodeRest(node);
      case 'octave':
        return this.encodeOctave(node);
      case 'octave_relative':
        return this.encodeOctaveRelative(node);
      case 'end':
        return new Uint8Array([0xF1]); // FF4 end command
      default:
        return this.encodeCommand(node);
    }
  }

  encodeTrack(track: TrackAst): EncodedTrack {
    this.currentOctave = 4;
    this.skippedCommands = 0;
    const chunks: Uint8Array[] = [];

    for (const node of track.nodes) {
      const encoded = this.encodeNode(node);
      if (encoded.length > 0) {
        chunks.push(encoded);
      }
    }

    // Add end marker if not already present
    const lastNode = track.nodes[track.nodes.length - 1];
    if (!lastNode || lastNode.type !== 'end') {
      chunks.push(new Uint8Array([0xF1]));
    }

    const totalLength = chunks.reduce((sum, c) => sum + c.length, 0);
    const bytecode = new Uint8Array(totalLength);
    let offset = 0;

    for (const chunk of chunks) {
      bytecode.set(chunk, offset);
      offset += chunk.length;
    }

    if (this.skippedCommands > 0) {
      console.log(`[FF4 Encoder] Channel ${track.channelIndex}: skipped ${this.skippedCommands} unsupported commands`);
    }

    return {
      channelIndex: track.channelIndex,
      bytecode,
      length: totalLength,
    };
  }

  encodeSequence(ast: SequenceAst): EncodedSequence {
    const tracks = ast.tracks.map(t => this.encodeTrack(t));
    const trackDataLength = tracks.reduce((sum, t) => sum + t.length, 0);
    const totalLength = HEADER_SIZE + trackDataLength;

    const fullData = new Uint8Array(totalLength);
    const header = new Uint8Array(HEADER_SIZE);

    // FF4 header format (simpler than FF5):
    // 00-01: Total length (16-bit LE)
    // 02-17: 8 channel pointers (2 bytes each)
    let currentOffset = HEADER_SIZE;

    header[0] = totalLength & 0xFF;
    header[1] = (totalLength >> 8) & 0xFF;

    for (let i = 0; i < 8; i++) {
      const track = tracks[i];
      if (track && track.length > 0) {
        header[2 + i * 2] = currentOffset & 0xFF;
        header[3 + i * 2] = (currentOffset >> 8) & 0xFF;
        currentOffset += track.length;
      } else {
        header[2 + i * 2] = 0x00;
        header[3 + i * 2] = 0x00;
      }
    }

    fullData.set(header, 0);
    let dataOffset = HEADER_SIZE;

    for (const track of tracks) {
      if (track.length > 0) {
        fullData.set(track.bytecode, dataOffset);
        dataOffset += track.length;
      }
    }

    return {
      header,
      tracks,
      fullData,
      totalLength,
    };
  }

  getHeaderSize(): number {
    return HEADER_SIZE;
  }

  getMaxSequenceSize(): number {
    return MAX_SEQUENCE_SIZE;
  }

  private encodeNote(node: NoteNode): Uint8Array {
    const durationIndex = this.getDurationIndex(node.duration);
    const { semitone, octave } = node.pitch;

    const result: number[] = [];

    // Handle octave changes
    if (octave !== this.currentOctave) {
      const octaveDiff = octave - this.currentOctave;
      if (octaveDiff === 1) {
        result.push(0xE1); // FF4 octave up
      } else if (octaveDiff === -1) {
        result.push(0xE2); // FF4 octave down
      } else {
        result.push(0xDA, octave); // FF4 set octave
      }
      this.currentOctave = octave;
    }

    // Note byte = (semitone × 15) + durationIndex (same as FF5)
    const noteByte = semitone * 15 + durationIndex;
    result.push(noteByte);

    return new Uint8Array(result);
  }

  private encodeTie(node: TieNode): Uint8Array {
    const durationIndex = this.getDurationIndex(node.duration);
    // FF4 Tie bytes: C3-D1
    const tieByte = 0xC3 + durationIndex;
    return new Uint8Array([tieByte]);
  }

  private encodeRest(node: RestNode): Uint8Array {
    const durationIndex = this.getDurationIndex(node.duration);
    // FF4 Rest bytes: B4-C2
    const restByte = 0xB4 + durationIndex;
    return new Uint8Array([restByte]);
  }

  private encodeOctave(node: { type: 'octave'; value: number }): Uint8Array {
    this.currentOctave = node.value;
    return new Uint8Array([0xDA, node.value]);
  }

  private encodeOctaveRelative(node: { type: 'octave_relative'; delta: number }): Uint8Array {
    if (node.delta === 1) {
      this.currentOctave = Math.min(7, this.currentOctave + 1);
      return new Uint8Array([0xE1]);
    } else if (node.delta === -1) {
      this.currentOctave = Math.max(0, this.currentOctave - 1);
      return new Uint8Array([0xE2]);
    }
    const newOctave = Math.max(0, Math.min(7, this.currentOctave + node.delta));
    this.currentOctave = newOctave;
    return new Uint8Array([0xDA, newOctave]);
  }

  private encodeCommand(node: SequenceNode): Uint8Array {
    const category = nodeTypeToCategory(node.type);
    if (!category) {
      this.skippedCommands++;
      return new Uint8Array(0);
    }

    const opcode = getTargetOpcode(category, 'ff4');
    if (opcode === null) {
      this.skippedCommands++;
      return new Uint8Array(0);
    }

    const result = [opcode];

    // FF4 command parameters (limited set)
    switch (node.type) {
      case 'volume':
        result.push((node as any).value);
        break;
      case 'instrument':
        result.push((node as any).index ?? (node as any).instrumentIndex);
        break;
      case 'tempo':
        result.push((node as any).value ?? (node as any).bpm);
        break;
      case 'loop_start':
        result.push((node as any).count);
        break;
      case 'loop_end':
      case 'end':
        // No params
        break;
      case 'jump':
        result.push(
          (node as any).targetOffset & 0xFF,
          ((node as any).targetOffset >> 8) & 0xFF
        );
        break;
      default:
        // Unknown command - skip it
        this.skippedCommands++;
        return new Uint8Array(0);
    }

    return new Uint8Array(result);
  }

  private getDurationIndex(ticks: number): number {
    const index = FF4_DURATION_INDICES[ticks];
    if (index !== undefined) {
      return index;
    }
    // Quantize to nearest
    return findClosestFF4Duration(ticks);
  }
}

export function createFF4Encoder(): GameEncoder {
  return new FF4Encoder();
}
