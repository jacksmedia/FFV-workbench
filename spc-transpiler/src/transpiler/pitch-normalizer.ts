/**
 * Pitch Normalizer
 *
 * Converts between different pitch representations:
 * - AST format: { semitone: 0-11, octave: 0-7 }
 * - Game-specific: byte value encoding pitch + duration
 * - MIDI: note number 0-127
 */

import type { NotePitch, GameId } from '@/types/ast';

/** MIDI note number for C0 */
const MIDI_C0 = 12;

/** Convert AST pitch to MIDI note number */
export function pitchToMidi(pitch: NotePitch): number {
  return MIDI_C0 + (pitch.octave * 12) + pitch.semitone;
}

/** Convert MIDI note number to AST pitch */
export function midiToPitch(midi: number): NotePitch {
  const adjusted = midi - MIDI_C0;
  return {
    octave: Math.floor(adjusted / 12),
    semitone: ((adjusted % 12) + 12) % 12, // Handle negative modulo
  };
}

/** Apply semitone transposition to a pitch */
export function transposePitch(pitch: NotePitch, semitones: number): NotePitch {
  const midi = pitchToMidi(pitch) + semitones;
  return midiToPitch(midi);
}

/** Get note name from semitone */
export function semitoneToName(semitone: number): string {
  const names = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
  return names[semitone % 12] ?? 'C';
}

/** Get semitone from note name */
export function nameToSemitone(name: string): number {
  const map: Record<string, number> = {
    'C': 0, 'C#': 1, 'DB': 1, 'D': 2, 'D#': 3, 'EB': 3,
    'E': 4, 'F': 5, 'F#': 6, 'GB': 6, 'G': 7, 'G#': 8,
    'AB': 8, 'A': 9, 'A#': 10, 'BB': 10, 'B': 11,
  };
  return map[name.toUpperCase()] ?? 0;
}

/** Format pitch as human-readable string */
export function formatPitch(pitch: NotePitch): string {
  return `${semitoneToName(pitch.semitone)}${pitch.octave}`;
}

/** Parse pitch from string like "C4" or "F#5" */
export function parsePitch(str: string): NotePitch {
  const match = str.match(/^([A-Ga-g][#b]?)(\d+)$/);
  if (!match) {
    return { semitone: 0, octave: 4 };
  }

  const [, note, octaveStr] = match;
  return {
    semitone: nameToSemitone(note ?? 'C'),
    octave: parseInt(octaveStr ?? '4', 10),
  };
}

/**
 * Normalize pitch range for a game.
 * Different games may have different playable ranges.
 */
export interface PitchRange {
  minOctave: number;
  maxOctave: number;
  minMidi: number;
  maxMidi: number;
}

export const PITCH_RANGES: Record<GameId, PitchRange> = {
  ff4: { minOctave: 0, maxOctave: 7, minMidi: 12, maxMidi: 107 },
  ff5: { minOctave: 0, maxOctave: 7, minMidi: 12, maxMidi: 107 },
  ff6: { minOctave: 0, maxOctave: 7, minMidi: 12, maxMidi: 107 },
  ffmq: { minOctave: 0, maxOctave: 7, minMidi: 12, maxMidi: 107 },
};

/** Check if pitch is within game's playable range */
export function isPitchInRange(pitch: NotePitch, game: GameId): boolean {
  const range = PITCH_RANGES[game];
  const midi = pitchToMidi(pitch);
  return midi >= range.minMidi && midi <= range.maxMidi;
}

/** Clamp pitch to game's playable range */
export function clampPitch(pitch: NotePitch, game: GameId): NotePitch {
  const range = PITCH_RANGES[game];
  let midi = pitchToMidi(pitch);

  if (midi < range.minMidi) {
    // Transpose up by octaves until in range
    while (midi < range.minMidi) midi += 12;
  } else if (midi > range.maxMidi) {
    // Transpose down by octaves until in range
    while (midi > range.maxMidi) midi -= 12;
  }

  return midiToPitch(midi);
}

/**
 * Compare two pitches for sorting
 */
export function comparePitch(a: NotePitch, b: NotePitch): number {
  return pitchToMidi(a) - pitchToMidi(b);
}

/**
 * Calculate interval between two pitches in semitones
 */
export function getInterval(from: NotePitch, to: NotePitch): number {
  return pitchToMidi(to) - pitchToMidi(from);
}
