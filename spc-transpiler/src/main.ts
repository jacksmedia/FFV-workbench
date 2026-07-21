/**
 * SPC-700 Cross-Game Transpiler
 * Main application entry point
 */

import { detectGame, type GameInfo } from '@services/game-detector';
import {
  transpileTracks,
  formatTranspileResult,
  downloadSequence,
  type FullTranspileResult,
} from '@services/transpiler-service';
import { getSequenceInfo } from '@services/parser-service';
import { getEncoder } from '@/transpiler/encoder-factory';
import type { GameId } from '@/types/ast';

interface SlotInfo {
  index: number;
  name: string;
  size: number;
}

interface AppState {
  rom: Uint8Array | null;
  gameInfo: GameInfo | null;
  selectedTracks: Set<number>;
  slotSizes: SlotInfo[] | null;
}

const state: AppState = {
  rom: null,
  gameInfo: null,
  selectedTracks: new Set(),
  slotSizes: null,
};

function showStatus(message: string, type: 'success' | 'error' = 'success'): void {
  const status = document.getElementById('status');
  if (!status) return;

  status.textContent = message;
  status.className = `status visible ${type}`;
}

function updateTrackList(): void {
  const trackList = document.getElementById('trackList');
  const workspace = document.getElementById('workspace');
  if (!trackList || !workspace || !state.gameInfo) return;

  workspace.style.display = 'block';
  trackList.innerHTML = '';

  state.gameInfo.trackNames.forEach((name, index) => {
    const item = document.createElement('div');
    item.style.cssText = 'display: flex; align-items: center; padding: 0.5rem; border-radius: 6px; margin-bottom: 0.25rem; cursor: pointer;';
    item.innerHTML = `
      <input type="checkbox" data-track="${index}" style="margin-right: 0.75rem; cursor: pointer;">
      <span style="color: var(--text-secondary); width: 3rem;">#${(index + 1).toString().padStart(2, '0')}</span>
      <span>${name}</span>
    `;
    item.addEventListener('click', (e) => {
      const checkbox = item.querySelector('input') as HTMLInputElement;
      if (e.target !== checkbox) checkbox.click();
    });
    item.querySelector('input')?.addEventListener('change', (e) => {
      const target = e.target as HTMLInputElement;
      const trackIdx = parseInt(target.dataset.track ?? '0', 10);
      if (target.checked) {
        state.selectedTracks.add(trackIdx);
      } else {
        state.selectedTracks.delete(trackIdx);
      }
    });
    trackList.appendChild(item);
  });
}

async function handleRomLoad(file: File): Promise<void> {
  try {
    const buffer = await file.arrayBuffer();
    state.rom = new Uint8Array(buffer);

    const gameInfo = detectGame(state.rom);
    if (!gameInfo) {
      showStatus('Unknown ROM format. Supported: FF4, FF5, FF6, FFMQ', 'error');
      return;
    }

    state.gameInfo = gameInfo;
    state.selectedTracks.clear();
    state.slotSizes = null;
    showStatus(`Detected: ${gameInfo.name} (${gameInfo.region.toUpperCase()}) - ${gameInfo.trackCount} tracks`);

    updateTrackList();
    console.log('Game detected:', gameInfo);
  } catch (err) {
    showStatus(`Error loading ROM: ${err instanceof Error ? err.message : 'Unknown error'}`, 'error');
  }
}

function initDropZone(): void {
  const dropZone = document.getElementById('dropZone');
  const fileInput = document.getElementById('romInput') as HTMLInputElement | null;

  if (!dropZone || !fileInput) return;

  dropZone.addEventListener('click', () => fileInput.click());

  dropZone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropZone.classList.add('dragover');
  });

  dropZone.addEventListener('dragleave', () => {
    dropZone.classList.remove('dragover');
  });

  dropZone.addEventListener('drop', (e) => {
    e.preventDefault();
    dropZone.classList.remove('dragover');

    const file = e.dataTransfer?.files[0];
    if (file) handleRomLoad(file);
  });

  fileInput.addEventListener('change', () => {
    const file = fileInput.files?.[0];
    if (file) handleRomLoad(file);
  });
}

/** Format bytes as a hex dump with offset column, 16 bytes per row */
function toHexDump(data: Uint8Array): string {
  const lines: string[] = [];
  for (let off = 0; off < data.length; off += 16) {
    const slice = data.subarray(off, Math.min(off + 16, data.length));
    const hex = [...slice].map(b => b.toString(16).toUpperCase().padStart(2, '0')).join(' ');
    lines.push(`${off.toString(16).toUpperCase().padStart(4, '0')}: ${hex}`);
  }
  return lines.join('\n');
}

/** Plain hex pairs (no offsets) for clipboard export into hex editors/scripts */
function toHexString(data: Uint8Array): string {
  return [...data].map(b => b.toString(16).toUpperCase().padStart(2, '0')).join(' ');
}

/**
 * Measure the original size of every sequence slot in the loaded ROM.
 * This is the "available space" if the transpiled data replaces a slot
 * in-place. Header reads only — cheap. Cached until the next ROM load.
 */
async function getSlotSizes(): Promise<SlotInfo[]> {
  if (state.slotSizes) return state.slotSizes;
  if (!state.rom || !state.gameInfo) return [];

  const slots: SlotInfo[] = [];
  for (let i = 0; i < state.gameInfo.trackCount; i++) {
    const info = await getSequenceInfo(state.rom, state.gameInfo, i);
    if (info) {
      slots.push({
        index: i,
        name: state.gameInfo.trackNames[i] ?? `Track ${i}`,
        size: info.length,
      });
    }
  }
  state.slotSizes = slots;
  return slots;
}

/** Build the fit bar + caption for outputSize vs availableSize */
function renderSizeRow(label: string, outputSize: number, availableSize: number): HTMLDivElement {
  const pct = availableSize > 0 ? (outputSize / availableSize) * 100 : 0;
  const fitClass = pct > 100 ? 'fit-over' : pct > 90 ? 'fit-tight' : 'fit-ok';
  const delta = availableSize - outputSize;
  const verdict = delta >= 0
    ? `fits, ${delta.toLocaleString()} bytes spare`
    : `OVERFLOWS by ${(-delta).toLocaleString()} bytes`;

  const row = document.createElement('div');
  row.className = 'size-row';

  const labelEl = document.createElement('label');
  labelEl.textContent = label;

  const bar = document.createElement('div');
  bar.className = 'size-bar';
  const fill = document.createElement('div');
  fill.className = `size-bar-fill ${fitClass}`;
  fill.style.width = `${Math.min(pct, 100)}%`;
  bar.appendChild(fill);

  const caption = document.createElement('span');
  caption.className = 'size-caption';
  caption.textContent = `${outputSize.toLocaleString()} / ${availableSize.toLocaleString()} bytes (${pct.toFixed(0)}%) — ${verdict}`;

  row.append(labelEl, bar, caption);
  return row;
}

/** Render one transpiled track as a result card with data, sizing, and export */
async function renderResultCard(
  container: HTMLElement,
  trackIndex: number,
  trackName: string,
  result: FullTranspileResult,
  targetGame: GameId
): Promise<void> {
  const card = document.createElement('div');
  card.className = 'result-card';

  const title = document.createElement('h4');
  title.textContent = `#${(trackIndex + 1).toString().padStart(2, '0')} ${trackName}`;
  card.appendChild(title);

  const meta = document.createElement('div');
  meta.className = 'result-meta';
  meta.textContent = `${result.stats.sourceGame.toUpperCase()} → ${targetGame.toUpperCase()} · `
    + `${result.stats.sourceChannels}/8 channels · ${result.stats.sourceEvents} events · `
    + `${result.stats.warningCount} warning(s)`;
  card.appendChild(meta);

  // Byte breakdown: header + each active channel
  const encoded = result.encoded;
  const breakdown = document.createElement('div');
  breakdown.className = 'byte-breakdown';
  const channelParts = encoded.tracks
    .filter(t => t.length > 0)
    .map(t => `ch${t.channelIndex}: ${t.length}`)
    .join('  ');
  breakdown.textContent = `header: ${encoded.header.length}  ${channelParts}  →  total: ${encoded.totalLength} bytes`;
  card.appendChild(breakdown);

  // Size vs available space at a target inject site.
  // Slot sizes are only measurable when the loaded ROM is the target game
  // (or shares its sequence format); otherwise fall back to the engine cap.
  const sameFormat = state.gameInfo && (
    state.gameInfo.id === targetGame ||
    (state.gameInfo.id === 'ffmq' && targetGame === 'ff5') ||
    (state.gameInfo.id === 'ff5' && targetGame === 'ffmq')
  );

  const sizeSection = document.createElement('div');
  card.appendChild(sizeSection);

  if (sameFormat) {
    const slots = await getSlotSizes();
    const defaultSlot = slots.find(s => s.index === trackIndex) ?? slots[0];

    const pickerRow = document.createElement('div');
    pickerRow.className = 'size-row';
    const pickerLabel = document.createElement('label');
    pickerLabel.textContent = 'Inject over slot:';
    const picker = document.createElement('select');
    picker.className = 'slot-select';
    for (const slot of slots) {
      const opt = document.createElement('option');
      opt.value = String(slot.index);
      opt.textContent = `#${(slot.index + 1).toString().padStart(2, '0')} ${slot.name} (${slot.size.toLocaleString()} bytes)`;
      if (defaultSlot && slot.index === defaultSlot.index) opt.selected = true;
      picker.appendChild(opt);
    }
    pickerRow.append(pickerLabel, picker);
    sizeSection.appendChild(pickerRow);

    const slotRowHolder = document.createElement('div');
    sizeSection.appendChild(slotRowHolder);

    const updateSlotRow = (): void => {
      const slot = slots.find(s => s.index === parseInt(picker.value, 10));
      slotRowHolder.innerHTML = '';
      if (slot) {
        slotRowHolder.appendChild(renderSizeRow('Slot space:', encoded.totalLength, slot.size));
      }
    };
    picker.addEventListener('change', updateSlotRow);
    updateSlotRow();
  } else {
    const note = document.createElement('div');
    note.className = 'result-meta';
    note.textContent = `Loaded ROM is ${state.gameInfo?.id.toUpperCase() ?? '?'}, target is ${targetGame.toUpperCase()} — `
      + `slot sizes in the target ROM can't be measured from here. Engine cap shown instead.`;
    sizeSection.appendChild(note);
  }

  const targetEncoder = await getEncoder(targetGame);
  sizeSection.appendChild(renderSizeRow('Engine cap:', encoded.totalLength, targetEncoder.getMaxSequenceSize()));

  // Export actions
  const actions = document.createElement('div');
  actions.className = 'card-actions';

  const dlBtn = document.createElement('button');
  dlBtn.className = 'btn-small';
  dlBtn.textContent = 'Download .bin';
  const safeName = trackName.replace(/[^\w-]+/g, '_').toLowerCase();
  dlBtn.addEventListener('click', () => {
    downloadSequence(encoded, `${result.stats.sourceGame}_${safeName}_to_${targetGame}.bin`);
  });

  const copyBtn = document.createElement('button');
  copyBtn.className = 'btn-small';
  copyBtn.textContent = 'Copy hex';
  copyBtn.addEventListener('click', async () => {
    await navigator.clipboard.writeText(toHexString(encoded.fullData));
    copyBtn.textContent = 'Copied!';
    setTimeout(() => { copyBtn.textContent = 'Copy hex'; }, 1500);
  });

  actions.append(dlBtn, copyBtn);
  card.appendChild(actions);

  // Hex dump of the full encoded sequence (header first, channels follow
  // at the offsets shown in the byte breakdown above)
  const details = document.createElement('details');
  const summary = document.createElement('summary');
  summary.textContent = `Bytecode hex dump (${encoded.totalLength.toLocaleString()} bytes — header at 0x0000, track data from 0x${encoded.header.length.toString(16).toUpperCase().padStart(4, '0')})`;
  const dump = document.createElement('pre');
  dump.className = 'hex-dump';
  dump.textContent = toHexDump(encoded.fullData);
  details.append(summary, dump);
  card.appendChild(details);

  container.appendChild(card);
}

function initTranspileButton(): void {
  const btn = document.getElementById('transpileBtn');
  const targetSelect = document.getElementById('targetGame') as HTMLSelectElement | null;
  const outputPanel = document.getElementById('outputPanel');
  const outputLog = document.getElementById('outputLog');
  const resultsContainer = document.getElementById('resultsContainer');

  btn?.addEventListener('click', async () => {
    if (!state.rom || !state.gameInfo) {
      showStatus('No ROM loaded', 'error');
      return;
    }

    if (state.selectedTracks.size === 0) {
      showStatus('Select at least one track to transpile', 'error');
      return;
    }

    const targetGame = targetSelect?.value as GameId ?? 'ff6';

    if (outputPanel && outputLog) {
      outputPanel.style.display = 'block';
      if (resultsContainer) resultsContainer.innerHTML = '';
      outputLog.textContent = `Transpiling ${state.selectedTracks.size} track(s) from ${state.gameInfo.id.toUpperCase()} to ${targetGame.toUpperCase()}...\n\n`;

      const selectedIndices = [...state.selectedTracks].sort((a, b) => a - b);

      try {
        const batchResult = await transpileTracks(
          state.rom,
          state.gameInfo,
          selectedIndices,
          targetGame,
          {},
          (current, total, name) => {
            outputLog.textContent += `[${current}/${total}] Processing: ${name}\n`;
          }
        );

        outputLog.textContent += `\n${'='.repeat(50)}\n`;
        outputLog.textContent += `Completed: ${batchResult.successCount} succeeded, ${batchResult.failCount} failed\n`;
        outputLog.textContent += `Total time: ${batchResult.totalTime.toFixed(0)}ms\n\n`;

        // Show results for each track: summary in the log, data in cards
        let firstCard = true;
        for (const [index, result] of batchResult.results) {
          const trackName = state.gameInfo?.trackNames[index] ?? `Track ${index}`;

          if (result.success && result.result) {
            outputLog.textContent += `\n${formatTranspileResult(result.result)}\n`;
            outputLog.textContent += `Parse: ${result.parseTime.toFixed(1)}ms, Transpile: ${result.transpileTime.toFixed(1)}ms, Encode: ${result.encodeTime.toFixed(1)}ms\n`;

            if (resultsContainer) {
              await renderResultCard(resultsContainer, index, trackName, result.result, targetGame);
              if (firstCard) {
                resultsContainer.querySelector('details')?.setAttribute('open', '');
                firstCard = false;
              }
            }
          } else {
            outputLog.textContent += `\n=== ${trackName} ===\n`;
            outputLog.textContent += `ERROR: ${result.error}\n`;
          }
        }

        // Show warning summary
        if (state.gameInfo.id === 'ff5' && targetGame === 'ff6') {
          outputLog.textContent += `\n${'='.repeat(50)}\n`;
          outputLog.textContent += `Note: FF5→FF6 transpilation quantizes triplet durations (3, 6, 12, 24, 48).\n`;
          outputLog.textContent += `Some timing may be slightly altered.\n`;
        }

        showStatus(`Transpiled ${batchResult.successCount}/${selectedIndices.length} tracks successfully`);

      } catch (err) {
        outputLog.textContent += `\nERROR: ${err instanceof Error ? err.message : 'Unknown error'}\n`;
        showStatus('Transpilation failed', 'error');
      }
    }
  });
}

function init(): void {
  console.log('SPC-700 Transpiler initializing...');
  initDropZone();
  initTranspileButton();
}

document.addEventListener('DOMContentLoaded', init);
