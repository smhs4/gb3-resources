	.file	"morse_blink.c"
	.option nopic
# GNU C17 (GCC) version 8.2.0 (riscv32-elf)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I ../include -imultilib rv32i/ilp32
# -iprefix /f-of-e-tools/tools/sunflower/sunflower-toolchain/tools/riscv/bin/../lib/gcc/riscv32-elf/8.2.0/
# -D M32 morse_blink.c -march=rv32i -mabi=ilp32 -O0 -Wall -fverbose-asm
# options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
# -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
# -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
# -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcommon
# -fdelete-null-pointer-checks -fearly-inlining
# -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
# -fplt -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fssa-backprop -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -fverbose-asm
# -fzero-initialized-in-bss -mexplicit-relocs -mplt -mstrict-align

	.text
	.globl	gDebugLedsMemoryMappedRegister
	.section	.sdata,"aw"
	.align	2
	.type	gDebugLedsMemoryMappedRegister, @object
	.size	gDebugLedsMemoryMappedRegister, 4
gDebugLedsMemoryMappedRegister:
	.word	8192
	.text
	.align	2
	.globl	blinkDot
	.type	blinkDot, @function
blinkDot:
	addi	sp,sp,-32	#,,
	sw	s0,28(sp)	#,
	addi	s0,sp,32	#,,
# morse_blink.c:19:     *gDebugLedsMemoryMappedRegister = 0xFF;
	lui	a5,%hi(gDebugLedsMemoryMappedRegister)	# tmp74,
	lw	a5,%lo(gDebugLedsMemoryMappedRegister)(a5)		# gDebugLedsMemoryMappedRegister.0_1, gDebugLedsMemoryMappedRegister
# morse_blink.c:19:     *gDebugLedsMemoryMappedRegister = 0xFF;
	li	a4,255		# tmp75,
	sw	a4,0(a5)	# tmp75, *gDebugLedsMemoryMappedRegister.0_1
# morse_blink.c:20:     for (int j = 0; j < kDotDelay; j++)
	sw	zero,-20(s0)	#, j
# morse_blink.c:20:     for (int j = 0; j < kDotDelay; j++)
	j	.L2		#
.L3:
# morse_blink.c:20:     for (int j = 0; j < kDotDelay; j++)
	lw	a5,-20(s0)		# tmp77, j
	addi	a5,a5,1	#, tmp76, tmp77
	sw	a5,-20(s0)	# tmp76, j
.L2:
# morse_blink.c:20:     for (int j = 0; j < kDotDelay; j++)
	lw	a4,-20(s0)		# tmp78, j
	li	a5,200704		# tmp80,
	addi	a5,a5,-705	#, tmp79, tmp80
	ble	a4,a5,.L3	#, tmp78, tmp79,
# morse_blink.c:22:     *gDebugLedsMemoryMappedRegister = 0x00;
	lui	a5,%hi(gDebugLedsMemoryMappedRegister)	# tmp81,
	lw	a5,%lo(gDebugLedsMemoryMappedRegister)(a5)		# gDebugLedsMemoryMappedRegister.1_2, gDebugLedsMemoryMappedRegister
# morse_blink.c:22:     *gDebugLedsMemoryMappedRegister = 0x00;
	sw	zero,0(a5)	#, *gDebugLedsMemoryMappedRegister.1_2
# morse_blink.c:23:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	sw	zero,-24(s0)	#, j
# morse_blink.c:23:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	j	.L4		#
.L5:
# morse_blink.c:23:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	lw	a5,-24(s0)		# tmp83, j
	addi	a5,a5,1	#, tmp82, tmp83
	sw	a5,-24(s0)	# tmp82, j
.L4:
# morse_blink.c:23:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	lw	a4,-24(s0)		# tmp84, j
	li	a5,200704		# tmp86,
	addi	a5,a5,-705	#, tmp85, tmp86
	ble	a4,a5,.L5	#, tmp84, tmp85,
# morse_blink.c:25: }
	nop	
	lw	s0,28(sp)		#,
	addi	sp,sp,32	#,,
	jr	ra		#
	.size	blinkDot, .-blinkDot
	.align	2
	.globl	blinkDash
	.type	blinkDash, @function
blinkDash:
	addi	sp,sp,-32	#,,
	sw	s0,28(sp)	#,
	addi	s0,sp,32	#,,
# morse_blink.c:30:     *gDebugLedsMemoryMappedRegister = 0xFF;
	lui	a5,%hi(gDebugLedsMemoryMappedRegister)	# tmp74,
	lw	a5,%lo(gDebugLedsMemoryMappedRegister)(a5)		# gDebugLedsMemoryMappedRegister.2_1, gDebugLedsMemoryMappedRegister
# morse_blink.c:30:     *gDebugLedsMemoryMappedRegister = 0xFF;
	li	a4,255		# tmp75,
	sw	a4,0(a5)	# tmp75, *gDebugLedsMemoryMappedRegister.2_1
# morse_blink.c:31:     for (int j = 0; j < kDashDelay; j++)
	sw	zero,-20(s0)	#, j
# morse_blink.c:31:     for (int j = 0; j < kDashDelay; j++)
	j	.L7		#
.L8:
# morse_blink.c:31:     for (int j = 0; j < kDashDelay; j++)
	lw	a5,-20(s0)		# tmp77, j
	addi	a5,a5,1	#, tmp76, tmp77
	sw	a5,-20(s0)	# tmp76, j
.L7:
# morse_blink.c:31:     for (int j = 0; j < kDashDelay; j++)
	lw	a4,-20(s0)		# tmp78, j
	li	a5,1798144		# tmp80,
	addi	a5,a5,1855	#, tmp79, tmp80
	ble	a4,a5,.L8	#, tmp78, tmp79,
# morse_blink.c:33:     *gDebugLedsMemoryMappedRegister = 0x00;
	lui	a5,%hi(gDebugLedsMemoryMappedRegister)	# tmp81,
	lw	a5,%lo(gDebugLedsMemoryMappedRegister)(a5)		# gDebugLedsMemoryMappedRegister.3_2, gDebugLedsMemoryMappedRegister
# morse_blink.c:33:     *gDebugLedsMemoryMappedRegister = 0x00;
	sw	zero,0(a5)	#, *gDebugLedsMemoryMappedRegister.3_2
# morse_blink.c:34:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	sw	zero,-24(s0)	#, j
# morse_blink.c:34:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	j	.L9		#
.L10:
# morse_blink.c:34:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	lw	a5,-24(s0)		# tmp83, j
	addi	a5,a5,1	#, tmp82, tmp83
	sw	a5,-24(s0)	# tmp82, j
.L9:
# morse_blink.c:34:     for (int j = 0; j < kSymbolSpaceDelay; j++)
	lw	a4,-24(s0)		# tmp84, j
	li	a5,200704		# tmp86,
	addi	a5,a5,-705	#, tmp85, tmp86
	ble	a4,a5,.L10	#, tmp84, tmp85,
# morse_blink.c:36: }
	nop	
	lw	s0,28(sp)		#,
	addi	sp,sp,32	#,,
	jr	ra		#
	.size	blinkDash, .-blinkDash
	.align	2
	.globl	blinkMorseCodeForChar
	.type	blinkMorseCodeForChar, @function
blinkMorseCodeForChar:
	addi	sp,sp,-48	#,,
	sw	ra,44(sp)	#,
	sw	s0,40(sp)	#,
	addi	s0,sp,48	#,,
	mv	a5,a0	# tmp73, c
	sb	a5,-33(s0)	# tmp74, c
# morse_blink.c:41:     switch (c)
	lbu	a5,-33(s0)	# _1, c
	addi	a5,a5,-65	#, tmp75, _1
	li	a4,57		# tmp76,
	bgtu	a5,a4,.L43	#, tmp75, tmp76,
	slli	a4,a5,2	#, tmp77, tmp75
	lui	a5,%hi(.L14)	# tmp80,
	addi	a5,a5,%lo(.L14)	# tmp79, tmp80,
	add	a5,a4,a5	# tmp79, tmp78, tmp77
	lw	a5,0(a5)		# tmp81,
	jr	a5		# tmp81
	.section	.rodata
	.align	2
	.align	2
.L14:
	.word	.L39
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L33
	.word	.L32
	.word	.L31
	.word	.L30
	.word	.L29
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L23
	.word	.L22
	.word	.L21
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L13
	.word	.L43
	.word	.L43
	.word	.L43
	.word	.L43
	.word	.L43
	.word	.L43
	.word	.L39
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L33
	.word	.L32
	.word	.L31
	.word	.L30
	.word	.L29
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L23
	.word	.L22
	.word	.L21
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L13
	.text
.L39:
# morse_blink.c:45:         blinkDot();
	call	blinkDot		#
# morse_blink.c:46:         blinkDash();
	call	blinkDash		#
# morse_blink.c:47:         break;
	j	.L40		#
.L38:
# morse_blink.c:50:         blinkDash();
	call	blinkDash		#
# morse_blink.c:51:         blinkDot();
	call	blinkDot		#
# morse_blink.c:52:         blinkDot();
	call	blinkDot		#
# morse_blink.c:53:         blinkDot();
	call	blinkDot		#
# morse_blink.c:54:         break;
	j	.L40		#
.L37:
# morse_blink.c:57:         blinkDash();
	call	blinkDash		#
# morse_blink.c:58:         blinkDot();
	call	blinkDot		#
# morse_blink.c:59:         blinkDash();
	call	blinkDash		#
# morse_blink.c:60:         blinkDot();
	call	blinkDot		#
# morse_blink.c:61:         break;
	j	.L40		#
.L36:
# morse_blink.c:64:         blinkDash();
	call	blinkDash		#
# morse_blink.c:65:         blinkDot();
	call	blinkDot		#
# morse_blink.c:66:         blinkDot();
	call	blinkDot		#
# morse_blink.c:67:         break;
	j	.L40		#
.L35:
# morse_blink.c:70:         blinkDot();
	call	blinkDot		#
# morse_blink.c:71:         break;
	j	.L40		#
.L34:
# morse_blink.c:74:         blinkDot();
	call	blinkDot		#
# morse_blink.c:75:         blinkDot();
	call	blinkDot		#
# morse_blink.c:76:         blinkDash();
	call	blinkDash		#
# morse_blink.c:77:         blinkDot();
	call	blinkDot		#
# morse_blink.c:78:         break;
	j	.L40		#
.L33:
# morse_blink.c:81:         blinkDash();
	call	blinkDash		#
# morse_blink.c:82:         blinkDash();
	call	blinkDash		#
# morse_blink.c:83:         blinkDot();
	call	blinkDot		#
# morse_blink.c:84:         break;
	j	.L40		#
.L32:
# morse_blink.c:87:         blinkDot();
	call	blinkDot		#
# morse_blink.c:88:         blinkDot();
	call	blinkDot		#
# morse_blink.c:89:         blinkDot();
	call	blinkDot		#
# morse_blink.c:90:         blinkDot();
	call	blinkDot		#
# morse_blink.c:91:         break;
	j	.L40		#
.L31:
# morse_blink.c:94:         blinkDot();
	call	blinkDot		#
# morse_blink.c:95:         blinkDot();
	call	blinkDot		#
# morse_blink.c:96:         break;
	j	.L40		#
.L30:
# morse_blink.c:99:         blinkDot();
	call	blinkDot		#
# morse_blink.c:100:         blinkDash();
	call	blinkDash		#
# morse_blink.c:101:         blinkDash();
	call	blinkDash		#
# morse_blink.c:102:         blinkDash();
	call	blinkDash		#
# morse_blink.c:103:         break;
	j	.L40		#
.L29:
# morse_blink.c:106:         blinkDash();
	call	blinkDash		#
# morse_blink.c:107:         blinkDot();
	call	blinkDot		#
# morse_blink.c:108:         blinkDash();
	call	blinkDash		#
# morse_blink.c:109:         break;
	j	.L40		#
.L28:
# morse_blink.c:112:         blinkDot();
	call	blinkDot		#
# morse_blink.c:113:         blinkDash();
	call	blinkDash		#
# morse_blink.c:114:         blinkDot();
	call	blinkDot		#
# morse_blink.c:115:         blinkDot();
	call	blinkDot		#
# morse_blink.c:116:         break;
	j	.L40		#
.L27:
# morse_blink.c:119:         blinkDash();
	call	blinkDash		#
# morse_blink.c:120:         blinkDash();
	call	blinkDash		#
# morse_blink.c:121:         break;
	j	.L40		#
.L26:
# morse_blink.c:124:         blinkDash();
	call	blinkDash		#
# morse_blink.c:125:         blinkDot();
	call	blinkDot		#
# morse_blink.c:126:         break;
	j	.L40		#
.L25:
# morse_blink.c:129:         blinkDash();
	call	blinkDash		#
# morse_blink.c:130:         blinkDash();
	call	blinkDash		#
# morse_blink.c:131:         blinkDash();
	call	blinkDash		#
# morse_blink.c:132:         break;
	j	.L40		#
.L24:
# morse_blink.c:135:         blinkDot();
	call	blinkDot		#
# morse_blink.c:136:         blinkDash();
	call	blinkDash		#
# morse_blink.c:137:         blinkDash();
	call	blinkDash		#
# morse_blink.c:138:         blinkDot();
	call	blinkDot		#
# morse_blink.c:139:         break;
	j	.L40		#
.L23:
# morse_blink.c:142:         blinkDash();
	call	blinkDash		#
# morse_blink.c:143:         blinkDash();
	call	blinkDash		#
# morse_blink.c:144:         blinkDot();
	call	blinkDot		#
# morse_blink.c:145:         blinkDash();
	call	blinkDash		#
# morse_blink.c:146:         break;
	j	.L40		#
.L22:
# morse_blink.c:149:         blinkDot();
	call	blinkDot		#
# morse_blink.c:150:         blinkDash();
	call	blinkDash		#
# morse_blink.c:151:         blinkDot();
	call	blinkDot		#
# morse_blink.c:152:         break;
	j	.L40		#
.L21:
# morse_blink.c:155:         blinkDot();
	call	blinkDot		#
# morse_blink.c:156:         blinkDot();
	call	blinkDot		#
# morse_blink.c:157:         blinkDot();
	call	blinkDot		#
# morse_blink.c:158:         break;
	j	.L40		#
.L20:
# morse_blink.c:161:         blinkDash();
	call	blinkDash		#
# morse_blink.c:162:         break;
	j	.L40		#
.L19:
# morse_blink.c:165:         blinkDot();
	call	blinkDot		#
# morse_blink.c:166:         blinkDot();
	call	blinkDot		#
# morse_blink.c:167:         blinkDash();
	call	blinkDash		#
# morse_blink.c:168:         break;
	j	.L40		#
.L18:
# morse_blink.c:171:         blinkDot();
	call	blinkDot		#
# morse_blink.c:172:         blinkDot();
	call	blinkDot		#
# morse_blink.c:173:         blinkDot();
	call	blinkDot		#
# morse_blink.c:174:         blinkDash();
	call	blinkDash		#
# morse_blink.c:175:         break;
	j	.L40		#
.L17:
# morse_blink.c:178:         blinkDot();
	call	blinkDot		#
# morse_blink.c:179:         blinkDash();
	call	blinkDash		#
# morse_blink.c:180:         blinkDash();
	call	blinkDash		#
# morse_blink.c:181:         break;
	j	.L40		#
.L16:
# morse_blink.c:184:         blinkDash();
	call	blinkDash		#
# morse_blink.c:185:         blinkDot();
	call	blinkDot		#
# morse_blink.c:186:         blinkDot();
	call	blinkDot		#
# morse_blink.c:187:         blinkDash();
	call	blinkDash		#
# morse_blink.c:188:         break;
	j	.L40		#
.L15:
# morse_blink.c:191:         blinkDash();
	call	blinkDash		#
# morse_blink.c:192:         blinkDot();
	call	blinkDot		#
# morse_blink.c:193:         blinkDash();
	call	blinkDash		#
# morse_blink.c:194:         blinkDash();
	call	blinkDash		#
# morse_blink.c:195:         break;
	j	.L40		#
.L13:
# morse_blink.c:198:         blinkDash();
	call	blinkDash		#
# morse_blink.c:199:         blinkDash();
	call	blinkDash		#
# morse_blink.c:200:         blinkDot();
	call	blinkDot		#
# morse_blink.c:201:         blinkDot();
	call	blinkDot		#
# morse_blink.c:202:         break;
	j	.L40		#
.L43:
# morse_blink.c:208:         break;
	nop	
.L40:
# morse_blink.c:210: 	for (int i = 0; i < kLetterSpaceDelay; i++)
	sw	zero,-20(s0)	#, i
# morse_blink.c:210: 	for (int i = 0; i < kLetterSpaceDelay; i++)
	j	.L41		#
.L42:
# morse_blink.c:210: 	for (int i = 0; i < kLetterSpaceDelay; i++)
	lw	a5,-20(s0)		# tmp83, i
	addi	a5,a5,1	#, tmp82, tmp83
	sw	a5,-20(s0)	# tmp82, i
.L41:
# morse_blink.c:210: 	for (int i = 0; i < kLetterSpaceDelay; i++)
	lw	a4,-20(s0)		# tmp84, i
	li	a5,598016		# tmp86,
	addi	a5,a5,1983	#, tmp85, tmp86
	ble	a4,a5,.L42	#, tmp84, tmp85,
# morse_blink.c:212: }
	nop	
	lw	ra,44(sp)		#,
	lw	s0,40(sp)		#,
	addi	sp,sp,48	#,,
	jr	ra		#
	.size	blinkMorseCodeForChar, .-blinkMorseCodeForChar
	.section	.rodata
	.align	2
.LC0:
	.string	"HELLO WORLD"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32	#,,
	sw	ra,28(sp)	#,
	sw	s0,24(sp)	#,
	addi	s0,sp,32	#,,
# morse_blink.c:216:     const char *message = "HELLO WORLD";
	lui	a5,%hi(.LC0)	# tmp80,
	addi	a5,a5,%lo(.LC0)	# tmp79, tmp80,
	sw	a5,-32(s0)	# tmp79, message
.L53:
# morse_blink.c:220:         for (int i = 0; i < 11; i++)
	sw	zero,-20(s0)	#, i
# morse_blink.c:220:         for (int i = 0; i < 11; i++)
	j	.L45		#
.L50:
# morse_blink.c:222: 			if (message[i] == ' ')
	lw	a5,-20(s0)		# i.4_1, i
	lw	a4,-32(s0)		# tmp81, message
	add	a5,a4,a5	# i.4_1, _2, tmp81
	lbu	a4,0(a5)	# _3, *_2
# morse_blink.c:222: 			if (message[i] == ' ')
	li	a5,32		# tmp82,
	bne	a4,a5,.L46	#, _3, tmp82,
# morse_blink.c:225: 				for (int j = 0; j < kWordSpaceDelay; j++)
	sw	zero,-24(s0)	#, j
# morse_blink.c:225: 				for (int j = 0; j < kWordSpaceDelay; j++)
	j	.L47		#
.L48:
# morse_blink.c:225: 				for (int j = 0; j < kWordSpaceDelay; j++)
	lw	a5,-24(s0)		# tmp84, j
	addi	a5,a5,1	#, tmp83, tmp84
	sw	a5,-24(s0)	# tmp83, j
.L47:
# morse_blink.c:225: 				for (int j = 0; j < kWordSpaceDelay; j++)
	lw	a4,-24(s0)		# tmp85, j
	li	a5,1798144		# tmp87,
	addi	a5,a5,1855	#, tmp86, tmp87
	ble	a4,a5,.L48	#, tmp85, tmp86,
	j	.L49		#
.L46:
# morse_blink.c:228: 				blinkMorseCodeForChar(message[i]);
	lw	a5,-20(s0)		# i.5_4, i
	lw	a4,-32(s0)		# tmp88, message
	add	a5,a4,a5	# i.5_4, _5, tmp88
# morse_blink.c:228: 				blinkMorseCodeForChar(message[i]);
	lbu	a5,0(a5)	# _6, *_5
	mv	a0,a5	#, _6
	call	blinkMorseCodeForChar		#
.L49:
# morse_blink.c:220:         for (int i = 0; i < 11; i++)
	lw	a5,-20(s0)		# tmp90, i
	addi	a5,a5,1	#, tmp89, tmp90
	sw	a5,-20(s0)	# tmp89, i
.L45:
# morse_blink.c:220:         for (int i = 0; i < 11; i++)
	lw	a4,-20(s0)		# tmp91, i
	li	a5,10		# tmp92,
	ble	a4,a5,.L50	#, tmp91, tmp92,
# morse_blink.c:231:         for (int j = 0; j < kWordSpaceDelay; j++)
	sw	zero,-28(s0)	#, j
# morse_blink.c:231:         for (int j = 0; j < kWordSpaceDelay; j++)
	j	.L51		#
.L52:
# morse_blink.c:231:         for (int j = 0; j < kWordSpaceDelay; j++)
	lw	a5,-28(s0)		# tmp94, j
	addi	a5,a5,1	#, tmp93, tmp94
	sw	a5,-28(s0)	# tmp93, j
.L51:
# morse_blink.c:231:         for (int j = 0; j < kWordSpaceDelay; j++)
	lw	a4,-28(s0)		# tmp95, j
	li	a5,1798144		# tmp97,
	addi	a5,a5,1855	#, tmp96, tmp97
	ble	a4,a5,.L52	#, tmp95, tmp96,
# morse_blink.c:220:         for (int i = 0; i < 11; i++)
	j	.L53		#
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.0"
