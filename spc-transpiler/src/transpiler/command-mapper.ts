/**
 * Command Mapper - Maps semantically equivalent commands between games
 *
 * Each game uses different opcodes for the same functions:
 * - FF5 Volume = D2, FF6 Volume = C4
 * - FF5 Vibrato = D7, FF6 Vibrato = C9
 *
 * This module handles the semantic mapping so transpilation works correctly.
 */

import type { GameId, SequenceNode } from '@/types/ast';

/** Semantic command categories */
export type CommandCategory =
  | 'volume' | 'volume_fade'
  | 'pan' | 'pan_fade'
  | 'pitch_slide' | 'vibrato' | 'vibrato_off'
  | 'tremolo' | 'tremolo_off'
  | 'auto_pan' | 'auto_pan_off'
  | 'octave' | 'octave_up' | 'octave_down'
  | 'transpose' | 'transpose_rel' | 'detune'
  | 'instrument'
  | 'attack' | 'decay' | 'sustain_level' | 'sustain_rate' | 'adsr_reset'
  | 'loop_start' | 'loop_end'
  | 'jump' | 'cond_jump' | 'cond_jump_2'
  | 'tempo' | 'tempo_fade'
  | 'music_volume' | 'music_volume_reset'
  | 'echo_on' | 'echo_off' | 'echo_volume' | 'echo_volume_fade'
  | 'echo_feedback' | 'echo_filter'
  | 'noise_on' | 'noise_off' | 'noise_clock'
  | 'pitch_mod_on' | 'pitch_mod_off'
  | 'slur_start' | 'slur_end' | 'legato_start' | 'legato_end'
  | 'duration_override'
  | 'end';

/** Command opcode mappings per game */
const OPCODE_MAP: Record<GameId, Partial<Record<CommandCategory, number>>> = {
  ff4: {
    // FF4 has a simpler command set
    volume: 0xDE, // Track volume (relative)
    octave: 0xDA,
    octave_up: 0xE1,
    octave_down: 0xE2,
    instrument: 0xDB,
    loop_start: 0xE0,
    loop_end: 0xF0,
    jump: 0xF4,
    tempo: 0xD2, // Fade in tempo
    end: 0xF1,
  },
  ff5: {
    volume: 0xD2,
    volume_fade: 0xD3,
    pan: 0xD4,
    pan_fade: 0xD5,
    pitch_slide: 0xD6,
    vibrato: 0xD7,
    vibrato_off: 0xD8,
    tremolo: 0xD9,
    tremolo_off: 0xDA,
    auto_pan: 0xDB,
    auto_pan_off: 0xDC,
    noise_clock: 0xDD,
    noise_on: 0xDE,
    noise_off: 0xDF,
    pitch_mod_on: 0xE0,
    pitch_mod_off: 0xE1,
    echo_on: 0xE2,
    echo_off: 0xE3,
    octave: 0xE4,
    octave_up: 0xE5,
    octave_down: 0xE6,
    transpose: 0xE7,
    transpose_rel: 0xE8,
    detune: 0xE9,
    instrument: 0xEA,
    attack: 0xEB,
    decay: 0xEC,
    sustain_level: 0xED,
    sustain_rate: 0xEE,
    adsr_reset: 0xEF,
    loop_start: 0xF0,
    loop_end: 0xF1,
    end: 0xF2,
    tempo: 0xF3,
    tempo_fade: 0xF4,
    echo_volume: 0xF5,
    echo_volume_fade: 0xF6,
    echo_feedback: 0xF7, // Also includes FIR filter
    music_volume: 0xF8,
    cond_jump: 0xF9,
    jump: 0xFA,
    cond_jump_2: 0xFB,
  },
  ff6: {
    volume: 0xC4,
    volume_fade: 0xC5,
    pan: 0xC6,
    pan_fade: 0xC7,
    pitch_slide: 0xC8,
    vibrato: 0xC9,
    vibrato_off: 0xCA,
    tremolo: 0xCB,
    tremolo_off: 0xCC,
    auto_pan: 0xCD,
    auto_pan_off: 0xCE,
    noise_clock: 0xCF,
    noise_on: 0xD0,
    noise_off: 0xD1,
    pitch_mod_on: 0xD2,
    pitch_mod_off: 0xD3,
    echo_on: 0xD4,
    echo_off: 0xD5,
    octave: 0xD6,
    octave_up: 0xD7,
    octave_down: 0xD8,
    transpose: 0xD9,
    transpose_rel: 0xDA,
    detune: 0xDB,
    instrument: 0xDC,
    attack: 0xDD,
    decay: 0xDE,
    sustain_level: 0xDF,
    sustain_rate: 0xE0,
    adsr_reset: 0xE1,
    loop_start: 0xE2,
    loop_end: 0xE3,
    slur_start: 0xE4,
    slur_end: 0xE5,
    legato_start: 0xE6,
    legato_end: 0xE7,
    duration_override: 0xE8,
    end: 0xEB,
    tempo: 0xF0,
    tempo_fade: 0xF1,
    echo_volume: 0xF2,
    echo_volume_fade: 0xF3,
    music_volume: 0xF4,
    cond_jump: 0xF5,
    jump: 0xF6,
    echo_feedback: 0xF7,
    echo_filter: 0xF8,
    music_volume_reset: 0xFB,
    cond_jump_2: 0xFC,
  },
  ffmq: {
    // FFMQ uses same opcodes as FF5 with minor differences
    volume: 0xD2,
    volume_fade: 0xD3,
    pan: 0xD4,
    pan_fade: 0xD5,
    pitch_slide: 0xD6,
    vibrato: 0xD7,
    vibrato_off: 0xD8,
    tremolo: 0xD9,
    tremolo_off: 0xDA,
    auto_pan: 0xDB,
    auto_pan_off: 0xDC,
    noise_clock: 0xDD,
    noise_on: 0xDE,
    noise_off: 0xDF,
    pitch_mod_on: 0xE0,
    pitch_mod_off: 0xE1,
    echo_on: 0xE2,
    echo_off: 0xE3,
    octave: 0xE4,
    octave_up: 0xE5,
    octave_down: 0xE6,
    transpose: 0xE7,
    transpose_rel: 0xE8,
    detune: 0xE9,
    instrument: 0xEA,
    attack: 0xEB,
    decay: 0xEC,
    sustain_level: 0xED,
    sustain_rate: 0xEE,
    adsr_reset: 0xEF,
    loop_start: 0xF0,
    loop_end: 0xF1,
    end: 0xF2,
    tempo: 0xF3,
    tempo_fade: 0xF4,
    echo_volume: 0xF5,
    echo_volume_fade: 0xF6,
    echo_feedback: 0xF7,
    music_volume: 0xF8,
    cond_jump: 0xF9,
    jump: 0xFA,
    cond_jump_2: 0xFB,
  },
};

/** Map AST node type to command category */
export function nodeTypeToCategory(nodeType: string): CommandCategory | null {
  const mapping: Record<string, CommandCategory> = {
    'volume': 'volume',
    'volume_fade': 'volume_fade',
    'pan': 'pan',
    'pan_fade': 'pan_fade',
    'pitch_slide': 'pitch_slide',
    'vibrato': 'vibrato',
    'vibrato_off': 'vibrato_off',
    'tremolo': 'tremolo',
    'tremolo_off': 'tremolo_off',
    'auto_pan': 'auto_pan',
    'auto_pan_off': 'auto_pan_off',
    'octave': 'octave',
    'octave_relative': 'octave_up', // Will check delta for up/down
    'transpose': 'transpose',
    'detune': 'detune',
    'instrument': 'instrument',
    'attack': 'attack',
    'decay': 'decay',
    'sustain_level': 'sustain_level',
    'sustain_rate': 'sustain_rate',
    'adsr_reset': 'adsr_reset',
    'loop_start': 'loop_start',
    'loop_end': 'loop_end',
    'jump': 'jump',
    'conditional_jump': 'cond_jump',
    'tempo': 'tempo',
    'tempo_fade': 'tempo_fade',
    'music_volume': 'music_volume',
    'echo_on': 'echo_on',
    'echo_off': 'echo_off',
    'echo_volume': 'echo_volume',
    'echo_feedback': 'echo_feedback',
    'echo_filter': 'echo_filter',
    'noise_on': 'noise_on',
    'noise_off': 'noise_off',
    'noise_clock': 'noise_clock',
    'pitch_mod_on': 'pitch_mod_on',
    'pitch_mod_off': 'pitch_mod_off',
    'slur_start': 'slur_start',
    'slur_end': 'slur_end',
    'legato_start': 'legato_start',
    'legato_end': 'legato_end',
    'duration_override': 'duration_override',
    'end': 'end',
  };

  return mapping[nodeType] ?? null;
}

/** Get opcode for a command category in target game */
export function getTargetOpcode(category: CommandCategory, targetGame: GameId): number | null {
  return OPCODE_MAP[targetGame]?.[category] ?? null;
}

/** Check if a command is supported in target game */
export function isCommandSupported(category: CommandCategory, targetGame: GameId): boolean {
  return OPCODE_MAP[targetGame]?.[category] !== undefined;
}

/** Get list of unsupported commands when transpiling to target */
export function getUnsupportedCommands(sourceGame: GameId, targetGame: GameId): CommandCategory[] {
  const sourceCommands = Object.keys(OPCODE_MAP[sourceGame] ?? {}) as CommandCategory[];
  const targetCommands = new Set(Object.keys(OPCODE_MAP[targetGame] ?? {}));

  return sourceCommands.filter(cmd => !targetCommands.has(cmd));
}

/** FF6-specific: Pan values need to be multiplied by 2 */
export function adjustPanForGame(pan: number, targetGame: GameId): number {
  if (targetGame === 'ff6') {
    // FF6 uses C6 xx where pan = xx * 2
    return Math.floor(pan / 2);
  }
  return pan;
}

/** Reverse pan adjustment when reading from FF6 */
export function adjustPanFromGame(pan: number, sourceGame: GameId): number {
  if (sourceGame === 'ff6') {
    return pan * 2;
  }
  return pan;
}

/**
 * Check if a command requires special handling during transpilation
 */
export interface TranspileWarning {
  type: 'unsupported' | 'lossy' | 'approximation';
  message: string;
  originalNode: SequenceNode;
}

export function checkTranspileCompatibility(
  node: SequenceNode,
  _sourceGame: GameId,
  targetGame: GameId
): TranspileWarning | null {
  // Notes, ties, rests are always compatible (handled by duration quantizer)
  if (node.type === 'note' || node.type === 'tie' || node.type === 'rest') {
    return null;
  }

  // Octave commands are always compatible
  if (node.type === 'octave' || node.type === 'octave_relative') {
    return null;
  }

  // End command is always compatible
  if (node.type === 'end') {
    return null;
  }

  const category = nodeTypeToCategory(node.type);

  if (!category) {
    // Unknown command type - warn but don't skip
    return {
      type: 'approximation',
      message: `Unknown node type: ${node.type}`,
      originalNode: node,
    };
  }

  if (!isCommandSupported(category, targetGame)) {
    // Check for possible approximations
    if (category === 'slur_start' || category === 'slur_end') {
      if (targetGame === 'ff5' || targetGame === 'ffmq') {
        return {
          type: 'approximation',
          message: 'Slur not supported in FF5/FFMQ - will be ignored',
          originalNode: node,
        };
      }
    }

    if (category === 'duration_override') {
      if (targetGame !== 'ff6') {
        return {
          type: 'approximation',
          message: 'Duration override not supported - note duration may differ',
          originalNode: node,
        };
      }
    }

    return {
      type: 'unsupported',
      message: `Command '${category}' not supported in ${targetGame.toUpperCase()}`,
      originalNode: node,
    };
  }

  return null;
}
