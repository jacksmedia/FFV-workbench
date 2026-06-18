"""
Now I know:
- Event 347 ($C90781) is 39 bytes long and the event_names file labels it "rcrffnit"
- The next event (348) starts at $C907A8 = file 0x0907A8
- So event 347 spans file offsets 0x090781 to 0x0907A7 (39 bytes = 0x27 bytes)

The first $C8 found was at file offset 0x0907A0 which is within event 347!
  - 0x0907A0 - 0x090781 = 31 bytes into the event
  - Event is 39 bytes total, so $C8 at +31 is at byte 31 of the 39-byte event

The dialog_dump shows dialog 347 = "Merchant: See, just like I said."
But the event script "rcrffnit" is what's being output as dialog from event 347.

The event_names entry says event 347 = "rcrffnit" (39 bytes)
Meaning: the event script ITSELF produces "rcrffnit" dialog output.

The $C8 at byte 31 of event 347 (file 0x0907A0) has bytes C8 F3 50.
  - If 2-byte LE: dialog_id = 0x50F3 = 20723 -> WRONG (beyond valid range of 2159)
  - If 1-byte: dialog_id = 0xF3 = 243 -> valid, leads to "Lenna: This is Zokk..."

But the dialog_dump says dialog 347 = "Merchant: See, just like I said."
which seems like a reasonable dialog for event 347 context.

HYPOTHESIS: Maybe the $C8 opcode takes dialog_id as a 2-BYTE value,
but the bytes C8 F3 50 don't decode to 0x50F3.
What if the dialog ID encoding is: (F3 is low byte, 50 is a flag/mode byte)?
And the actual dialog ID = F3 = 243? No, that gives "Lenna: This is Zokk..."

Let me try: maybe the dialog_id byte in $C8 command is stored differently.
What if C8 stores dialog_id as the low byte only, and 0x50 is something else?
Then dialog 0xF3 = 243. But what does dialog 243 say?

OR: What if the bytes after C8 are F3 50 meaning SOMETHING ELSE entirely,
and the actual dialog ID is stored elsewhere?

Let me look at the full 39 bytes of event 347 more carefully and check
what OTHER events use the same pattern to understand the dialog command.

Also: the second C8 in event 347 is at file 0x0907D4 which is AFTER 0x0907A7
(the event ends at 0x0907A7). So the second C8 is NOT in event 347 at all.

So event 347 has EXACTLY ONE C8 command: at file 0x0907A0, bytes C8 F3 50.
"""

ROM_PATH = r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc"
POINTER_TABLE_FILE_OFFSET = 0xE013F0 & 0x3FFFFF  # 0x2013F0

with open(ROM_PATH, 'rb') as f:
    rom = f.read()

ENC = {}
for i in range(10): ENC[0x53+i] = str(i)
for i in range(26): ENC[0x60+i] = chr(ord('A')+i)
for i in range(26): ENC[0x7A+i] = chr(ord('a')+i)
ENC[0x94] = 'il'; ENC[0x95] = 'it'; ENC[0x97] = 'li'; ENC[0x98] = 'll'
ENC[0xA4] = 'ti'; ENC[0xA5] = 'fi'; ENC[0xAC] = 'if'; ENC[0xAD] = 'It'
ENC[0xAE] = 'tl'; ENC[0xAF] = 'ir'; ENC[0xB0] = 'tt'
ENC[0xFF] = ' '; ENC[0x96] = ' '; ENC[0x99] = "'"; ENC[0x9B] = ':'
ENC[0x9D] = ','; ENC[0x9E] = '('; ENC[0x9F] = ')'; ENC[0xA0] = '/'
ENC[0xA1] = '!'; ENC[0xA2] = '?'; ENC[0xA3] = '.'; ENC[0xC5] = '-'
ENC[0xC7] = '...'; ENC[0xCF] = ':'; ENC[0xE2] = '+'

# Print full event 347 (39 bytes)
event347_start = 0x090781
event347_len = 39
print("=== Event 347 full bytes (39 bytes, file 0x090781-0x0907A7) ===")
e347 = rom[event347_start:event347_start+event347_len]
for i in range(0, len(e347), 16):
    chunk = e347[i:i+16]
    hex_str = ' '.join(f'{b:02X}' for b in chunk)
    print(f"  {event347_start+i:06X}: {hex_str}")

# The C8 is at position 31 (0x0907A0):
# bytes at 0x0907A0: C8 F3 50
# and the event ends at 0x0907A7 (inclusive byte 38)
# After C8 F3 50 (positions 31,32,33), positions 34-38:
print(f"\n  Byte 31 (0x{event347_start+31:06X}): 0x{e347[31]:02X} (C8=dialog)")
print(f"  Byte 32 (0x{event347_start+32:06X}): 0x{e347[32]:02X}")
print(f"  Byte 33 (0x{event347_start+33:06X}): 0x{e347[33]:02X}")
print(f"  Remaining bytes 34-38: {' '.join(f'{e347[i]:02X}' for i in range(34,39))}")

# NOW: Let's look at what dialog text "Merchant: See, just like I said."
# corresponds to. Search for it.
target_text = [0x66, 0x7E, 0x8B, 0x7C, 0x81, 0x7A, 0x87, 0x8D]  # "Merchan"
# M=0x66, e=0x7E, r=0x8B, c=0x7C, h=0x81, a=0x7A, n=0x87, t=0x8D

print("\n=== Searching for 'Merchant' in dialog area ===")
# Search from file 0x210000 (bank E1) through end of ROM
search_start = 0x210000
target = bytes(target_text)
pos = search_start
found_positions = []
while pos < len(rom) - len(target):
    idx = rom.index(target, pos) if target in rom[pos:] else -1
    if idx == -1:
        break
    found_positions.append(idx)
    pos = idx + 1
    if len(found_positions) >= 10:
        break

print(f"Found 'Merchant' pattern at file offsets:")
for fp in found_positions:
    # What dialog ID would this be?
    # Dialog pointers at POINTER_TABLE_FILE_OFFSET, each 3 bytes
    # We need to find which dialog pointer points near this offset
    snes_addr = (fp & 0x0FFFFF) | 0xE00000  # guess bank
    # The actual bank can be computed from file offset
    # File offset to SNES: for hi-rom, bank = (file_off >> 15) | 0x80... complicated
    # Let's just search the pointer table for this file offset

    raw_ctx = rom[fp:fp+20]
    txt = ''.join(ENC.get(b, f'[{b:02X}]') for b in raw_ctx)
    print(f"  File 0x{fp:06X}: {' '.join(f'{b:02X}' for b in raw_ctx)}")
    print(f"              '{txt}'")

# Search pointer table for entries pointing to these positions
print("\n=== Finding dialog IDs for found positions ===")
for fp in found_positions:
    # The SNES address for file offset fp in a HiROM game
    # For a no-header HiROM: SNES_addr = file_off | 0x800000...
    # But we know dialogs are in bank E1-E3 (SNES 0xE10000-0xE3FFFF)
    # file_off = snes_addr & 0x3FFFFF
    # snes_addr = file_off | (bank << 16) but we need to know the bank
    # The bank byte is the high byte of the 3-byte pointer in the table
    # Let's just scan the pointer table for any entry where
    # (ptr & 0x3FFFFF) == fp
    for did in range(2160):
        poff = POINTER_TABLE_FILE_OFFSET + did * 3
        b0, b1, b2 = rom[poff], rom[poff+1], rom[poff+2]
        snes_p = b0 | (b1 << 8) | (b2 << 16)
        file_p = snes_p & 0x3FFFFF
        if file_p == fp:
            print(f"  File 0x{fp:06X} = Dialog ID {did} (SNES 0x{snes_p:06X})")
            break

# Also: look at event 350 which the event_names shows has Bartz/Galuf dialog
print("\n=== Event 350 (the one with 'Bartz: What the...!? Galuf: Th') ===")
# event 350 is at $C907C7 = file 0x0907C7, 40 bytes
e350_start = 0x0907C7
e350_len = 40
e350 = rom[e350_start:e350_start+e350_len]
for i in range(0, len(e350), 16):
    chunk = e350[i:i+16]
    hex_str = ' '.join(f'{b:02X}' for b in chunk)
    print(f"  {e350_start+i:06X}: {hex_str}")

# Find C8 in event 350
print(f"\nLooking for $C8 in event 350:")
for i, b in enumerate(e350):
    if b == 0xC8:
        d_id = e350[i+1] | (e350[i+2] << 8)
        print(f"  C8 at +{i}: bytes {e350[i]:02X} {e350[i+1]:02X} {e350[i+2]:02X} -> dialog_id={d_id}")
        # Look up this dialog
        poff = POINTER_TABLE_FILE_OFFSET + d_id * 3
        b0, b1, b2 = rom[poff], rom[poff+1], rom[poff+2]
        snes_p = b0 | (b1 << 8) | (b2 << 16)
        file_p = snes_p & 0x3FFFFF
        raw = rom[file_p:file_p+30]
        txt = ''.join(ENC.get(b2, f'[{b2:02X}]') for b2 in raw)
        print(f"  Dialog {d_id}: SNES=0x{snes_p:06X} file=0x{file_p:06X} bank=0x{snes_p>>16:02X}")
        print(f"  Raw: {' '.join(f'{b2:02X}' for b2 in raw)}")
        print(f"  Text: '{txt}'")

# Check event 440 full bytes
print("\n=== Event 440 full scan ===")
# Event 440 is 92 bytes at file 0x09130E
e440_start = 0x09130E
e440_len = 92
e440 = rom[e440_start:e440_start+e440_len]
for i in range(0, len(e440), 16):
    chunk = e440[i:i+16]
    hex_str = ' '.join(f'{b:02X}' for b in chunk)
    print(f"  {e440_start+i:06X}: {hex_str}")

print("\nLooking for ALL $C8 in event 440 (92 bytes):")
for i, b in enumerate(e440):
    if b == 0xC8:
        d_id = e440[i+1] | (e440[i+2] << 8)
        print(f"  C8 at +{i} (file 0x{e440_start+i:06X}): bytes {e440[i]:02X} {e440[i+1]:02X} {e440[i+2]:02X} -> dialog_id={d_id} (0x{d_id:04X})")
        if d_id <= 2159:
            poff = POINTER_TABLE_FILE_OFFSET + d_id * 3
            b0, b1, b2 = rom[poff], rom[poff+1], rom[poff+2]
            snes_p = b0 | (b1 << 8) | (b2 << 16)
            file_p = snes_p & 0x3FFFFF
            raw = rom[file_p:file_p+20]
            txt = ''.join(ENC.get(b3, f'[{b3:02X}]') for b3 in raw)
            print(f"    -> Dialog {d_id}: '{txt}'")
        else:
            print(f"    -> INVALID dialog ID (> 2159)")
