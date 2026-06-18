"""Minimal 65816 linear disassembler for FFV doc-gap exploration.

Usage:
    python disasm65816.py <rom.sfc> <bank> <start> <end> [--m8] [--x8]

Outputs community-doc style lines:  C0/CD00: A9 00      LDA #$00
Tracks M/X width flags through SEP/REP (linear sweep; flags after PLP or
branch joins are guesses -- verify anything surprising in the emulator).
HiROM mapping: file offset = (bank-0xC0)*0x10000 + addr.
"""
import sys

# mode -> (operand byte count, formatter). -1 = depends on M flag, -2 = X flag.
M = {
 'imp':(0, lambda o,pc: ''),
 'acc':(0, lambda o,pc: 'A'),
 'imm_m':(-1, None), 'imm_x':(-2, None),
 'imm8':(1, lambda o,pc: f"#${o[0]:02X}"),
 'imm16':(2, lambda o,pc: f"#${o[1]:02X}{o[0]:02X}"),
 'dp':(1, lambda o,pc: f"${o[0]:02X}"),
 'dpx':(1, lambda o,pc: f"${o[0]:02X},X"),
 'dpy':(1, lambda o,pc: f"${o[0]:02X},Y"),
 'idp':(1, lambda o,pc: f"(${o[0]:02X})"),
 'idpx':(1, lambda o,pc: f"(${o[0]:02X},X)"),
 'idpy':(1, lambda o,pc: f"(${o[0]:02X}),Y"),
 'ildp':(1, lambda o,pc: f"[${o[0]:02X}]"),
 'ildpy':(1, lambda o,pc: f"[${o[0]:02X}],Y"),
 'sr':(1, lambda o,pc: f"${o[0]:02X},S"),
 'isry':(1, lambda o,pc: f"(${o[0]:02X},S),Y"),
 'abs':(2, lambda o,pc: f"${o[1]:02X}{o[0]:02X}"),
 'absx':(2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},X"),
 'absy':(2, lambda o,pc: f"${o[1]:02X}{o[0]:02X},Y"),
 'iabs':(2, lambda o,pc: f"(${o[1]:02X}{o[0]:02X})"),
 'iabsx':(2, lambda o,pc: f"(${o[1]:02X}{o[0]:02X},X)"),
 'iliabs':(2, lambda o,pc: f"[${o[1]:02X}{o[0]:02X}]"),
 'long':(3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X}"),
 'longx':(3, lambda o,pc: f"${o[2]:02X}{o[1]:02X}{o[0]:02X},X"),
 'rel':(1, lambda o,pc: f"${(pc + 2 + (o[0] - 256 if o[0] > 127 else o[0])) & 0xFFFF:04X}"),
 'rel16':(2, lambda o,pc: f"${(pc + 3 + ((o[1]<<8|o[0]) - 65536 if o[1] > 127 else (o[1]<<8|o[0]))) & 0xFFFF:04X}"),
 'mv':(2, lambda o,pc: f"${o[1]:02X},${o[0]:02X}"),
}

T = {}  # opcode -> (mnemonic, mode)
def fill(spec):
    for line in spec.strip().splitlines():
        op, mn, md = line.split()
        T[int(op, 16)] = (mn, md)

fill("""
00 BRK imm8
01 ORA idpx
02 COP imm8
03 ORA sr
04 TSB dp
05 ORA dp
06 ASL dp
07 ORA ildp
08 PHP imp
09 ORA imm_m
0A ASL acc
0B PHD imp
0C TSB abs
0D ORA abs
0E ASL abs
0F ORA long
10 BPL rel
11 ORA idpy
12 ORA idp
13 ORA isry
14 TRB dp
15 ORA dpx
16 ASL dpx
17 ORA ildpy
18 CLC imp
19 ORA absy
1A INC acc
1B TCS imp
1C TRB abs
1D ORA absx
1E ASL absx
1F ORA longx
20 JSR abs
21 AND idpx
22 JSL long
23 AND sr
24 BIT dp
25 AND dp
26 ROL dp
27 AND ildp
28 PLP imp
29 AND imm_m
2A ROL acc
2B PLD imp
2C BIT abs
2D AND abs
2E ROL abs
2F AND long
30 BMI rel
31 AND idpy
32 AND idp
33 AND isry
34 BIT dpx
35 AND dpx
36 ROL dpx
37 AND ildpy
38 SEC imp
39 AND absy
3A DEC acc
3B TSC imp
3C BIT absx
3D AND absx
3E ROL absx
3F AND longx
40 RTI imp
41 EOR idpx
42 WDM imm8
43 EOR sr
44 MVP mv
45 EOR dp
46 LSR dp
47 EOR ildp
48 PHA imp
49 EOR imm_m
4A LSR acc
4B PHK imp
4C JMP abs
4D EOR abs
4E LSR abs
4F EOR long
50 BVC rel
51 EOR idpy
52 EOR idp
53 EOR isry
54 MVN mv
55 EOR dpx
56 LSR dpx
57 EOR ildpy
58 CLI imp
59 EOR absy
5A PHY imp
5B TCD imp
5C JML long
5D EOR absx
5E LSR absx
5F EOR longx
60 RTS imp
61 ADC idpx
62 PER rel16
63 ADC sr
64 STZ dp
65 ADC dp
66 ROR dp
67 ADC ildp
68 PLA imp
69 ADC imm_m
6A ROR acc
6B RTL imp
6C JMP iabs
6D ADC abs
6E ROR abs
6F ADC long
70 BVS rel
71 ADC idpy
72 ADC idp
73 ADC isry
74 STZ dpx
75 ADC dpx
76 ROR dpx
77 ADC ildpy
78 SEI imp
79 ADC absy
7A PLY imp
7B TDC imp
7C JMP iabsx
7D ADC absx
7E ROR absx
7F ADC longx
80 BRA rel
81 STA idpx
82 BRL rel16
83 STA sr
84 STY dp
85 STA dp
86 STX dp
87 STA ildp
88 DEY imp
89 BIT imm_m
8A TXA imp
8B PHB imp
8C STY abs
8D STA abs
8E STX abs
8F STA long
90 BCC rel
91 STA idpy
92 STA idp
93 STA isry
94 STY dpx
95 STA dpx
96 STX dpy
97 STA ildpy
98 TYA imp
99 STA absy
9A TXS imp
9B TXY imp
9C STZ abs
9D STA absx
9E STZ absx
9F STA longx
A0 LDY imm_x
A1 LDA idpx
A2 LDX imm_x
A3 LDA sr
A4 LDY dp
A5 LDA dp
A6 LDX dp
A7 LDA ildp
A8 TAY imp
A9 LDA imm_m
AA TAX imp
AB PLB imp
AC LDY abs
AD LDA abs
AE LDX abs
AF LDA long
B0 BCS rel
B1 LDA idpy
B2 LDA idp
B3 LDA isry
B4 LDY dpx
B5 LDA dpx
B6 LDX dpy
B7 LDA ildpy
B8 CLV imp
B9 LDA absy
BA TSX imp
BB TYX imp
BC LDY absx
BD LDA absx
BE LDX absy
BF LDA longx
C0 CPY imm_x
C1 CMP idpx
C2 REP imm8
C3 CMP sr
C4 CPY dp
C5 CMP dp
C6 DEC dp
C7 CMP ildp
C8 INY imp
C9 CMP imm_m
CA DEX imp
CB WAI imp
CC CPY abs
CD CMP abs
CE DEC abs
CF CMP long
D0 BNE rel
D1 CMP idpy
D2 CMP idp
D3 CMP isry
D4 PEI dp
D5 CMP dpx
D6 DEC dpx
D7 CMP ildpy
D8 CLD imp
D9 CMP absy
DA PHX imp
DB STP imp
DC JML iliabs
DD CMP absx
DE DEC absx
DF CMP longx
E0 CPX imm_x
E1 SBC idpx
E2 SEP imm8
E3 SBC sr
E4 CPX dp
E5 SBC dp
E6 INC dp
E7 SBC ildp
E8 INX imp
E9 SBC imm_m
EA NOP imp
EB XBA imp
EC CPX abs
ED SBC abs
EE INC abs
EF SBC long
F0 BEQ rel
F1 SBC idpy
F2 SBC idp
F3 SBC isry
F4 PEA imm16
F5 SBC dpx
F6 INC dpx
F7 SBC ildpy
F8 SED imp
F9 SBC absy
FA PLX imp
FB XCE imp
FC JSR iabsx
FD SBC absx
FE INC absx
FF SBC longx
""")
assert len(T) == 256


def disasm(rom, bank, start, end, m8=True, x8=False, out=sys.stdout):
    off_base = (bank - 0xC0) * 0x10000
    pc = start
    m_flag, x_flag = m8, x8
    while pc < end:
        off = off_base + pc
        op = rom[off]
        mn, md = T[op]
        if md == 'imm_m':
            md = 'imm8' if m_flag else 'imm16'
        elif md == 'imm_x':
            md = 'imm8' if x_flag else 'imm16'
        nbytes, fmt = M[md]
        operands = rom[off + 1: off + 1 + nbytes]
        raw = ' '.join(f"{b:02X}" for b in rom[off:off + 1 + nbytes])
        text = f"{mn} {fmt(operands, pc)}".strip()
        out.write(f"{bank:02X}/{pc:04X}: {raw:<12} {text}\n")
        if op == 0xE2:  # SEP
            if operands[0] & 0x20: m_flag = True
            if operands[0] & 0x10: x_flag = True
        elif op == 0xC2:  # REP
            if operands[0] & 0x20: m_flag = False
            if operands[0] & 0x10: x_flag = False
        pc += 1 + nbytes


if __name__ == '__main__':
    path = sys.argv[1]
    bank = int(sys.argv[2], 16)
    start = int(sys.argv[3], 16)
    end = int(sys.argv[4], 16)
    m8 = '--m16' not in sys.argv
    x8 = '--x8' in sys.argv
    rom = open(path, 'rb').read()
    disasm(rom, bank, start, end, m8, x8)
