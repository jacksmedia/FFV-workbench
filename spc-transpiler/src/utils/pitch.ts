/**
 * Pitch conversion utilities for SPC-700 music transpiler.
 * Handles MIDI note numbers, semitones, note names, and frequency conversions.
 */

/** Note names in chromatic order (sharps notation) */
export const NOTE_NAMES = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'] as const;

/** Alternative note names using flats */
export const NOTE_NAMES_FLAT = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'] as const;

/** MIDI note number for middle C (C4) */
export const MIDI_MIDDLE_C = 60;

/** Standard tuning frequency for A4 in Hz */
export const A4_FREQUENCY = 440;

/** MIDI note number for A4 */
export const MIDI_A4 = 69;

/**
 * Convert a MIDI note number to a semitone (0-11).
 * Semitone 0 = C, 1 = C#, 2 = D, etc.
 * @param midi - MIDI note number (0-127)
 * @returns Semitone value (0-11)
 */
export function midiToSemitone(midi: number): number {
  if (midi < 0 || midi > 127) {
    throw new RangeError(`midiToSemitone: MIDI note ${midi} out of range (0-127)`);
  }
  return midi % 12;
}

/**
 * Get the octave number from a MIDI note.
 * Uses standard MIDI octave numbering where middle C (60) is C4.
 * @param midi - MIDI note number (0-127)
 * @returns Octave number (-1 to 9)
 */
export function midiToOctave(midi: number): number {
  if (midi < 0 || midi > 127) {
    throw new RangeError(`midiToOctave: MIDI note ${midi} out of range (0-127)`);
  }
  return Math.floor(midi / 12) - 1;
}

/**
 * Convert a semitone and octave to a MIDI note number.
 * @param semitone - Semitone value (0-11, where 0 = C)
 * @param octave - Octave number (-1 to 9)
 * @returns MIDI note number (0-127)
 */
export function semitoneToMidi(semitone: number, octave: number): number {
  if (semitone < 0 || semitone > 11) {
    throw new RangeError(`semitoneToMidi: semitone ${semitone} out of range (0-11)`);
  }
  const midi = (octave + 1) * 12 + semitone;
  if (midi < 0 || midi > 127) {
    throw new RangeError(`semitoneToMidi: resulting MIDI note ${midi} out of range (0-127)`);
  }
  return midi;
}

/**
 * Convert a semitone value to its note name.
 * @param semitone - Semitone value (0-11)
 * @param useFlats - If true, use flat notation (Db instead of C#)
 * @returns Note name string
 */
export function semitoneToName(semitone: number, useFlats: boolean = false): string {
  if (semitone < 0 || semitone > 11) {
    throw new RangeError(`semitoneToName: semitone ${semitone} out of range (0-11)`);
  }
  return useFlats ? NOTE_NAMES_FLAT[semitone]! : NOTE_NAMES[semitone]!;
}

/**
 * Convert a note name to its semitone value.
 * Accepts both sharp and flat notation.
 * @param name - Note name (e.g., 'C', 'C#', 'Db', 'F#', 'Gb')
 * @returns Semitone value (0-11)
 */
export function nameToSemitone(name: string): number {
  const normalized = name.trim();

  // Try sharp notation first
  let idx = NOTE_NAMES.indexOf(normalized as typeof NOTE_NAMES[number]);
  if (idx !== -1) return idx;

  // Try flat notation
  idx = NOTE_NAMES_FLAT.indexOf(normalized as typeof NOTE_NAMES_FLAT[number]);
  if (idx !== -1) return idx;

  // Handle lowercase
  const upper = normalized.charAt(0).toUpperCase() + normalized.slice(1).toLowerCase();
  idx = NOTE_NAMES.indexOf(upper as typeof NOTE_NAMES[number]);
  if (idx !== -1) return idx;

  idx = NOTE_NAMES_FLAT.indexOf(upper as typeof NOTE_NAMES_FLAT[number]);
  if (idx !== -1) return idx;

  throw new Error(`nameToSemitone: unrecognized note name '${name}'`);
}

/**
 * Convert a frequency in Hz to the nearest semitone.
 * Uses equal temperament with A4 = 440 Hz.
 * @param hz - Frequency in Hertz
 * @returns Object with semitone (0-11), octave, midi note, and cents deviation
 */
export function frequencyToSemitone(hz: number): {
  semitone: number;
  octave: number;
  midi: number;
  cents: number;
} {
  if (hz <= 0) {
    throw new RangeError(`frequencyToSemitone: frequency must be positive, got ${hz}`);
  }

  // Calculate MIDI note from frequency
  // Formula: midi = 69 + 12 * log2(hz / 440)
  const exactMidi = MIDI_A4 + 12 * Math.log2(hz / A4_FREQUENCY);
  const midi = Math.round(exactMidi);

  // Clamp to valid MIDI range
  const clampedMidi = Math.max(0, Math.min(127, midi));

  // Calculate cents deviation (100 cents = 1 semitone)
  const cents = Math.round((exactMidi - midi) * 100);

  return {
    semitone: midiToSemitone(clampedMidi),
    octave: midiToOctave(clampedMidi),
    midi: clampedMidi,
    cents,
  };
}

/**
 * Convert a MIDI note to its frequency in Hz.
 * Uses equal temperament with A4 = 440 Hz.
 * @param midi - MIDI note number (0-127)
 * @returns Frequency in Hertz
 */
export function midiToFrequency(midi: number): number {
  if (midi < 0 || midi > 127) {
    throw new RangeError(`midiToFrequency: MIDI note ${midi} out of range (0-127)`);
  }
  // Formula: hz = 440 * 2^((midi - 69) / 12)
  return A4_FREQUENCY * Math.pow(2, (midi - MIDI_A4) / 12);
}

/**
 * Transpose a pitch by a number of semitones.
 * @param semitone - Current semitone (0-11)
 * @param octave - Current octave
 * @param delta - Number of semitones to transpose (positive = up, negative = down)
 * @returns Object with new semitone and octave
 */
export function transposePitch(
  semitone: number,
  octave: number,
  delta: number
): { semitone: number; octave: number } {
  if (semitone < 0 || semitone > 11) {
    throw new RangeError(`transposePitch: semitone ${semitone} out of range (0-11)`);
  }

  const totalSemitones = semitone + delta;

  // Calculate new octave and semitone
  // Use floor division to handle negative values correctly
  const octaveChange = Math.floor(totalSemitones / 12);
  let newSemitone = totalSemitones % 12;

  // Handle negative modulo (JavaScript % can return negative)
  if (newSemitone < 0) {
    newSemitone += 12;
  }

  return {
    semitone: newSemitone,
    octave: octave + octaveChange,
  };
}

/**
 * Get the full note name with octave (e.g., "C4", "F#5").
 * @param midi - MIDI note number
 * @param useFlats - If true, use flat notation
 * @returns Full note name with octave
 */
export function midiToNoteName(midi: number, useFlats: boolean = false): string {
  const semitone = midiToSemitone(midi);
  const octave = midiToOctave(midi);
  return semitoneToName(semitone, useFlats) + octave;
}

/**
 * Parse a note name with octave (e.g., "C4", "F#5", "Bb3") to MIDI.
 * @param noteName - Full note name with octave
 * @returns MIDI note number
 */
export function noteNameToMidi(noteName: string): number {
  const match = noteName.match(/^([A-Ga-g][#b]?)(-?\d+)$/);
  if (!match) {
    throw new Error(`noteNameToMidi: invalid note name '${noteName}'`);
  }

  const [, name, octaveStr] = match;
  const semitone = nameToSemitone(name!);
  const octave = parseInt(octaveStr!, 10);

  return semitoneToMidi(semitone, octave);
}
