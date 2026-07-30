;ff5-equipment icon wrapping by cubear. 2024-09-30
hirom

!iconwrapcode = $FAF250

org $C2D828
jsl wrapicon ;sta $0000,y
			;iny



org !iconwrapcode
wrapicon:
cpy #$52BC
beq alter1
cpy #$533C
beq alter2
writeicon:
sta $0000,y	;native code
iny			;/
rtl

alter1:
ldy #$532E ;to add more icons, change to #$5326
bra writeicon
alter2:
ldy #$53AE ;to add more icons, change to #$53A6
bra writeicon

