/**
 * FF6 Command Opcodes (C4-FF range)
 * Source: Gnilda-guide-FF6.pdf
 *
 * Commands start at C4 (vs FF5's D2)
 * Note: Pan is multiplied by 2 internally by the driver
 */

/** Command parameter counts (how many bytes follow the opcode) */
export const FF6_COMMAND_PARAMS: Record<number, number> = {
  0xC4: 1, // Volume (xx: 00-FF)
  0xC5: 2, // Volume fade (xx: time, yy: target)
  0xC6: 1, // Pan (xx: 00-7F, multiplied by 2 internally)
  0xC7: 2, // Pan fade (xx: time, yy: target)
  0xC8: 2, // Pitch slide (xx: time, yy: semitones signed)
  0xC9: 3, // Vibrato on (xx: delay, yy: period, zz: depth)
  0xCA: 0, // Vibrato off
  0xCB: 3, // Tremolo on (xx: delay, yy: period, zz: depth)
  0xCC: 0, // Tremolo off
  0xCD: 2, // Auto-pan (xx: period, yy: depth)
  0xCE: 0, // Auto-pan off
  0xCF: 1, // Noise clock (xx: 00-1F)
  0xD0: 0, // Noise on
  0xD1: 0, // Noise off
  0xD2: 0, // Pitch modulation on
  0xD3: 0, // Pitch modulation off
  0xD4: 0, // Echo on
  0xD5: 0, // Echo off
  0xD6: 1, // Octave set (xx: 0-7)
  0xD7: 0, // Octave up
  0xD8: 0, // Octave down
  0xD9: 1, // Transpose set (xx: signed semitones)
  0xDA: 1, // Transpose relative (xx: signed delta)
  0xDB: 1, // Detune (xx: signed)
  0xDC: 1, // Instrument/waveform (xx)
  0xDD: 1, // Attack rate (xx: 00-0F)
  0xDE: 1, // Decay rate (xx: 00-07)
  0xDF: 1, // Sustain level (xx: 00-07)
  0xE0: 1, // Sustain rate (xx: 00-1F)
  0xE1: 0, // ADSR reset to instrument default
  0xE2: 1, // Loop start (xx: count, 00 = infinite)
  0xE3: 0, // Loop end
  0xE4: 0, // Slur start (legato without re-attack)
  0xE5: 0, // Slur end
  0xE6: 0, // Legato start (tie without duration reset)
  0xE7: 0, // Legato end
  0xE8: 1, // Duration override (xx: ticks, next note only)
  // E9-EA: Unused/unknown
  0xEB: 0, // End track
  0xEC: 0, // End track (alt)
  0xED: 0, // End track (alt)
  0xEE: 0, // End track (alt)
  0xEF: 0, // End track (alt)
  0xF0: 1, // Tempo (xx: ~BPM)
  0xF1: 2, // Tempo fade (xx: time, yy: target)
  0xF2: 1, // Echo volume (xx)
  0xF3: 2, // Echo volume fade (xx: time, yy: target)
  0xF4: 1, // Music volume (xx)
  0xF5: 3, // Conditional jump (xx: iteration, yy zz: addr low/high)
  0xF6: 2, // Unconditional jump (xx yy: addr low/high)
  0xF7: 2, // Echo feedback set/fade (xx: value or time, yy: target if fade)
  0xF8: 2, // FIR filter set/fade (xx: filter index or time, yy: target if fade)
  // F9-FA: Unused/unknown
  0xFB: 0, // Music volume reset
  0xFC: 2, // Conditional jump 2 (xx yy: addr, condition-based)
  0xFD: 0, // End track (alt)
  0xFE: 0, // End track (alt)
  0xFF: 0, // End track (alt)
};

/** Command names for display/debugging */
export const FF6_COMMAND_NAMES: Record<number, string> = {
  0xC4: 'Volume',
  0xC5: 'Volume Fade',
  0xC6: 'Pan',
  0xC7: 'Pan Fade',
  0xC8: 'Pitch Slide',
  0xC9: 'Vibrato',
  0xCA: 'Vibrato Off',
  0xCB: 'Tremolo',
  0xCC: 'Tremolo Off',
  0xCD: 'Auto-Pan',
  0xCE: 'Auto-Pan Off',
  0xCF: 'Noise Clock',
  0xD0: 'Noise On',
  0xD1: 'Noise Off',
  0xD2: 'Pitch Mod On',
  0xD3: 'Pitch Mod Off',
  0xD4: 'Echo On',
  0xD5: 'Echo Off',
  0xD6: 'Octave',
  0xD7: 'Octave Up',
  0xD8: 'Octave Down',
  0xD9: 'Transpose',
  0xDA: 'Transpose Rel',
  0xDB: 'Detune',
  0xDC: 'Instrument',
  0xDD: 'Attack',
  0xDE: 'Decay',
  0xDF: 'Sustain Lvl',
  0xE0: 'Sustain Rate',
  0xE1: 'ADSR Reset',
  0xE2: 'Loop Start',
  0xE3: 'Loop End',
  0xE4: 'Slur Start',
  0xE5: 'Slur End',
  0xE6: 'Legato Start',
  0xE7: 'Legato End',
  0xE8: 'Duration Override',
  0xEB: 'End',
  0xEC: 'End',
  0xED: 'End',
  0xEE: 'End',
  0xEF: 'End',
  0xF0: 'Tempo',
  0xF1: 'Tempo Fade',
  0xF2: 'Echo Volume',
  0xF3: 'Echo Vol Fade',
  0xF4: 'Music Volume',
  0xF5: 'Cond Jump',
  0xF6: 'Jump',
  0xF7: 'Echo Feedback',
  0xF8: 'FIR Filter',
  0xFB: 'Music Vol Reset',
  0xFC: 'Cond Jump 2',
  0xFD: 'End',
  0xFE: 'End',
  0xFF: 'End',
};

/** First command opcode */
export const FF6_COMMAND_START = 0xC4;

/** Check if byte is a command (C4+) */
export function isFF6Command(byte: number): boolean {
  return byte >= FF6_COMMAND_START;
}

/** Check if byte is an end command */
export function isFF6EndCommand(byte: number): boolean {
  return byte === 0xEB ||
         (byte >= 0xEC && byte <= 0xEF) ||
         (byte >= 0xFD && byte <= 0xFF);
}

/** Get parameter count for a command */
export function getFF6CommandParams(opcode: number): number {
  return FF6_COMMAND_PARAMS[opcode] ?? 0;
}

/** Get command name */
export function getFF6CommandName(opcode: number): string {
  return FF6_COMMAND_NAMES[opcode] ?? `Unknown ${opcode.toString(16).toUpperCase()}`;
}

/**
 * Encode a command with its parameters into a byte array
 */
export function encodeFF6Command(opcode: number, params: number[]): number[] {
  const expectedParams = getFF6CommandParams(opcode);
  if (params.length !== expectedParams) {
    throw new Error(`Command ${opcode.toString(16).toUpperCase()} expects ${expectedParams} params, got ${params.length}`);
  }
  return [opcode, ...params];
}

/**
 * Decode a command from bytes, returning opcode, params, and bytes consumed
 */
export function decodeFF6Command(bytes: Uint8Array, offset: number): {
  opcode: number;
  params: number[];
  length: number;
} | null {
  if (offset >= bytes.length) return null;

  const opcode = bytes[offset]!;
  if (!isFF6Command(opcode)) return null;

  const paramCount = getFF6CommandParams(opcode);
  const params: number[] = [];

  for (let i = 0; i < paramCount; i++) {
    if (offset + 1 + i >= bytes.length) {
      // Truncated command
      return null;
    }
    params.push(bytes[offset + 1 + i]!);
  }

  return {
    opcode,
    params,
    length: 1 + paramCount,
  };
}

/**
 * Mapping from FF5 command opcodes to FF6 equivalents.
 * Returns [ff6Opcode, paramAdjustment] or null if no equivalent.
 *
 * Most commands map directly but with different opcodes.
 * Some FF5 commands don't exist in FF6 or work differently.
 */
export const FF5_TO_FF6_COMMAND_MAP: Record<number, number | null> = {
  0xD2: 0xC4, // Volume
  0xD3: 0xC5, // Volume Fade
  0xD4: 0xC6, // Pan
  0xD5: 0xC7, // Pan Fade
  0xD6: 0xC8, // Pitch Slide
  0xD7: 0xC9, // Vibrato
  0xD8: 0xCA, // Vibrato Off
  0xD9: 0xCB, // Tremolo
  0xDA: 0xCC, // Tremolo Off
  0xDB: 0xCD, // Auto-Pan
  0xDC: 0xCE, // Auto-Pan Off
  0xDD: 0xCF, // Noise Clock
  0xDE: 0xD0, // Noise On
  0xDF: 0xD1, // Noise Off
  0xE0: 0xD2, // Pitch Mod On
  0xE1: 0xD3, // Pitch Mod Off
  0xE2: 0xD4, // Echo On
  0xE3: 0xD5, // Echo Off
  0xE4: 0xD6, // Octave
  0xE5: 0xD7, // Octave Up
  0xE6: 0xD8, // Octave Down
  0xE7: 0xD9, // Transpose
  0xE8: 0xDA, // Transpose Rel
  0xE9: 0xDB, // Detune
  0xEA: 0xDC, // Instrument
  0xEB: 0xDD, // Attack
  0xEC: 0xDE, // Decay
  0xED: 0xDF, // Sustain Lvl
  0xEE: 0xE0, // Sustain Rate
  0xEF: 0xE1, // ADSR Reset
  0xF0: 0xE2, // Loop Start
  0xF1: 0xE3, // Loop End
  0xF2: 0xEB, // End Track
  0xF3: 0xF0, // Tempo
  0xF4: 0xF1, // Tempo Fade
  0xF5: 0xF2, // Echo Volume
  0xF6: 0xF3, // Echo Vol Fade
  0xF7: null, // Echo FB/FIR - different in FF6 (separate commands F7/F8)
  0xF8: 0xF4, // Music Volume
  0xF9: 0xF5, // Cond Jump
  0xFA: 0xF6, // Jump
  0xFB: 0xFC, // Cond Jump 2
  0xFC: 0xEB, // End (alt)
  0xFD: 0xEB, // End (alt)
  0xFE: 0xEB, // End (alt)
  0xFF: 0xEB, // End (alt)
};

/**
 * Convert an FF5 command to FF6 format.
 * Returns the new opcode, or null if the command cannot be converted.
 * Note: Parameters may need adjustment (especially for Echo FB/FIR).
 */
export function convertFF5ToFF6Command(ff5Opcode: number): number | null {
  return FF5_TO_FF6_COMMAND_MAP[ff5Opcode] ?? null;
}

/**
 * Commands unique to FF6 (not present in FF5):
 * - E4/E5: Slur start/end
 * - E6/E7: Legato start/end
 * - E8: Duration override
 * - FB: Music volume reset
 */
export const FF6_UNIQUE_COMMANDS = [0xE4, 0xE5, 0xE6, 0xE7, 0xE8, 0xFB] as const;

/**
 * Commands where FF5 and FF6 parameters differ:
 * - Pan (C6): FF6 multiplies by 2 internally
 * - Echo FB/FIR: FF5 combines in one command (F7), FF6 separates (F7/F8)
 */
export interface CommandDifference {
  ff5Opcode: number;
  ff6Opcode: number | null;
  note: string;
}

export const COMMAND_DIFFERENCES: readonly CommandDifference[] = [
  {
    ff5Opcode: 0xD4,
    ff6Opcode: 0xC6,
    note: 'Pan: FF6 multiplies value by 2 internally, so FF5 values may need halving',
  },
  {
    ff5Opcode: 0xF7,
    ff6Opcode: null,
    note: 'Echo FB/FIR: FF5 uses single command F7(fb,fir), FF6 uses separate F7(fb) and F8(fir)',
  },
] as const;
