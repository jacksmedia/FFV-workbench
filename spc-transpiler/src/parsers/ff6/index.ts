/**
 * FF6 Parser Module
 * Exports all FF6-specific parsing functionality
 */

export {
  parseSequence,
  parseSequences,
  getSequenceInfo,
  validateSequence,
  type SequenceInfo,
  type ValidationResult,
} from './sequence-parser';

export {
  parseTrack,
  getTrackStats,
  getUsedInstruments,
  type TrackStats,
} from './track-parser';

export {
  decodeNote,
  isNote,
  isTie,
  isRest,
  isNoteType,
  type NoteDecodeResult,
} from './note-decoder';

export {
  decodeCommand,
  isEndCommand,
  type CommandDecodeResult,
} from './command-decoder';
