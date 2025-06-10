
program.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	13000000          	nop
   4:	37110000          	lui	sp,0x1
   8:	13010140          	addi	sp,sp,1024 # 0x1400
   c:	6f004000          	j	0x10
  10:	130101fd          	addi	sp,sp,-48
  14:	23268102          	sw	s0,44(sp)
  18:	13040103          	addi	s0,sp,48
  1c:	37260000          	lui	a2,0x2
  20:	2322c4fe          	sw	a2,-28(s0)
  24:	032644fe          	lw	a2,-28(s0)
  28:	9305f00f          	li	a1,255
  2c:	2320b600          	sw	a1,0(a2) # 0x2000
  30:	232604fe          	sw	zero,-20(s0)
  34:	6f008002          	j	0x5c
  38:	032644fe          	lw	a2,-28(s0)
  3c:	03260600          	lw	a2,0(a2)
  40:	93070600          	mv	a5,a2
  44:	13080000          	li	a6,0
  48:	232cf4fc          	sw	a5,-40(s0)
  4c:	232e04fd          	sw	a6,-36(s0)
  50:	0326c4fe          	lw	a2,-20(s0)
  54:	13061600          	addi	a2,a2,1
  58:	2326c4fe          	sw	a2,-20(s0)
  5c:	8325c4fe          	lw	a1,-20(s0)
  60:	37064000          	lui	a2,0x400
  64:	e3cac5fc          	blt	a1,a2,0x38
  68:	832584fd          	lw	a1,-40(s0)
  6c:	0326c4fd          	lw	a2,-36(s0)
  70:	13860500          	mv	a2,a1
  74:	9345f6ff          	not	a1,a2
  78:	032644fe          	lw	a2,-28(s0)
  7c:	2320b600          	sw	a1,0(a2) # 0x400000
  80:	232404fe          	sw	zero,-24(s0)
  84:	6f008002          	j	0xac
  88:	032644fe          	lw	a2,-28(s0)
  8c:	03260600          	lw	a2,0(a2)
  90:	93060600          	mv	a3,a2
  94:	13070000          	li	a4,0
  98:	232cd4fc          	sw	a3,-40(s0)
  9c:	232ee4fc          	sw	a4,-36(s0)
  a0:	032684fe          	lw	a2,-24(s0)
  a4:	13061600          	addi	a2,a2,1
  a8:	2324c4fe          	sw	a2,-24(s0)
  ac:	832584fe          	lw	a1,-24(s0)
  b0:	37064000          	lui	a2,0x400
  b4:	e3cac5fc          	blt	a1,a2,0x88
  b8:	6ff0dff6          	j	0x24
