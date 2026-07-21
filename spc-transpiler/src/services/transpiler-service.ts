/**
 * Transpiler Service
 *
 * High-level API for the full transpilation pipeline:
 * ROM → Parse → AST → Transpile → Encode → Bytecode
 */

import type { GameId, SequenceAst } from '@/types/ast';
import type { GameInfo } from '@/types/rom';
import { parseSequence, countSequenceEvents } from './parser-service';
import { transpile, previewTranspile, type TranspileOptions } from '@/transpiler';
import { getEncoder, type EncodedSequence } from '@/transpiler/encoder-factory';
import type { TranspileWarning, QuantizationReport } from '@/transpiler';

export interface FullTranspileResult {
  sourceAst: SequenceAst;
  transpiledAst: SequenceAst;
  encoded: EncodedSequence;
  warnings: TranspileWarning[];
  quantization: QuantizationReport;
  stats: {
    sourceGame: GameId;
    targetGame: GameId;
    sourceName: string;
    sourceChannels: number;
    sourceEvents: number;
    bytesOriginal: number;
    bytesTranspiled: number;
    warningCount: number;
  };
}

export interface TranspileJobResult {
  success: boolean;
  result?: FullTranspileResult;
  error?: string;
  parseTime: number;
  transpileTime: number;
  encodeTime: number;
}

/**
 * Full transpilation pipeline for a single track
 */
export async function transpileTrack(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number,
  targetGame: GameId,
  options?: Partial<TranspileOptions>
): Promise<TranspileJobResult> {
  const startParse = performance.now();

  // Step 1: Parse
  const parseResult = parseSequence(rom, gameInfo, songIndex);
  const parseTime = performance.now() - startParse;

  if (!parseResult.success || !parseResult.ast) {
    return {
      success: false,
      error: parseResult.error ?? 'Parse failed',
      parseTime,
      transpileTime: 0,
      encodeTime: 0,
    };
  }

  const sourceAst = parseResult.ast;
  const startTranspile = performance.now();

  // Step 2: Transpile
  const transpileResult = transpile(sourceAst, {
    targetGame,
    ...options,
  });
  const transpileTime = performance.now() - startTranspile;

  const startEncode = performance.now();

  // Step 3: Encode
  const encoder = await getEncoder(targetGame);
  const encoded = encoder.encodeSequence(transpileResult.ast);
  const encodeTime = performance.now() - startEncode;

  // Gather stats
  const sourceCounts = countSequenceEvents(sourceAst);
  const activeChannels = sourceAst.tracks.filter(t => t.nodes.length > 0).length;

  return {
    success: true,
    result: {
      sourceAst,
      transpiledAst: transpileResult.ast,
      encoded,
      warnings: transpileResult.warnings,
      quantization: transpileResult.quantization,
      stats: {
        sourceGame: gameInfo.id,
        targetGame,
        sourceName: sourceAst.songName ?? `Track ${songIndex}`,
        sourceChannels: activeChannels,
        sourceEvents: sourceCounts.total,
        bytesOriginal: sourceAst.headerBytes.length,
        bytesTranspiled: encoded.totalLength,
        warningCount: transpileResult.warnings.length,
      },
    },
    parseTime,
    transpileTime,
    encodeTime,
  };
}

/**
 * Preview transpilation (check warnings without encoding)
 */
export function previewTrackTranspile(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndex: number,
  targetGame: GameId
): { warnings: TranspileWarning[]; quantization: QuantizationReport } | null {
  const parseResult = parseSequence(rom, gameInfo, songIndex);
  if (!parseResult.success || !parseResult.ast) {
    return null;
  }

  return previewTranspile(parseResult.ast, targetGame);
}

/**
 * Batch transpile multiple tracks
 */
export async function transpileTracks(
  rom: Uint8Array,
  gameInfo: GameInfo,
  songIndices: number[],
  targetGame: GameId,
  options?: Partial<TranspileOptions>,
  onProgress?: (current: number, total: number, name: string) => void
): Promise<{
  results: Map<number, TranspileJobResult>;
  successCount: number;
  failCount: number;
  totalTime: number;
}> {
  const results = new Map<number, TranspileJobResult>();
  let successCount = 0;
  let failCount = 0;
  const startTime = performance.now();

  for (let i = 0; i < songIndices.length; i++) {
    const index = songIndices[i]!;
    const trackName = gameInfo.trackNames[index] ?? `Track ${index}`;

    onProgress?.(i + 1, songIndices.length, trackName);

    const result = await transpileTrack(rom, gameInfo, index, targetGame, options);
    results.set(index, result);

    if (result.success) {
      successCount++;
    } else {
      failCount++;
    }
  }

  return {
    results,
    successCount,
    failCount,
    totalTime: performance.now() - startTime,
  };
}

/**
 * Format transpile result for display
 */
export function formatTranspileResult(result: FullTranspileResult): string {
  const lines: string[] = [
    `=== ${result.stats.sourceName} ===`,
    `${result.stats.sourceGame.toUpperCase()} → ${result.stats.targetGame.toUpperCase()}`,
    ``,
  ];

  // Warning for FF4 target (limited command support)
  if (result.stats.targetGame === 'ff4') {
    lines.push(`⚠ FF4 has fewer commands - some effects will be skipped`);
    lines.push(``);
  }

  lines.push(`Channels: ${result.stats.sourceChannels}/8`);
  lines.push(`Events: ${result.stats.sourceEvents}`);
  lines.push(`Output size: ${result.stats.bytesTranspiled} bytes`);
  lines.push(``);

  // Quantization info
  if (result.quantization.quantizedCount > 0) {
    lines.push(`Quantization:`);
    lines.push(`  - Exact: ${result.quantization.exactCount}`);
    lines.push(`  - Quantized: ${result.quantization.quantizedCount}`);
    lines.push(`  - Total error: ${result.quantization.totalErrorPercent.toFixed(2)}%`);
    if (result.quantization.worstError) {
      lines.push(`  - Worst: ${result.quantization.worstError.original} → ${result.quantization.worstError.quantized} ticks`);
    }
    lines.push(``);
  }

  // Warnings
  if (result.warnings.length > 0) {
    lines.push(`Warnings (${result.warnings.length}):`);
    const grouped = groupWarnings(result.warnings);
    for (const [type, count] of grouped) {
      lines.push(`  - ${type}: ${count}`);
    }
  } else {
    lines.push(`No warnings - clean transpilation!`);
  }

  return lines.join('\n');
}

function groupWarnings(warnings: TranspileWarning[]): Map<string, number> {
  const counts = new Map<string, number>();
  for (const w of warnings) {
    const key = w.type;
    counts.set(key, (counts.get(key) ?? 0) + 1);
  }
  return counts;
}

/**
 * Export transpiled sequence as downloadable blob
 */
export function exportAsBlob(encoded: EncodedSequence): Blob {
  // Create a copy as regular Uint8Array to satisfy BlobPart type
  const data = new Uint8Array(encoded.fullData);
  return new Blob([data], { type: 'application/octet-stream' });
}

/**
 * Trigger browser download of transpiled sequence
 */
export function downloadSequence(encoded: EncodedSequence, filename: string): void {
  const blob = exportAsBlob(encoded);
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  URL.revokeObjectURL(url);
}
