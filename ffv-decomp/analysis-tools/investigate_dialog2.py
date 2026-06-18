"""
Deeper investigation of dialog commands in events 347 and 440.

The problem: the first $C8 found in event 347 is at offset +31, but the
user said the dialog text is at $C90781 (event_offset 0x090781). That means
the dialog command should be RIGHT AT or near the very start.

Let me re-examine: the user says "Dialog text from event 347 at $C90781" -
this might mean the EVENT SCRIPT starts at $C90781, not that the dialog command
is at $C90781.

Let me also look more carefully at what opcodes are present and which ones
are dialog commands. In FFV event scripting, $C8 takes a 2-byte dialog ID.
But I need to verify the opcode structure - maybe $F3 is a different command.

Also let me check if dialog IDs 20723 and 28784 are sane. With 3-byte
pointers at $E013F0, let's count how many dialogs there are by checking
the ROM space available.
"""

ROM_PATH = r"C:\Users\J4cks\Desktop\work5\crawler\_FFV RPGe (CRC32 = 17444605).sfc"

POINTER_TABLE_FILE_OFFSET = 0xE013F0 & 0x3FFFFF  # 0x2013F0

with open(ROM_PATH, 'rb') as f:
    rom = f.read()

print(f"ROM size: {len(rom):,} bytes")
print(f"Pointer table at file offset: 0x{POINTER_TABLE_FILE_OFFSET:06X}")

# How many dialogs can fit? Let's find the end of the pointer table
# by looking at what's after it.
# Each pointer is 3 bytes. Let's check the first few and last few pointers
# to understand the range.

print("\n--- First 10 dialog pointers ---")
for i in range(10):
    off = POINTER_TABLE_FILE_OFFSET + i * 3
    b0, b1, b2 = rom[off], rom[off+1], rom[off+2]
    snes_ptr = b0 | (b1 << 8) | (b2 << 16)
    file_off = snes_ptr & 0x3FFFFF
    print(f"  Dialog {i:4d}: ptr bytes={b0:02X} {b1:02X} {b2:02X}  SNES=0x{snes_ptr:06X}  file=0x{file_off:06X}")

print("\n--- Checking what SNES bank the dialog pointers reference ---")
# Dialog text in FFV RPGe is typically in bank $E0-$EF or similar
# Let's check dialog 0
off = POINTER_TABLE_FILE_OFFSET
b0, b1, b2 = rom[off], rom[off+1], rom[off+2]
snes0 = b0 | (b1 << 8) | (b2 << 16)
print(f"Dialog 0 SNES: 0x{snes0:06X} -> bank 0x{snes0 >> 16:02X}")

# For event 347, let's look at ALL bytes around 0x090781 carefully
print("\n--- Event 347: Full scan of first 256 bytes ---")
event347 = 0x090781
search = rom[event347:event347+256]
print("Looking for ALL $C8 and $F0 opcodes:")
for i, b in enumerate(search):
    if b in (0xC8, 0xF0):
        d_id = search[i+1] | (search[i+2] << 8)
        print(f"  offset +{i:3d} (file 0x{event347+i:06X}): opcode=0x{b:02X}  next2={search[i+1]:02X} {search[i+2]:02X}  => dialog_id={d_id} (0x{d_id:04X})")

print("\n--- Event 440: Full scan of first 256 bytes ---")
event440 = 0x09130E
search2 = rom[event440:event440+256]
print("Looking for ALL $C8 and $F0 opcodes:")
for i, b in enumerate(search2):
    if b in (0xC8, 0xF0):
        d_id = search2[i+1] | (search2[i+2] << 8)
        print(f"  offset +{i:3d} (file 0x{event440+i:06X}): opcode=0x{b:02X}  next2={search2[i+1]:02X} {search2[i+2]:02X}  => dialog_id={d_id} (0x{d_id:04X})")

# Now let's check what the CORRECT dialog IDs would be if the garbled text
# "rcrffnit" maps to something sensible.
# The encoding table: $7A-$93 = a-z  (a=0x7A, b=0x7B, c=0x7C, ...)
# r = 0x7A + 17 = 0x8B
# c = 0x7A + 2  = 0x7C
# f = 0x7A + 5  = 0x7F
# n = 0x7A + 13 = 0x87
# i = 0x7A + 8  = 0x82
# t = 0x7A + 19 = 0x8D

# But the raw bytes for dialog 20723 start: 8B 7C 07 5D 5D 5D ...
# 0x8B = r, 0x7C = c, 0x07 = ??? (not in table), 0x5D = 0-9 offset: 0x53+j -> 0x5D = 0x53+10 = out of range
# Wait: $53-$5C = 0-9, so 0x5D is beyond that range - it's NOT a digit

# Let me re-examine: maybe this is a compressed/encoded format and
# bytes < certain values are control codes, not printable text

print("\n--- Analyzing dialog 20723 bytes against encoding table ---")
raw = bytes([0x8B, 0x7C, 0x07, 0x5D, 0x5D, 0x5D, 0x8B, 0x7F, 0xD1, 0x7F, 0x87, 0x5F, 0x95, 0x5F, 0xCB, 0x5D, 0x00, 0xD7, 0x5F, 0x0D, 0x7A, 0x16, 0x7F, 0xB8, 0x9F, 0xDA, 0x9F, 0xFC, 0x9F, 0x1E])
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

print(f"Encoding of dialog 20723 bytes:")
result = []
for b in raw:
    if b in ENC:
        result.append(f"0x{b:02X}='{ENC[b]}'")
    else:
        result.append(f"0x{b:02X}=CTRL")
print("  " + " ".join(result))

print("\n--- Analyzing dialog 28784 bytes against encoding table ---")
raw2 = bytes([0x89, 0x41, 0x80, 0xFC, 0x06, 0x89, 0x60, 0x85, 0x85, 0xFF, 0xCE, 0x47, 0x31, 0x33, 0xB0, 0x6A, 0x6F, 0x02, 0xB3, 0x82, 0x6E, 0x30, 0x1F, 0xA7, 0x8B, 0x33, 0x27, 0xA1, 0x41, 0x81])
print(f"Encoding of dialog 28784 bytes:")
result2 = []
for b in raw2:
    if b in ENC:
        result2.append(f"0x{b:02X}='{ENC[b]}'")
    else:
        result2.append(f"0x{b:02X}=CTRL")
print("  " + " ".join(result2))

# Suspicious: dialog IDs 20723 and 28784 are very high.
# Let me check if maybe the $C8 opcode takes only 1 byte for dialog ID,
# OR the bytes right after $C8 are dialog_id as a single byte.
# OR maybe in FFV, $C8 xx is 1-byte dialog ID and xx is something else.

print("\n--- Checking if $C8 is 1-byte or 2-byte dialog ID ---")
# Event 347: C8 at offset +31 from 0x090781
# The bytes are: C8 F3 50
# If dialog_id = F3 (1 byte) = 243, then next byte 50 would be something else
# If dialog_id = 50F3 (2 byte LE) = 20723, that seems too high

# Let's check dialog 243 pointer
off243 = POINTER_TABLE_FILE_OFFSET + 243 * 3
b0, b1, b2 = rom[off243], rom[off243+1], rom[off243+2]
snes243 = b0 | (b1 << 8) | (b2 << 16)
file243 = snes243 & 0x3FFFFF
raw243 = rom[file243:file243+30]
print(f"Dialog 243: ptr={b0:02X} {b1:02X} {b2:02X}  SNES=0x{snes243:06X}  file=0x{file243:06X}")
print(f"  Raw: {' '.join(f'{b:02X}' for b in raw243)}")
txt243 = ''.join(ENC.get(b, f'[{b:02X}]') for b in raw243)
print(f"  Text: {txt243}")

# Also check: maybe event commands use format $C8 <lo> <hi> where dialog id = lo | (hi<<8)
# but with bank byte in hi meaning something. Let's try treating 0xF3 as the lo byte
# of a 2-byte ID but with different byte order.

# Let's also check what follows the C8 command in event 347 more carefully
print("\n--- Bytes around C8 in event 347 (offset +28 to +38) ---")
e347 = rom[0x090781:0x090781+256]
for i in range(28, 42):
    print(f"  +{i:3d} (0x{0x090781+i:06X}): 0x{e347[i]:02X}")

print("\n--- Also check if maybe $C8 is NOT the dialog opcode ---")
print("Looking at the known garbled text 'rcrffnit' to reverse-engineer dialog ID:")
# 'r'=0x8B, 'c'=0x7C, 'r'=0x8B, 'f'=0x7F, 'f'=0x7F, 'n'=0x87, 'i'=0x82, 't'=0x8D
# First byte of actual dialog text should be 0x8B
# If we search for this pattern in dialog text area, we can find the right dialog

# Let's look at what dialog IDs near low numbers look like
print("\n--- Sample of dialogs 0-20 first bytes ---")
for did in range(21):
    ptr_off = POINTER_TABLE_FILE_OFFSET + did * 3
    b0, b1, b2 = rom[ptr_off], rom[ptr_off+1], rom[ptr_off+2]
    snes_p = b0 | (b1 << 8) | (b2 << 16)
    file_p = snes_p & 0x3FFFFF
    first8 = rom[file_p:file_p+8]
    txt = ''.join(ENC.get(b, f'[{b:02X}]') for b in first8)
    print(f"  Dialog {did:3d}: SNES=0x{snes_p:06X} file=0x{file_p:06X}  [{' '.join(f'{b:02X}' for b in first8)}]  '{txt}'")
