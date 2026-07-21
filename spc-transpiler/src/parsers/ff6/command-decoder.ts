/**
 * FF6 Command Decoder
 *
 * FF6 commands start at C4 (vs FF5's D2).
 * FF6 has additional commands like slur, legato, duration override.
 */

import type { SequenceNode } from '@/types/ast';
import { FF6_COMMAND_PARAMS } from '@/constants/ff6-commands';
import { readU8 } from '@/utils/bytes';

export interface CommandDecodeResult {
  node: SequenceNode;
  bytesConsumed: number;
}

/**
 * Check if command is an end marker
 */
export function isEndCommand(byte: number): boolean {
  return byte === 0xEB || byte >= 0xFD;
}

/**
 * Decode a command byte into AST node
 */
export function decodeCommand(
  rom: Uint8Array,
  offset: number,
  _currentOctave: number
): CommandDecodeResult | null {
  const opcode = readU8(rom, offset);
  const paramCount = FF6_COMMAND_PARAMS[opcode] ?? 0;

  // Make sure we have enough bytes
  if (offset + 1 + paramCount > rom.length) {
    return null;
  }

  // Read parameters
  const params: number[] = [];
  for (let i = 0; i < paramCount; i++) {
    params.push(readU8(rom, offset + 1 + i));
  }

  const baseNode = {
    sourceOffset: offset,
    sourceByte: opcode,
  };

  let node: SequenceNode;

  switch (opcode) {
    case 0xC4: // Volume
      node = { type: 'volume', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xC5: // Volume fade
      node = {
        type: 'volume_fade',
        duration: params[0] ?? 0,
        targetValue: params[1] ?? 0,
        ...baseNode,
      };
      break;

    case 0xC6: // Pan (value needs ×2 for normalized)
      node = { type: 'pan', value: (params[0] ?? 0) * 2, ...baseNode };
      break;

    case 0xC7: // Pan fade
      node = {
        type: 'pan_fade',
        duration: params[0] ?? 0,
        targetValue: (params[1] ?? 0) * 2,
        ...baseNode,
      };
      break;

    case 0xC8: // Pitch slide
      node = {
        type: 'pitch_slide',
        duration: params[0] ?? 0,
        semitones: params[1] ?? 0,
        ...baseNode,
      };
      break;

    case 0xC9: // Vibrato
      node = {
        type: 'vibrato',
        delay: params[0] ?? 0,
        period: params[1] ?? 0,
        depth: params[2] ?? 0,
        waveform: 0,
        ...baseNode,
      };
      break;

    case 0xCA: // Vibrato off
      node = { type: 'vibrato_off', ...baseNode };
      break;

    case 0xCB: // Tremolo
      node = {
        type: 'tremolo',
        delay: params[0] ?? 0,
        period: params[1] ?? 0,
        depth: params[2] ?? 0,
        waveform: 0,
        ...baseNode,
      };
      break;

    case 0xCC: // Tremolo off
      node = { type: 'tremolo_off', ...baseNode };
      break;

    case 0xCD: // Auto-pan
      node = {
        type: 'auto_pan',
        period: params[0] ?? 0,
        depth: params[1] ?? 0,
        direction: 'left_first',
        ...baseNode,
      };
      break;

    case 0xCE: // Auto-pan off
      node = { type: 'auto_pan_off', ...baseNode };
      break;

    case 0xCF: // Noise clock
      node = { type: 'noise_clock', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xD0: // Noise on
      node = { type: 'noise_on', ...baseNode };
      break;

    case 0xD1: // Noise off
      node = { type: 'noise_off', ...baseNode };
      break;

    case 0xD2: // Pitch mod on
      node = { type: 'pitch_mod_on', ...baseNode };
      break;

    case 0xD3: // Pitch mod off
      node = { type: 'pitch_mod_off', ...baseNode };
      break;

    case 0xD4: // Echo on
      node = { type: 'echo_on', ...baseNode };
      break;

    case 0xD5: // Echo off
      node = { type: 'echo_off', ...baseNode };
      break;

    case 0xD6: // Octave set
      node = { type: 'octave', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xD7: // Octave up
      node = { type: 'octave_relative', delta: 1, ...baseNode };
      break;

    case 0xD8: // Octave down
      node = { type: 'octave_relative', delta: -1, ...baseNode };
      break;

    case 0xD9: // Transpose
      node = { type: 'transpose', semitones: params[0] ?? 0, ...baseNode };
      break;

    case 0xDA: // Transpose relative
      node = { type: 'transpose_rel', delta: params[0] ?? 0, ...baseNode };
      break;

    case 0xDB: // Detune
      node = { type: 'detune', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xDC: // Instrument
      node = { type: 'instrument', index: params[0] ?? 0, ...baseNode };
      break;

    case 0xDD: // Attack
      node = { type: 'attack', rate: params[0] ?? 0, ...baseNode };
      break;

    case 0xDE: // Decay
      node = { type: 'decay', rate: params[0] ?? 0, ...baseNode };
      break;

    case 0xDF: // Sustain level
      node = { type: 'sustain_level', level: params[0] ?? 0, ...baseNode };
      break;

    case 0xE0: // Sustain rate
      node = { type: 'sustain_rate', rate: params[0] ?? 0, ...baseNode };
      break;

    case 0xE1: // ADSR reset
      node = { type: 'adsr_reset', ...baseNode };
      break;

    case 0xE2: // Loop start
      node = { type: 'loop_start', count: params[0] ?? 0, ...baseNode };
      break;

    case 0xE3: // Loop end
      node = { type: 'loop_end', ...baseNode };
      break;

    case 0xE4: // Slur start (FF6 specific)
      node = { type: 'slur_start', ...baseNode };
      break;

    case 0xE5: // Slur end
      node = { type: 'slur_end', ...baseNode };
      break;

    case 0xE6: // Legato start (FF6 specific)
      node = { type: 'legato_start', ...baseNode };
      break;

    case 0xE7: // Legato end
      node = { type: 'legato_end', ...baseNode };
      break;

    case 0xE8: // Duration override (FF6 specific)
      node = { type: 'duration_override', ticks: params[0] ?? 0, ...baseNode };
      break;

    case 0xEB: // End
      node = { type: 'end', ...baseNode };
      break;

    case 0xF0: // Tempo
      node = { type: 'tempo', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xF1: // Tempo fade
      node = {
        type: 'tempo_fade',
        duration: params[0] ?? 0,
        targetValue: params[1] ?? 0,
        ...baseNode,
      };
      break;

    case 0xF2: // Echo volume
      node = {
        type: 'echo_volume',
        left: params[0] ?? 0,
        right: params[1] ?? 0,
        ...baseNode,
      };
      break;

    case 0xF3: // Echo volume fade
      node = {
        type: 'echo_volume_fade',
        duration: params[0] ?? 0,
        leftTarget: params[1] ?? 0,
        rightTarget: params[2] ?? 0,
        ...baseNode,
      };
      break;

    case 0xF4: // Music volume
      node = { type: 'music_volume', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xF5: // Conditional jump
      node = {
        type: 'conditional_jump',
        iteration: params[0] ?? 0,
        targetOffset: (params[1] ?? 0) | ((params[2] ?? 0) << 8),
        ...baseNode,
      };
      break;

    case 0xF6: // Jump
      node = {
        type: 'jump',
        targetOffset: (params[0] ?? 0) | ((params[1] ?? 0) << 8),
        ...baseNode,
      };
      break;

    case 0xF7: // Echo feedback
      node = { type: 'echo_feedback', value: params[0] ?? 0, ...baseNode };
      break;

    case 0xF8: // Echo filter
      node = { type: 'echo_filter', index: params[0] ?? 0, ...baseNode };
      break;

    case 0xFB: // Music volume reset
      node = { type: 'music_volume_reset', ...baseNode };
      break;

    case 0xFC: // Conditional jump 2
      node = {
        type: 'conditional_jump',
        iteration: params[0] ?? 0,
        targetOffset: (params[1] ?? 0) | ((params[2] ?? 0) << 8),
        ...baseNode,
      };
      break;

    case 0xFD:
    case 0xFE:
    case 0xFF:
      node = { type: 'end', ...baseNode };
      break;

    default:
      // Unknown command - preserve raw bytes
      node = {
        type: 'unknown',
        bytes: [opcode, ...params],
        ...baseNode,
      };
  }

  return {
    node,
    bytesConsumed: 1 + paramCount,
  };
}
