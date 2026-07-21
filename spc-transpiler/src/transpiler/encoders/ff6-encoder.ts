/**
 * FF6 Sequence Encoder
 *
 * Converts normalized AST to FF6 bytecode format.
 * FF6 encoding: Notes 00-A7 (12 semitones × 14 durations), Tie A8-B5, Rest B6-C3
 * Commands: C4-FF with varying parameter counts
 *
 * KEY DIFFERENCE: FF6 has NO triplet durations (64, 32, 16, 8, 4 ticks unavailable)
 */

import type { GameEncoder, EncodedTrack, EncodedSequence } from '../encoder-factory';
import type {
  SequenceAst,
  TrackAst,
  SequenceNode,
  NoteNode,
  TieNode,
  RestNode,
} from '@/types/ast';
import { FF6_DURATION_INDICES } from '@/constants/ff6-tables';
import { nodeTypeToCategory, getTargetOpcode, adjustPanForGame } from '../command-mapper';
import { quantizeDuration } from '../duration-quantizer';

const HEADER_SIZE = 22;
const MAX_SEQUENCE_SIZE = 0xFFFF;

class FF6Encoder implements GameEncoder {
  private currentOctave = 4;

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
      default:
        return this.encodeCommand(node);
    }
  }

  encodeTrack(track: TrackAst): EncodedTrack {
    this.currentOctave = 4;
    const chunks: Uint8Array[] = [];

    for (const node of track.nodes) {
      const encoded = this.encodeNode(node);
      if (encoded.length > 0) {
        chunks.push(encoded);
      }
    }

    const totalLength = chunks.reduce((sum, c) => sum + c.length, 0);
    const bytecode = new Uint8Array(totalLength);
    let offset = 0;

    for (const chunk of chunks) {
      bytecode.set(chunk, offset);
      offset += chunk.length;
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

    const spcStart = 0x0500;
    let currentSpcAddr = spcStart + HEADER_SIZE;

    // Write header (same format as FF5)
    header[0] = totalLength & 0xFF;
    header[1] = (totalLength >> 8) & 0xFF;
    header[2] = spcStart & 0xFF;
    header[3] = (spcStart >> 8) & 0xFF;

    for (let i = 0; i < 8; i++) {
      const track = tracks[i];
      if (track && track.length > 0) {
        header[4 + i * 2] = currentSpcAddr & 0xFF;
        header[5 + i * 2] = (currentSpcAddr >> 8) & 0xFF;
        currentSpcAddr += track.length;
      } else {
        header[4 + i * 2] = 0x00;
        header[5 + i * 2] = 0x00;
      }
    }

    header[20] = currentSpcAddr & 0xFF;
    header[21] = (currentSpcAddr >> 8) & 0xFF;

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
    const { durationIndex } = this.getDurationIndex(node.duration);
    const { semitone, octave } = node.pitch;

    const result: number[] = [];

    if (octave !== this.currentOctave) {
      const octaveDiff = octave - this.currentOctave;
      if (octaveDiff === 1) {
        result.push(0xD7); // Octave up
      } else if (octaveDiff === -1) {
        result.push(0xD8); // Octave down
      } else {
        result.push(0xD6, octave); // Set octave
      }
      this.currentOctave = octave;
    }

    // FF6 Note byte = (semitone × 14) + durationIndex
    // Range: 00-A7 (0-167)
    const noteByte = semitone * 14 + durationIndex;
    result.push(noteByte);

    return new Uint8Array(result);
  }

  private encodeTie(node: TieNode): Uint8Array {
    const { durationIndex } = this.getDurationIndex(node.duration);
    // FF6 Tie bytes: A8-B5 (168-181)
    const tieByte = 0xA8 + durationIndex;
    return new Uint8Array([tieByte]);
  }

  private encodeRest(node: RestNode): Uint8Array {
    const { durationIndex } = this.getDurationIndex(node.duration);
    // FF6 Rest bytes: B6-C3 (182-195)
    const restByte = 0xB6 + durationIndex;
    return new Uint8Array([restByte]);
  }

  private encodeOctave(node: { type: 'octave'; value: number }): Uint8Array {
    this.currentOctave = node.value;
    return new Uint8Array([0xD6, node.value]);
  }

  private encodeOctaveRelative(node: { type: 'octave_relative'; delta: number }): Uint8Array {
    if (node.delta === 1) {
      this.currentOctave = Math.min(7, this.currentOctave + 1);
      return new Uint8Array([0xD7]);
    } else if (node.delta === -1) {
      this.currentOctave = Math.max(0, this.currentOctave - 1);
      return new Uint8Array([0xD8]);
    }
    const newOctave = Math.max(0, Math.min(7, this.currentOctave + node.delta));
    this.currentOctave = newOctave;
    return new Uint8Array([0xD6, newOctave]);
  }

  private encodeCommand(node: SequenceNode): Uint8Array {
    const category = nodeTypeToCategory(node.type);
    if (!category) {
      console.warn(`Unknown node type: ${node.type}`);
      return new Uint8Array(0);
    }

    const opcode = getTargetOpcode(category, 'ff6');
    if (opcode === null) {
      console.warn(`No FF6 opcode for category: ${category}`);
      return new Uint8Array(0);
    }

    const result = [opcode];

    switch (node.type) {
      case 'volume':
        result.push((node as any).value);
        break;
      case 'volume_fade':
        result.push((node as any).duration, (node as any).targetValue);
        break;
      case 'pan':
        // FF6 pan needs adjustment (value / 2)
        const adjustedPan = adjustPanForGame((node as any).value, 'ff6');
        result.push(adjustedPan);
        break;
      case 'pan_fade':
        const adjustedTarget = adjustPanForGame((node as any).targetValue, 'ff6');
        result.push((node as any).duration, adjustedTarget);
        break;
      case 'pitch_slide':
        result.push((node as any).delay, (node as any).duration, (node as any).targetPitch);
        break;
      case 'vibrato':
        result.push((node as any).delay, (node as any).rate, (node as any).depth);
        break;
      case 'tremolo':
        result.push((node as any).delay, (node as any).rate, (node as any).depth);
        break;
      case 'auto_pan':
        result.push((node as any).delay, (node as any).rate, (node as any).depth);
        break;
      case 'noise_clock':
        result.push((node as any).clock);
        break;
      case 'transpose':
        result.push((node as any).semitones);
        break;
      case 'transpose_rel':
        result.push((node as any).delta);
        break;
      case 'detune':
        result.push((node as any).cents);
        break;
      case 'instrument':
        result.push((node as any).instrumentIndex);
        break;
      case 'attack':
        result.push((node as any).value);
        break;
      case 'decay':
        result.push((node as any).value);
        break;
      case 'sustain_level':
        result.push((node as any).value);
        break;
      case 'sustain_rate':
        result.push((node as any).value);
        break;
      case 'loop_start':
        result.push((node as any).count);
        break;
      case 'slur_start':
      case 'slur_end':
      case 'legato_start':
      case 'legato_end':
        // FF6-specific articulation - no params
        break;
      case 'duration_override':
        // FF6-specific duration override
        result.push((node as any).duration);
        break;
      case 'tempo':
        result.push((node as any).bpm);
        break;
      case 'tempo_fade':
        result.push((node as any).duration, (node as any).targetBpm);
        break;
      case 'echo_volume':
        result.push((node as any).left, (node as any).right);
        break;
      case 'echo_volume_fade':
        result.push((node as any).duration, (node as any).leftTarget, (node as any).rightTarget);
        break;
      case 'echo_feedback':
        result.push((node as any).value);
        break;
      case 'echo_filter':
        // FF6's F8 selects a filter preset by index (no raw coefficients)
        result.push((node as any).index);
        break;
      case 'music_volume':
        result.push((node as any).value);
        break;
      case 'conditional_jump':
        result.push(
          (node as any).targetAddress & 0xFF,
          ((node as any).targetAddress >> 8) & 0xFF
        );
        break;
      case 'jump':
        result.push(
          (node as any).targetAddress & 0xFF,
          ((node as any).targetAddress >> 8) & 0xFF
        );
        break;
      case 'vibrato_off':
      case 'tremolo_off':
      case 'auto_pan_off':
      case 'noise_on':
      case 'noise_off':
      case 'pitch_mod_on':
      case 'pitch_mod_off':
      case 'echo_on':
      case 'echo_off':
      case 'adsr_reset':
      case 'loop_end':
      case 'end':
      case 'music_volume_reset':
        break;
      default:
        break;
    }

    return new Uint8Array(result);
  }

  private getDurationIndex(ticks: number): { durationIndex: number; exact: boolean } {
    const index = FF6_DURATION_INDICES[ticks];
    if (index !== undefined) {
      return { durationIndex: index, exact: true };
    }

    // FF6 lacks triplets - must quantize
    const quantized = quantizeDuration(ticks, 'ff6');
    const quantizedIndex = FF6_DURATION_INDICES[quantized.ticks];
    return {
      durationIndex: quantizedIndex ?? 0,
      exact: false,
    };
  }
}

export function createFF6Encoder(): GameEncoder {
  return new FF6Encoder();
}
