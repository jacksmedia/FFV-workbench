/**
 * FF4 Command Opcodes (D2+ range)
 * Source: chillyfeez-FF4-music-hacking.txt
 *
 * FF4 has a simpler command set than FF5, with many "no effect" placeholders.
 * Commands start at D2 (after note/rest/tie data ends at D1).
 */

/** Command parameter counts (how many bytes follow the opcode) */
export const FF4_COMMAND_PARAMS: Record<number, number> = {
  0xD2: 3, // Fade in tempo (xx yy zz)
  0xD3: 3, // No effect (xx yy zz)
  0xD4: 1, // Multiple voice effect (xx)
  0xD5: 2, // Reverb (xx yy)
  0xD6: 3, // Funky reverb (xx yy zz)
  0xD7: 3, // No effect (xx yy zz)
  0xD8: 3, // No effect (xx yy zz)
  0xD9: 3, // No effect (xx yy zz)
  0xDA: 1, // Set octave (xx)
  0xDB: 1, // Set instrument (xx: 40=first, 41=second, etc.)
  0xDC: 1, // Set transpose (xx: unknown effect per docs)
  0xDD: 1, // Increment transpose (xx)
  0xDE: 1, // Track volume - relative (xx)
  0xDF: 1, // No effect (xx)
  0xE0: 1, // Loop start (xx: count)
  0xE1: 0, // Octave up
  0xE2: 0, // Octave down
  // E3-E9: Unknown/unused - assume 0 params
  0xE3: 0,
  0xE4: 0,
  0xE5: 0,
  0xE6: 0,
  0xE7: 0,
  0xE8: 0,
  0xE9: 0,
  0xEA: 0, // Track header marker
  0xEB: 0, // Track header marker
  0xEC: 0, // Static mode (all notes become static)
  // ED-EF: Unknown/unused - assume 0 params
  0xED: 0,
  0xEE: 0,
  0xEF: 0,
  0xF0: 0, // Loop end (pairs with E0)
  0xF1: 0, // Stop music
  0xF2: 3, // Volume (xx yy zz: only zz has effect)
  0xF3: 3, // Unknown (always appears at track start)
  0xF4: 2, // Go to address / song loop (xx yy: little-endian address)
  0xF5: 3, // No effect (xx yy zz)
  // F6+: Stop music
  0xF6: 0,
  0xF7: 0,
  0xF8: 0,
  0xF9: 0,
  0xFA: 0,
  0xFB: 0,
  0xFC: 0,
  0xFD: 0,
  0xFE: 0,
  0xFF: 0,
};

/** Command names for display/debugging */
export const FF4_COMMAND_NAMES: Record<number, string> = {
  0xD2: 'Fade In Tempo',
  0xD3: 'No Effect (3p)',
  0xD4: 'Multi Voice',
  0xD5: 'Reverb',
  0xD6: 'Funky Reverb',
  0xD7: 'No Effect (3p)',
  0xD8: 'No Effect (3p)',
  0xD9: 'No Effect (3p)',
  0xDA: 'Octave',
  0xDB: 'Instrument',
  0xDC: 'Transpose',
  0xDD: 'Transpose Inc',
  0xDE: 'Track Volume',
  0xDF: 'No Effect (1p)',
  0xE0: 'Loop Start',
  0xE1: 'Octave Up',
  0xE2: 'Octave Down',
  0xE3: 'Unknown E3',
  0xE4: 'Unknown E4',
  0xE5: 'Unknown E5',
  0xE6: 'Unknown E6',
  0xE7: 'Unknown E7',
  0xE8: 'Unknown E8',
  0xE9: 'Unknown E9',
  0xEA: 'Track Header',
  0xEB: 'Track Header',
  0xEC: 'Static Mode',
  0xED: 'Unknown ED',
  0xEE: 'Unknown EE',
  0xEF: 'Unknown EF',
  0xF0: 'Loop End',
  0xF1: 'Stop',
  0xF2: 'Volume',
  0xF3: 'Init (F3)',
  0xF4: 'Jump',
  0xF5: 'No Effect (3p)',
  0xF6: 'Stop',
  0xF7: 'Stop',
  0xF8: 'Stop',
  0xF9: 'Stop',
  0xFA: 'Stop',
  0xFB: 'Stop',
  0xFC: 'Stop',
  0xFD: 'Stop',
  0xFE: 'Stop',
  0xFF: 'Stop',
};

/** Commands that are known to do nothing (placeholders in FF4's engine) */
export const FF4_NOOP_COMMANDS: readonly number[] = [
  0xD3, 0xD7, 0xD8, 0xD9, 0xDF, 0xF5,
] as const;

/** Commands that stop music playback */
export const FF4_STOP_COMMANDS: readonly number[] = [
  0xF1, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA, 0xFB, 0xFC, 0xFD, 0xFE, 0xFF,
] as const;

/** Check if byte is a command (D2+) */
export function isFF4Command(byte: number): boolean {
  return byte >= 0xD2;
}

/** Check if byte is a stop/end command */
export function isFF4StopCommand(byte: number): boolean {
  return byte === 0xF1 || byte >= 0xF6;
}

/** Check if byte is a no-op command */
export function isFF4NoopCommand(byte: number): boolean {
  return FF4_NOOP_COMMANDS.includes(byte);
}

/** Check if byte is a loop control command */
export function isFF4LoopCommand(byte: number): boolean {
  return byte === 0xE0 || byte === 0xF0;
}

/** Get parameter count for a command */
export function getFF4CommandParams(opcode: number): number {
  return FF4_COMMAND_PARAMS[opcode] ?? 0;
}

/** Get command name */
export function getFF4CommandName(opcode: number): string {
  return FF4_COMMAND_NAMES[opcode] ?? `Unknown ${opcode.toString(16).toUpperCase()}`;
}

/**
 * Decode instrument byte to instrument index
 * FF4 instruments start at 0x40 (first instrument = 0x40, second = 0x41, etc.)
 */
export function decodeFF4Instrument(byte: number): number {
  return byte - 0x40;
}

/**
 * Encode instrument index to instrument byte
 */
export function encodeFF4Instrument(index: number): number {
  return index + 0x40;
}

/**
 * Parse a jump address from two bytes (little-endian)
 */
export function parseFF4JumpAddress(lowByte: number, highByte: number): number {
  return (highByte << 8) | lowByte;
}

/**
 * Encode a jump address to two bytes (little-endian)
 */
export function encodeFF4JumpAddress(address: number): [number, number] {
  return [address & 0xFF, (address >> 8) & 0xFF];
}
