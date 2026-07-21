/**
 * FF5 Command Opcodes (D2-FB range)
 * Source: Gnilda-guide-FFV.pdf, FF5_soundo.pdf
 *
 * FF5 and FFMQ share the same encoding family
 */

/** Command parameter counts (how many bytes follow the opcode) */
export const FF5_COMMAND_PARAMS: Record<number, number> = {
  0xD2: 1, // Volume (xx: 00-7F)
  0xD3: 2, // Volume fade (xx: time, yy: target)
  0xD4: 1, // Pan (xx: 00=left, FF=right)
  0xD5: 2, // Pan fade (xx: time, yy: target)
  0xD6: 2, // Pitch slide (xx: time, yy: semitones signed)
  0xD7: 3, // Vibrato on (xx: delay, yy: period, zz: depth+waveform)
  0xD8: 0, // Vibrato off
  0xD9: 3, // Tremolo on (xx: delay, yy: period, zz: depth+waveform)
  0xDA: 0, // Tremolo off
  0xDB: 2, // Auto-pan (xx: period, yy: depth signed)
  0xDC: 0, // Auto-pan off
  0xDD: 1, // Noise clock (xx: 00-1F)
  0xDE: 0, // Noise on
  0xDF: 0, // Noise off
  0xE0: 0, // Pitch modulation on
  0xE1: 0, // Pitch modulation off
  0xE2: 0, // Echo on
  0xE3: 0, // Echo off
  0xE4: 1, // Octave set (xx)
  0xE5: 0, // Octave up
  0xE6: 0, // Octave down
  0xE7: 1, // Transpose set (xx: signed semitones)
  0xE8: 1, // Transpose relative (xx: signed delta)
  0xE9: 1, // Detune (xx: signed)
  0xEA: 1, // Instrument/waveform (xx: 00-3F, 20+ are song-specific)
  0xEB: 1, // Attack rate (xx: 00-0F)
  0xEC: 1, // Decay rate (xx: 00-07)
  0xED: 1, // Sustain level (xx: 00-07)
  0xEE: 1, // Sustain rate (xx: 00-1F)
  0xEF: 0, // ADSR reset to instrument default
  0xF0: 1, // Loop start (xx: count, 00/FF = infinite)
  0xF1: 0, // Loop end
  0xF2: 0, // End track
  0xF3: 1, // Tempo (xx: ~BPM)
  0xF4: 2, // Tempo fade (xx: time, yy: target)
  0xF5: 1, // Echo volume (xx)
  0xF6: 2, // Echo volume fade (xx: time, yy: target)
  0xF7: 2, // Echo feedback (xx) + FIR filter (yy: 00-03)
  0xF8: 1, // Music volume (xx)
  0xF9: 3, // Conditional jump (xx: iteration, yy zz: addr)
  0xFA: 2, // Unconditional jump (xx yy: addr)
  0xFB: 2, // Conditional jump 2 (xx yy: addr, if bit set)
  // FC-FF: End track (alternate)
  0xFC: 0,
  0xFD: 0,
  0xFE: 0,
  0xFF: 0,
};

/** Command names for display/debugging */
export const FF5_COMMAND_NAMES: Record<number, string> = {
  0xD2: 'Volume',
  0xD3: 'Volume Fade',
  0xD4: 'Pan',
  0xD5: 'Pan Fade',
  0xD6: 'Pitch Slide',
  0xD7: 'Vibrato',
  0xD8: 'Vibrato Off',
  0xD9: 'Tremolo',
  0xDA: 'Tremolo Off',
  0xDB: 'Auto-Pan',
  0xDC: 'Auto-Pan Off',
  0xDD: 'Noise Clock',
  0xDE: 'Noise On',
  0xDF: 'Noise Off',
  0xE0: 'Pitch Mod On',
  0xE1: 'Pitch Mod Off',
  0xE2: 'Echo On',
  0xE3: 'Echo Off',
  0xE4: 'Octave',
  0xE5: 'Octave Up',
  0xE6: 'Octave Down',
  0xE7: 'Transpose',
  0xE8: 'Transpose Rel',
  0xE9: 'Detune',
  0xEA: 'Instrument',
  0xEB: 'Attack',
  0xEC: 'Decay',
  0xED: 'Sustain Lvl',
  0xEE: 'Sustain Rate',
  0xEF: 'ADSR Reset',
  0xF0: 'Loop Start',
  0xF1: 'Loop End',
  0xF2: 'End',
  0xF3: 'Tempo',
  0xF4: 'Tempo Fade',
  0xF5: 'Echo Volume',
  0xF6: 'Echo Vol Fade',
  0xF7: 'Echo FB/FIR',
  0xF8: 'Music Volume',
  0xF9: 'Cond Jump',
  0xFA: 'Jump',
  0xFB: 'Cond Jump 2',
  0xFC: 'End',
  0xFD: 'End',
  0xFE: 'End',
  0xFF: 'End',
};

/** FIR filter coefficient tables (from docs) */
export const FF5_FIR_TABLES: readonly number[][] = [
  [0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00], // 0: No filter
  [0x0C, 0x21, 0x2B, 0x2B, 0x13, 0xFE, 0xF3, 0xF9], // 1: Low-pass
  [0x58, 0xBF, 0xDB, 0xF0, 0xFE, 0x07, 0x0C, 0x0C], // 2: ?
  [0x34, 0x33, 0x00, 0xD9, 0xE5, 0x01, 0xFC, 0xEB], // 3: ?
] as const;

/** Check if byte is a command (D2+) */
export function isFF5Command(byte: number): boolean {
  return byte >= 0xD2;
}

/** Check if byte is an end command */
export function isFF5EndCommand(byte: number): boolean {
  return byte >= 0xF2 && byte !== 0xF3 && byte !== 0xF4 && byte !== 0xF5 &&
         byte !== 0xF6 && byte !== 0xF7 && byte !== 0xF8 && byte !== 0xF9 &&
         byte !== 0xFA && byte !== 0xFB;
}

/** Get parameter count for a command */
export function getFF5CommandParams(opcode: number): number {
  return FF5_COMMAND_PARAMS[opcode] ?? 0;
}

/** Get command name */
export function getFF5CommandName(opcode: number): string {
  return FF5_COMMAND_NAMES[opcode] ?? `Unknown ${opcode.toString(16).toUpperCase()}`;
}
