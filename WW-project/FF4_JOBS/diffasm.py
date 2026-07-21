"""Disassemble a range in base and hacked ROM and print a unified diff."""
import sys, io, difflib
sys.path.insert(0, r"WW-project\FF4_JOBS")
from disasm_lorom import disasm

BASE = r"ff4 (v1.1) [crc32=23084FCD].sfc"
HACK = r"WW-project\FF4_JOBS\FF4_JOB_SYSTEM_1.5\FF4_JOB_SYSTEM_1.5.sfc"

bank = int(sys.argv[1], 16)
start = int(sys.argv[2], 16)
end = int(sys.argv[3], 16)
m8 = '--m16' not in sys.argv
x8 = '--x8' in sys.argv

def run(path):
    rom = open(path, 'rb').read()
    buf = io.StringIO()
    disasm(rom, bank, start, end, m8, x8, out=buf)
    return buf.getvalue().splitlines()

a, b = run(BASE), run(HACK)
if a == b:
    print(f"identical over {bank:02X}/{start:04X}-{end:04X}")
else:
    print("\n".join(difflib.unified_diff(a, b, "base", "hack", lineterm="", n=3)))
