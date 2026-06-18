"""
Final focused analysis.

Key findings so far:
1. Event 347: The first $C8 is at file offset 0x0907A0, bytes C8 F3 50
   - If 2-byte LE: dialog ID = 0x50F3 = 20723 (very high - suspicious)
   - The dialog pointed to starts: 8B 7C 07 5D... which decodes as 'rc[CTRL]...'
   - This matches the garbled "rcrffnit" output if control bytes are misread

2. Event 440: The first $C8 is at file offset 0x09135E, bytes C8 70 70
   - Dialog ID = 0x7070 = 28784 (very high - suspicious)
   - The dialog starts: 89 41 80 FC... decodes as 'pg[CTRL]...'
   - This matches garbled "pg<Krile>pAll ttKP<Bartz>iOr!h Y"

KEY INSIGHT: The dialog IDs ARE the problem. Dialog IDs 20723 and 28784 are
pointing to WRONG data. But let me check: are these dialog IDs actually valid
for the RPGe hack? The pointer table at 0x2013F0 stores 3-byte SNES pointers.

Dialog text lives in bank $E1 (0xE10000+). Let's count max dialogs:
- If dialog text starts at 0xE10000 and the pointer table is at 0xE013F0,
  then the pointer table itself is in bank $E0 (0xE013F0 & 0x3FFFFF = 0x2013F0)
- The number of pointers can be estimated

Actually wait - the dialog pointer for dialog 20723 was:
  ptr bytes = 7B 8E 8D -> SNES = 0x8D8E7B -> file = 0x0D8E7B
That's in bank 0x8D, not 0xE1! Bank 0x8D file offset 0x0D8E7B is in the
ROM's code/data area, not dialog area. This IS wrong.

For dialog 28784:
  ptr bytes = 88 82 8C -> SNES = 0x8C8288 -> file = 0x0C8288
Bank 0x8C - also wrong!

So the dialog IDs are WILDLY wrong. Either:
a) $C8 doesn't take a 2-byte dialog ID (maybe it's 1-byte)
b) The $C8 found isn't actually the dialog command at those offsets
c) The bytes at those positions are being misread

Let me look at this differently. The user says event 347 AT $C90781 shows
"rcrffnit". Let me check if $C9 0781 is actually a SNES address where
0x09 is the file-offset bank and the dialog command is literally at the
very first bytes.
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

# The second $C8 in event 347 uses dialog 896 (0x0380)
# Let's look at that one
did = 896
ptr_off = POINTER_TABLE_FILE_OFFSET + did * 3
b0, b1, b2 = rom[ptr_off], rom[ptr_off+1], rom[ptr_off+2]
snes_p = b0 | (b1 << 8) | (b2 << 16)
file_p = snes_p & 0x3FFFFF
raw = rom[file_p:file_p+30]
txt = ''.join(ENC.get(b, f'[{b:02X}]') for b in raw)
print(f"Dialog 896: ptr={b0:02X}{b1:02X}{b2:02X} SNES=0x{snes_p:06X} file=0x{file_p:06X}")
print(f"  Raw: {' '.join(f'{b:02X}' for b in raw)}")
print(f"  Text: {txt}")

# Now - the user says "Dialog text from event 347 at $C90781 shows rcrffnit"
# $C90781: SNES bank $C9, addr $0781.
# file_offset = $C90781 & 0x3FFFFF = $090781
# So the event script IS at 0x090781.
# The garbled text "rcrffnit" - let me try to find what dialog would produce this.
# r=0x8B, c=0x7C, r=0x8B, f=0x7F, f=0x7F, n=0x87, i=0x82, t=0x8D

# Search for this pattern in dialog area (bank E1, file 0x210000+)
target = bytes([0x8B, 0x7C, 0x8B, 0x7F, 0x7F, 0x87, 0x82, 0x8D])
# But the output is "rcrffnit" -> maybe with spaces between?
# Or maybe it's: r,c,r,f,f,n,i,t

# Actually the garbled output "rcrffnit" has 8 chars but let me check
# what the raw bytes at the found location actually decode to:
# 8B 7C 07 5D 5D 5D 8B 7F D1 7F 87 5F 95 5F CB 5D 00 D7 5F 0D 7A 16 7F B8 9F DA 9F FC 9F 1E
# r  c  ?  ?  ?  ?  r  f  ?  f  n  ?  it ?  ?  ?  \0 ?  ?  ?  a  ?  f  ?  )  ?  )  ?  )  ?
# The visible chars are: r, c, r, f, f, n, it (digraph), a, f, )
# Hmm this almost spells "rcrffn it af)"...

# WAIT! Look at the expected garbled text again: "rcrffnit"
# The dialog bytes DO contain: 8B=r, 7C=c, [controls], 8B=r, 7F=f, [control], 7F=f, 87=n, [control], 95=it
# So if control codes are SKIPPED/IGNORED, you get: r, c, r, f, f, n, it = "rcrffnit" !!!
# This matches exactly! The issue is that some control bytes are being
# passed through the character decoder instead of being handled as controls.

print("\n=== DIAGNOSIS ===")
print()
print("Dialog 20723 (event 347) raw bytes:")
raw347 = bytes([0x8B, 0x7C, 0x07, 0x5D, 0x5D, 0x5D, 0x8B, 0x7F, 0xD1, 0x7F, 0x87, 0x5F, 0x95, 0x5F, 0xCB, 0x5D, 0x00, 0xD7, 0x5F, 0x0D, 0x7A, 0x16, 0x7F, 0xB8, 0x9F, 0xDA, 0x9F, 0xFC, 0x9F, 0x1E])
print(' '.join(f'{b:02X}' for b in raw347))
print()
print("If control codes are skipped/ignored, visible chars are:")
visible = []
for b in raw347:
    if b in ENC:
        visible.append(ENC[b])
print(''.join(visible))
print()
print("This matches the reported garbled text 'rcrffnit' (first 8 chars)")

print()
print("Dialog 28784 (event 440) raw bytes:")
raw440 = bytes([0x89, 0x41, 0x80, 0xFC, 0x06, 0x89, 0x60, 0x85, 0x85, 0xFF, 0xCE, 0x47, 0x31, 0x33, 0xB0, 0x6A, 0x6F, 0x02, 0xB3, 0x82, 0x6E, 0x30, 0x1F, 0xA7, 0x8B, 0x33, 0x27, 0xA1, 0x41, 0x81])
print(' '.join(f'{b:02X}' for b in raw440))
print()
visible2 = []
for b in raw440:
    if b in ENC:
        visible2.append(ENC[b])
print('If control codes skipped, visible chars: ' + ''.join(visible2))
print("Expected garbled: 'pg<Krile>pAll ttKP<Bartz>iOr!h Y'")
print("Note: <Krile> and <Bartz> are probably name-substitution control codes")
print()

# Now let me figure out what the control codes SHOULD be doing.
# Key control codes seen:
# 0x07 - in dialog 20723 at position 2 - could be a formatting/window code
# 0x5D - appears multiple times - NOT in the chars table (digits go $53-$5C, so $5D is out of range)
# 0xD1 - unknown control
# 0x5F - unknown
# 0xCB - unknown
# 0x00 - null/end?
# These look like they might be a DIFFERENT encoding/format altogether.

# Let me check if dialog 20723 at file 0x0D8E7B makes any sense as
# event script data vs dialog text
print("=== IS dialog 20723 pointing to correct location? ===")
print(f"SNES 0x8D8E7B -> file 0x0D8E7B")
print(f"Bank 0x8D is a ROM bank. Dialog text should be in bank 0xE1+")
print(f"This pointer is WRONG - it points to ROM code/data, not dialog text!")
print()

# Now let's understand the actual number of valid dialogs
# by finding where the pointer table ends (when pointer stops being in bank E1-EF)
print("=== Finding valid dialog count ===")
# Scan forward from pointer table to find last valid dialog
last_valid = 0
for did in range(0, 30000):
    ptr_off2 = POINTER_TABLE_FILE_OFFSET + did * 3
    if ptr_off2 + 3 > len(rom):
        break
    b0, b1, b2 = rom[ptr_off2], rom[ptr_off2+1], rom[ptr_off2+2]
    snes_p2 = b0 | (b1 << 8) | (b2 << 16)
    bank = snes_p2 >> 16
    if bank < 0xE0 or bank > 0xEF:
        if did > 0:
            print(f"  Dialog {did}: ptr={b0:02X}{b1:02X}{b2:02X} SNES=0x{snes_p2:06X} bank=0x{bank:02X} - INVALID (first invalid)")
            print(f"  Last valid dialog ID: {did-1}")
            # Show last few valid ones
            for check in range(max(0, did-5), did):
                coff = POINTER_TABLE_FILE_OFFSET + check * 3
                cb0, cb1, cb2 = rom[coff], rom[coff+1], rom[coff+2]
                csnes = cb0 | (cb1 << 8) | (cb2 << 16)
                print(f"    Dialog {check}: SNES=0x{csnes:06X}")
            break
    last_valid = did

print()
print("=== Checking what's at dialog IDs found: 20723 and 28784 ===")
print(f"Max valid dialog ID is around {last_valid}")
print(f"Dialog ID 20723 (0x50F3) >> max valid -> WRONG pointer interpretation")
print(f"Dialog ID 28784 (0x7070) >> max valid -> WRONG pointer interpretation")

print()
print("=== CONCLUSION ===")
print("The $C8 opcode at event 347 (file 0x0907A0) bytes: C8 F3 50")
print("  If $C8 takes a 1-BYTE dialog ID: dialog_id = 0xF3 = 243")
ptr_off243 = POINTER_TABLE_FILE_OFFSET + 243 * 3
b0, b1, b2 = rom[ptr_off243], rom[ptr_off243+1], rom[ptr_off243+2]
snes243 = b0 | (b1 << 8) | (b2 << 16)
file243 = snes243 & 0x3FFFFF
raw243 = rom[file243:file243+20]
txt243 = ''.join(ENC.get(b, f'[{b:02X}]') for b in raw243)
print(f"  Dialog 243: SNES=0x{snes243:06X} file=0x{file243:06X}")
print(f"  Raw: {' '.join(f'{b:02X}' for b in raw243)}")
print(f"  Text: {txt243}")
print()

# Also try dialog 0x50F3 is nonsense, but what about treating C8 as
# "dialog = next byte" and "50" is a parameter (wait/auto-close)?
# OR what if C8 takes a 2-byte ID but in BIG-ENDIAN? 0xF3 * 256 + 0x50 -> no, too big
# OR what if C8 takes dialog_id in a different format?

# Let's check what actual valid events would show for their dialog commands.
# Let's look at the dialog_dump file to cross-reference
print()
print("=== Checking second C8 in event 347 (dialog 896) ===")
ptr_off896 = POINTER_TABLE_FILE_OFFSET + 896 * 3
b0, b1, b2 = rom[ptr_off896], rom[ptr_off896+1], rom[ptr_off896+2]
snes896 = b0 | (b1 << 8) | (b2 << 16)
file896 = snes896 & 0x3FFFFF
raw896 = rom[file896:file896+30]
txt896 = ''.join(ENC.get(b, f'[{b:02X}]') for b in raw896)
print(f"Dialog 896: SNES=0x{snes896:06X} file=0x{file896:06X} bank=0x{snes896>>16:02X}")
print(f"  Raw: {' '.join(f'{b:02X}' for b in raw896)}")
print(f"  Text: {txt896}")
