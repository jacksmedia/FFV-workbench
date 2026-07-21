/**
 * Transpiler module exports
 */

export { transpile, previewTranspile, type TranspileOptions, type TranspileResult, DEFAULT_OPTIONS } from './transpile';
export { getEncoder, getEncoderSync, preloadEncoders, getSupportedTargets, isEncodingSupported, getEncoderCapabilities, type GameEncoder, type EncodedTrack, type EncodedSequence, type EncoderCapabilities } from './encoder-factory';
export { quantizeDuration, analyzeQuantization, splitDuration, isExactDuration, isTriplet, getDurationName, formatQuantizationWarning, DURATION_GRIDS, TICKS_PER_WHOLE, type QuantizeResult, type QuantizationReport } from './duration-quantizer';
export { nodeTypeToCategory, getTargetOpcode, isCommandSupported, getUnsupportedCommands, adjustPanForGame, adjustPanFromGame, checkTranspileCompatibility, type CommandCategory, type TranspileWarning } from './command-mapper';
export { pitchToMidi, midiToPitch, transposePitch, formatPitch, parsePitch, clampPitch, isPitchInRange, comparePitch, getInterval, PITCH_RANGES, type PitchRange } from './pitch-normalizer';
