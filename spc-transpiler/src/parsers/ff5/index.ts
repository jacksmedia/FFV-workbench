/**
 * FF5 Parser Module
 * Exports all FF5-specific parsing functionality
 */

// Track index (pointer table)
export {
  readTrackPointers,
  getTrackPointer,
  FF5_TRACK_COUNT,
  POINTER_SIZE,
  type TrackPointer,
} from './track-index';

// Header parser
export {
  parseSequenceHeader,
  spcToRomOffset,
  isChannelActive,
  getActiveChannelCount,
  getChannelEndOffset,
  FF5_HEADER_SIZE,
  FF5_CHANNEL_COUNT,
  type SequenceHeader,
} from './header-parser';

// Note decoder
export {
  decodeNote,
  isNote,
  isTie,
  isRest,
  isNoteType,
  getDurationInfo,
  getSemitoneName,
  type NoteDecodeResult,
} from './note-decoder';

// Command decoder
export {
  decodeCommand,
  isEndCommand,
  type CommandDecodeResult,
} from './command-decoder';

// Track parser
export {
  parseTrack,
  getTrackStats,
  getUsedInstruments,
  hasLoops,
  getFirstNotePitch,
  type TrackStats,
} from './track-parser';

// Sequence parser (full song)
export {
  parseSequence,
  parseSequences,
  getSequenceInfo,
  dumpAllSequenceInfo,
  validateSequence,
  type SequenceInfo,
  type ValidationResult,
} from './sequence-parser';
