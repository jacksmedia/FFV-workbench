/**
 * Intermediate MML-like AST for cross-game representation
 * Normalizes note/command data so transpilation becomes AST → target encoding
 */

export type GameId = 'ff4' | 'ff5' | 'ff6' | 'ffmq';

export type Region = 'jp' | 'us' | 'eu';

/** Normalized note pitch (0-11 = C-B, octave separate) */
export interface NotePitch {
  semitone: number; // 0-11 (C=0, C#=1, ..., B=11)
  octave: number;   // 0-7 typically
}

/** Duration in ticks (normalized to 192 ticks per whole note) */
export type Ticks = number;

/** Base AST node with source location for debugging */
export interface AstNode {
  type: string;
  sourceOffset: number; // ROM offset for debugging
  sourceByte: number;   // Original byte value
}

/** Note-on event */
export interface NoteNode extends AstNode {
  type: 'note';
  pitch: NotePitch;
  duration: Ticks;
}

/** Tie (extend previous note) */
export interface TieNode extends AstNode {
  type: 'tie';
  duration: Ticks;
}

/** Rest (silence) */
export interface RestNode extends AstNode {
  type: 'rest';
  duration: Ticks;
}

/** Volume setting (0-127) */
export interface VolumeNode extends AstNode {
  type: 'volume';
  value: number;
}

/** Volume fade over time */
export interface VolumeFadeNode extends AstNode {
  type: 'volume_fade';
  duration: Ticks;
  targetValue: number;
}

/** Pan setting (0=left, 128=center, 255=right) */
export interface PanNode extends AstNode {
  type: 'pan';
  value: number;
}

/** Pan fade over time */
export interface PanFadeNode extends AstNode {
  type: 'pan_fade';
  duration: Ticks;
  targetValue: number;
}

/** Vibrato settings */
export interface VibratoNode extends AstNode {
  type: 'vibrato';
  delay: Ticks;
  period: number;  // cycle time
  depth: number;   // amplitude
  waveform: number; // upper 2 bits of original byte
}

/** Vibrato off */
export interface VibratoOffNode extends AstNode {
  type: 'vibrato_off';
}

/** Tremolo settings */
export interface TremoloNode extends AstNode {
  type: 'tremolo';
  delay: Ticks;
  period: number;
  depth: number;
  waveform: number;
}

/** Tremolo off */
export interface TremoloOffNode extends AstNode {
  type: 'tremolo_off';
}

/** Auto-pan (stereo sweep) */
export interface AutoPanNode extends AstNode {
  type: 'auto_pan';
  period: number;
  depth: number;
  direction: 'left_first' | 'right_first';
}

/** Auto-pan off */
export interface AutoPanOffNode extends AstNode {
  type: 'auto_pan_off';
}

/** Pitch slide (portamento) */
export interface PitchSlideNode extends AstNode {
  type: 'pitch_slide';
  duration: Ticks;
  semitones: number; // signed
}

/** Octave setting */
export interface OctaveNode extends AstNode {
  type: 'octave';
  value: number;
}

/** Octave up/down relative */
export interface OctaveRelativeNode extends AstNode {
  type: 'octave_relative';
  delta: number; // +1 or -1
}

/** Key transpose */
export interface TransposeNode extends AstNode {
  type: 'transpose';
  semitones: number; // signed
}

/** Relative key transpose */
export interface TransposeRelativeNode extends AstNode {
  type: 'transpose_rel';
  delta: number; // signed
}

/** Detune (fine pitch adjustment) */
export interface DetuneNode extends AstNode {
  type: 'detune';
  value: number; // signed
}

/** Instrument/waveform selection */
export interface InstrumentNode extends AstNode {
  type: 'instrument';
  index: number;
}

/** ADSR Attack rate */
export interface AttackNode extends AstNode {
  type: 'attack';
  rate: number; // 0-15
}

/** ADSR Decay rate */
export interface DecayNode extends AstNode {
  type: 'decay';
  rate: number; // 0-7
}

/** ADSR Sustain level */
export interface SustainLevelNode extends AstNode {
  type: 'sustain_level';
  level: number; // 0-7
}

/** ADSR Sustain rate */
export interface SustainRateNode extends AstNode {
  type: 'sustain_rate';
  rate: number; // 0-31
}

/** ADSR reset to instrument default */
export interface AdsrResetNode extends AstNode {
  type: 'adsr_reset';
}

/** Loop start marker */
export interface LoopStartNode extends AstNode {
  type: 'loop_start';
  count: number; // 0 or 255 = infinite
}

/** Loop end marker */
export interface LoopEndNode extends AstNode {
  type: 'loop_end';
}

/** Unconditional jump */
export interface JumpNode extends AstNode {
  type: 'jump';
  targetOffset: number;
}

/** Conditional jump (nth iteration) */
export interface ConditionalJumpNode extends AstNode {
  type: 'conditional_jump';
  iteration: number;
  targetOffset: number;
}

/** Tempo setting */
export interface TempoNode extends AstNode {
  type: 'tempo';
  value: number; // raw value, interpretation varies by game
}

/** Tempo fade */
export interface TempoFadeNode extends AstNode {
  type: 'tempo_fade';
  duration: Ticks;
  targetValue: number;
}

/** Global music volume */
export interface MusicVolumeNode extends AstNode {
  type: 'music_volume';
  value: number;
}

/** Music volume reset (FF6) */
export interface MusicVolumeResetNode extends AstNode {
  type: 'music_volume_reset';
}

/** Echo on for this channel */
export interface EchoOnNode extends AstNode {
  type: 'echo_on';
}

/** Echo off for this channel */
export interface EchoOffNode extends AstNode {
  type: 'echo_off';
}

/** Echo volume setting */
export interface EchoVolumeNode extends AstNode {
  type: 'echo_volume';
  left: number;
  right: number;
}

/** Echo volume fade */
export interface EchoVolumeFadeNode extends AstNode {
  type: 'echo_volume_fade';
  duration: Ticks;
  leftTarget: number;
  rightTarget: number;
}

/** Echo feedback setting */
export interface EchoFeedbackNode extends AstNode {
  type: 'echo_feedback';
  value: number;
  /** FIR filter index — FF5's F7 command carries both feedback and filter */
  filterIndex?: number;
}

/** FIR filter selection */
export interface EchoFilterNode extends AstNode {
  type: 'echo_filter';
  index: number; // 0-3 typically
}

/** Noise mode on */
export interface NoiseOnNode extends AstNode {
  type: 'noise_on';
}

/** Noise mode off */
export interface NoiseOffNode extends AstNode {
  type: 'noise_off';
}

/** Noise clock frequency */
export interface NoiseClockNode extends AstNode {
  type: 'noise_clock';
  value: number; // 0-31
}

/** Pitch modulation on */
export interface PitchModOnNode extends AstNode {
  type: 'pitch_mod_on';
}

/** Pitch modulation off */
export interface PitchModOffNode extends AstNode {
  type: 'pitch_mod_off';
}

/** Slur start (legato without re-attack) */
export interface SlurStartNode extends AstNode {
  type: 'slur_start';
}

/** Slur end */
export interface SlurEndNode extends AstNode {
  type: 'slur_end';
}

/** Legato start */
export interface LegatoStartNode extends AstNode {
  type: 'legato_start';
}

/** Legato end */
export interface LegatoEndNode extends AstNode {
  type: 'legato_end';
}

/** Custom duration for next note only (FF6) */
export interface DurationOverrideNode extends AstNode {
  type: 'duration_override';
  ticks: Ticks;
}

/** Track end marker */
export interface EndNode extends AstNode {
  type: 'end';
}

/** Unknown/unsupported command (preserve for round-trip) */
export interface UnknownNode extends AstNode {
  type: 'unknown';
  bytes: number[];
}

/** Union of all AST node types */
export type SequenceNode =
  | NoteNode | TieNode | RestNode
  | VolumeNode | VolumeFadeNode
  | PanNode | PanFadeNode
  | VibratoNode | VibratoOffNode
  | TremoloNode | TremoloOffNode
  | AutoPanNode | AutoPanOffNode
  | PitchSlideNode
  | OctaveNode | OctaveRelativeNode
  | TransposeNode | TransposeRelativeNode | DetuneNode
  | InstrumentNode
  | AttackNode | DecayNode | SustainLevelNode | SustainRateNode | AdsrResetNode
  | LoopStartNode | LoopEndNode
  | JumpNode | ConditionalJumpNode
  | TempoNode | TempoFadeNode | MusicVolumeNode | MusicVolumeResetNode
  | EchoOnNode | EchoOffNode | EchoVolumeNode | EchoVolumeFadeNode | EchoFeedbackNode | EchoFilterNode
  | NoiseOnNode | NoiseOffNode | NoiseClockNode
  | PitchModOnNode | PitchModOffNode
  | SlurStartNode | SlurEndNode | LegatoStartNode | LegatoEndNode
  | DurationOverrideNode
  | EndNode | UnknownNode;

/** A single channel/track in a sequence */
export interface TrackAst {
  channelIndex: number;
  nodes: SequenceNode[];
}

/** Full parsed sequence (song) */
export interface SequenceAst {
  sourceGame: GameId;
  songIndex: number;
  songName?: string;
  tracks: TrackAst[];
  headerBytes: number[]; // Original header for reference
  instrumentSet: number[]; // Instrument indices used
}
