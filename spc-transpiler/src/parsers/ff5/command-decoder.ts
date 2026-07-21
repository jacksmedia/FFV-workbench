/**
 * FF5 Command Decoder
 * Parses D2-FB command opcodes into AST nodes
 */

import type {
  SequenceNode,
  VolumeNode,
  VolumeFadeNode,
  PanNode,
  PanFadeNode,
  PitchSlideNode,
  VibratoNode,
  VibratoOffNode,
  TremoloNode,
  TremoloOffNode,
  AutoPanNode,
  AutoPanOffNode,
  NoiseClockNode,
  NoiseOnNode,
  NoiseOffNode,
  PitchModOnNode,
  PitchModOffNode,
  EchoOnNode,
  EchoOffNode,
  OctaveNode,
  OctaveRelativeNode,
  TransposeNode,
  DetuneNode,
  InstrumentNode,
  AttackNode,
  DecayNode,
  SustainLevelNode,
  SustainRateNode,
  AdsrResetNode,
  LoopStartNode,
  LoopEndNode,
  EndNode,
  TempoNode,
  TempoFadeNode,
  EchoVolumeNode,
  EchoFeedbackNode,
  MusicVolumeNode,
  ConditionalJumpNode,
  JumpNode,
  UnknownNode,
} from '@/types/ast';
import { FF5_COMMAND_PARAMS, isFF5EndCommand } from '@/constants/ff5-commands';
import { readU8 } from '@/utils/bytes';

/** Result of decoding a command */
export interface CommandDecodeResult {
  /** The decoded AST node */
  node: SequenceNode;
  /** Total bytes consumed (opcode + parameters) */
  bytesConsumed: number;
}

/**
 * Decode an FF5 command opcode and its parameters.
 *
 * FF5 commands are in the D2-FF range:
 * - D2-FB: Active commands with 0-3 parameters
 * - F2, FC-FF: End track markers
 *
 * @param rom - The ROM data buffer
 * @param offset - ROM offset to the command opcode
 * @returns Decoded node and byte count, or null if not a command
 */
export function decodeCommand(rom: Uint8Array, offset: number): CommandDecodeResult | null {
  const opcode = readU8(rom, offset);

  // Only handle command range (D2+)
  if (opcode < 0xD2) {
    return null;
  }

  const paramCount = FF5_COMMAND_PARAMS[opcode] ?? 0;
  const bytesConsumed = 1 + paramCount;

  // Read parameters
  const params: number[] = [];
  for (let i = 0; i < paramCount; i++) {
    params.push(readU8(rom, offset + 1 + i));
  }

  // Decode based on opcode
  const node = decodeOpcodeToNode(opcode, params, offset);

  return { node, bytesConsumed };
}

/**
 * Decode opcode and params into the appropriate AST node.
 */
function decodeOpcodeToNode(
  opcode: number,
  params: number[],
  offset: number
): SequenceNode {
  switch (opcode) {
    // Volume (D2 xx)
    case 0xD2: {
      const node: VolumeNode = {
        type: 'volume',
        sourceOffset: offset,
        sourceByte: opcode,
        value: params[0] ?? 0,
      };
      return node;
    }

    // Volume Fade (D3 xx yy)
    case 0xD3: {
      const node: VolumeFadeNode = {
        type: 'volume_fade',
        sourceOffset: offset,
        sourceByte: opcode,
        duration: params[0] ?? 0, // Time in ticks
        targetValue: params[1] ?? 0,
      };
      return node;
    }

    // Pan (D4 xx)
    case 0xD4: {
      const node: PanNode = {
        type: 'pan',
        sourceOffset: offset,
        sourceByte: opcode,
        value: params[0] ?? 0,
      };
      return node;
    }

    // Pan Fade (D5 xx yy)
    case 0xD5: {
      const node: PanFadeNode = {
        type: 'pan_fade',
        sourceOffset: offset,
        sourceByte: opcode,
        duration: params[0] ?? 0,
        targetValue: params[1] ?? 0,
      };
      return node;
    }

    // Pitch Slide (D6 xx yy)
    case 0xD6: {
      const node: PitchSlideNode = {
        type: 'pitch_slide',
        sourceOffset: offset,
        sourceByte: opcode,
        duration: params[0] ?? 0,
        semitones: toSigned8(params[1] ?? 0),
      };
      return node;
    }

    // Vibrato On (D7 xx yy zz)
    case 0xD7: {
      const depthByte = params[2] ?? 0;
      const node: VibratoNode = {
        type: 'vibrato',
        sourceOffset: offset,
        sourceByte: opcode,
        delay: params[0] ?? 0,
        period: params[1] ?? 0,
        depth: depthByte & 0x3F, // Lower 6 bits
        waveform: (depthByte >> 6) & 0x03, // Upper 2 bits
      };
      return node;
    }

    // Vibrato Off (D8)
    case 0xD8: {
      const node: VibratoOffNode = {
        type: 'vibrato_off',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Tremolo On (D9 xx yy zz)
    case 0xD9: {
      const depthByte = params[2] ?? 0;
      const node: TremoloNode = {
        type: 'tremolo',
        sourceOffset: offset,
        sourceByte: opcode,
        delay: params[0] ?? 0,
        period: params[1] ?? 0,
        depth: depthByte & 0x3F,
        waveform: (depthByte >> 6) & 0x03,
      };
      return node;
    }

    // Tremolo Off (DA)
    case 0xDA: {
      const node: TremoloOffNode = {
        type: 'tremolo_off',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Auto-Pan (DB xx yy)
    case 0xDB: {
      const depthSigned = toSigned8(params[1] ?? 0);
      const node: AutoPanNode = {
        type: 'auto_pan',
        sourceOffset: offset,
        sourceByte: opcode,
        period: params[0] ?? 0,
        depth: Math.abs(depthSigned),
        direction: depthSigned >= 0 ? 'left_first' : 'right_first',
      };
      return node;
    }

    // Auto-Pan Off (DC)
    case 0xDC: {
      const node: AutoPanOffNode = {
        type: 'auto_pan_off',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Noise Clock (DD xx)
    case 0xDD: {
      const node: NoiseClockNode = {
        type: 'noise_clock',
        sourceOffset: offset,
        sourceByte: opcode,
        value: (params[0] ?? 0) & 0x1F, // 5-bit value
      };
      return node;
    }

    // Noise On (DE)
    case 0xDE: {
      const node: NoiseOnNode = {
        type: 'noise_on',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Noise Off (DF)
    case 0xDF: {
      const node: NoiseOffNode = {
        type: 'noise_off',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Pitch Modulation On (E0)
    case 0xE0: {
      const node: PitchModOnNode = {
        type: 'pitch_mod_on',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Pitch Modulation Off (E1)
    case 0xE1: {
      const node: PitchModOffNode = {
        type: 'pitch_mod_off',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Echo On (E2)
    case 0xE2: {
      const node: EchoOnNode = {
        type: 'echo_on',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Echo Off (E3)
    case 0xE3: {
      const node: EchoOffNode = {
        type: 'echo_off',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Octave Set (E4 xx)
    case 0xE4: {
      const node: OctaveNode = {
        type: 'octave',
        sourceOffset: offset,
        sourceByte: opcode,
        value: params[0] ?? 0,
      };
      return node;
    }

    // Octave Up (E5)
    case 0xE5: {
      const node: OctaveRelativeNode = {
        type: 'octave_relative',
        sourceOffset: offset,
        sourceByte: opcode,
        delta: 1,
      };
      return node;
    }

    // Octave Down (E6)
    case 0xE6: {
      const node: OctaveRelativeNode = {
        type: 'octave_relative',
        sourceOffset: offset,
        sourceByte: opcode,
        delta: -1,
      };
      return node;
    }

    // Transpose Set (E7 xx)
    case 0xE7: {
      const node: TransposeNode = {
        type: 'transpose',
        sourceOffset: offset,
        sourceByte: opcode,
        semitones: toSigned8(params[0] ?? 0),
      };
      return node;
    }

    // Transpose Relative (E8 xx)
    case 0xE8: {
      const node: TransposeNode = {
        type: 'transpose',
        sourceOffset: offset,
        sourceByte: opcode,
        semitones: toSigned8(params[0] ?? 0),
      };
      return node;
    }

    // Detune (E9 xx)
    case 0xE9: {
      const node: DetuneNode = {
        type: 'detune',
        sourceOffset: offset,
        sourceByte: opcode,
        value: toSigned8(params[0] ?? 0),
      };
      return node;
    }

    // Instrument/Waveform (EA xx)
    case 0xEA: {
      const node: InstrumentNode = {
        type: 'instrument',
        sourceOffset: offset,
        sourceByte: opcode,
        index: params[0] ?? 0,
      };
      return node;
    }

    // Attack Rate (EB xx)
    case 0xEB: {
      const node: AttackNode = {
        type: 'attack',
        sourceOffset: offset,
        sourceByte: opcode,
        rate: (params[0] ?? 0) & 0x0F,
      };
      return node;
    }

    // Decay Rate (EC xx)
    case 0xEC: {
      const node: DecayNode = {
        type: 'decay',
        sourceOffset: offset,
        sourceByte: opcode,
        rate: (params[0] ?? 0) & 0x07,
      };
      return node;
    }

    // Sustain Level (ED xx)
    case 0xED: {
      const node: SustainLevelNode = {
        type: 'sustain_level',
        sourceOffset: offset,
        sourceByte: opcode,
        level: (params[0] ?? 0) & 0x07,
      };
      return node;
    }

    // Sustain Rate (EE xx)
    case 0xEE: {
      const node: SustainRateNode = {
        type: 'sustain_rate',
        sourceOffset: offset,
        sourceByte: opcode,
        rate: (params[0] ?? 0) & 0x1F,
      };
      return node;
    }

    // ADSR Reset (EF)
    case 0xEF: {
      const node: AdsrResetNode = {
        type: 'adsr_reset',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Loop Start (F0 xx)
    case 0xF0: {
      const node: LoopStartNode = {
        type: 'loop_start',
        sourceOffset: offset,
        sourceByte: opcode,
        count: params[0] ?? 0, // 0 or 255 = infinite
      };
      return node;
    }

    // Loop End (F1)
    case 0xF1: {
      const node: LoopEndNode = {
        type: 'loop_end',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // End Track (F2)
    case 0xF2: {
      const node: EndNode = {
        type: 'end',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Tempo (F3 xx)
    case 0xF3: {
      const node: TempoNode = {
        type: 'tempo',
        sourceOffset: offset,
        sourceByte: opcode,
        value: params[0] ?? 0,
      };
      return node;
    }

    // Tempo Fade (F4 xx yy)
    case 0xF4: {
      const node: TempoFadeNode = {
        type: 'tempo_fade',
        sourceOffset: offset,
        sourceByte: opcode,
        duration: params[0] ?? 0,
        targetValue: params[1] ?? 0,
      };
      return node;
    }

    // Echo Volume (F5 xx)
    // FF5 has a single echo volume; the driver writes it to both EVOL(L)
    // and EVOL(R), so populate both stereo fields with the same value.
    case 0xF5: {
      const vol = params[0] ?? 0;
      const node: EchoVolumeNode = {
        type: 'echo_volume',
        sourceOffset: offset,
        sourceByte: opcode,
        left: vol,
        right: vol,
      };
      return node;
    }

    // Echo Volume Fade (F6 xx yy)
    case 0xF6: {
      // Encode as echo_volume at the fade target value
      // The fade time is implicit in the driver
      const target = params[1] ?? 0;
      const node: EchoVolumeNode = {
        type: 'echo_volume',
        sourceOffset: offset,
        sourceByte: opcode,
        left: target,
        right: target,
      };
      return node;
    }

    // Echo Feedback + FIR Filter (F7 xx yy)
    case 0xF7: {
      // F7 sets both feedback and FIR filter
      // We create separate nodes for clarity - return feedback first
      const feedbackNode: EchoFeedbackNode = {
        type: 'echo_feedback',
        sourceOffset: offset,
        sourceByte: opcode,
        value: params[0] ?? 0,
        filterIndex: params[1] ?? 0,
      };
      return feedbackNode;
    }

    // Music Volume (F8 xx)
    case 0xF8: {
      const node: MusicVolumeNode = {
        type: 'music_volume',
        sourceOffset: offset,
        sourceByte: opcode,
        value: params[0] ?? 0,
      };
      return node;
    }

    // Conditional Jump (F9 xx yy zz)
    case 0xF9: {
      // Jump on Nth iteration of loop
      const targetAddr = (params[2] ?? 0) << 8 | (params[1] ?? 0);
      const node: ConditionalJumpNode = {
        type: 'conditional_jump',
        sourceOffset: offset,
        sourceByte: opcode,
        iteration: params[0] ?? 0,
        targetOffset: targetAddr, // SPC address, needs conversion
      };
      return node;
    }

    // Unconditional Jump (FA xx yy)
    case 0xFA: {
      const targetAddr = (params[1] ?? 0) << 8 | (params[0] ?? 0);
      const node: JumpNode = {
        type: 'jump',
        sourceOffset: offset,
        sourceByte: opcode,
        targetOffset: targetAddr, // SPC address
      };
      return node;
    }

    // Conditional Jump 2 (FB xx yy)
    case 0xFB: {
      const targetAddr = (params[1] ?? 0) << 8 | (params[0] ?? 0);
      const node: ConditionalJumpNode = {
        type: 'conditional_jump',
        sourceOffset: offset,
        sourceByte: opcode,
        iteration: 0, // Different condition type
        targetOffset: targetAddr,
      };
      return node;
    }

    // End Track alternates (FC-FF)
    case 0xFC:
    case 0xFD:
    case 0xFE:
    case 0xFF: {
      const node: EndNode = {
        type: 'end',
        sourceOffset: offset,
        sourceByte: opcode,
      };
      return node;
    }

    // Unknown command (should not happen for valid data)
    default: {
      const node: UnknownNode = {
        type: 'unknown',
        sourceOffset: offset,
        sourceByte: opcode,
        bytes: [opcode, ...params],
      };
      return node;
    }
  }
}

/**
 * Convert unsigned byte to signed (-128 to 127).
 */
function toSigned8(value: number): number {
  return value > 127 ? value - 256 : value;
}

/**
 * Check if an opcode is an end track command.
 * @param opcode - The command opcode
 * @returns true if this ends the track
 */
export function isEndCommand(opcode: number): boolean {
  return isFF5EndCommand(opcode);
}
