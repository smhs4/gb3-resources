	.file	"bubblesort.c"
	.option nopic
# GNU C17 (GCC) version 8.2.0 (riscv32-elf)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I ../include -imultilib rv32i/ilp32
# -iprefix /f-of-e-tools/tools/sunflower/sunflower-toolchain/tools/riscv/bin/../lib/gcc/riscv32-elf/8.2.0/
# -D M32 bubblesort.c -march=rv32i -mabi=ilp32 -O0 -Wall -fverbose-asm
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
	.globl	led_register
	.section	.srodata,"a"
	.align	2
	.type	led_register, @object
	.size	led_register, 4
led_register:
	.word	8192
	.globl	uart_data_register
	.align	2
	.type	uart_data_register, @object
	.size	uart_data_register, 4
uart_data_register:
	.word	8196
	.globl	uart_status_register
	.align	2
	.type	uart_status_register, @object
	.size	uart_status_register, 4
uart_status_register:
	.word	8197
	.section	.rodata
	.align	2
.LC0:
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.byte	83
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	109
	.byte	101
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	44
	.byte	32
	.byte	77
	.byte	117
	.byte	115
	.byte	101
	.byte	44
	.byte	32
	.byte	116
	.byte	104
	.byte	101
	.byte	32
	.byte	109
	.byte	97
	.byte	110
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	119
	.byte	105
	.byte	115
	.byte	116
	.byte	115
	.byte	32
	.byte	97
	.byte	110
	.byte	100
	.byte	32
	.byte	116
	.byte	117
	.byte	114
	.byte	110
	.byte	115
	.byte	46
	.byte	46
	.byte	46
	.text
	.align	2
	.globl	sort
	.type	sort, @function
sort:
	addi	sp,sp,-1104	#,,
	sw	ra,1100(sp)	#,
	sw	s0,1096(sp)	#,
	addi	s0,sp,1104	#,,
# bubblesort.c:10: 	unsigned char bsort_input[] = {
	lui	a5,%hi(.LC0)	# tmp94,
	addi	a4,s0,-1092	#, tmp95,
	addi	a5,a5,%lo(.LC0)	# tmp96, tmp94,
	li	a3,1062		# tmp97,
	mv	a2,a3	#, tmp97
	mv	a1,a5	#, tmp96
	mv	a0,a4	#, tmp95
	call	memcpy		#
# bubblesort.c:13: 	const int bsort_input_len = 0x40;
	li	a5,64		# tmp99,
	sw	a5,-28(s0)	# tmp99, bsort_input_len
# bubblesort.c:16: 	int maxindex = bsort_input_len - 1;
	lw	a5,-28(s0)		# tmp101, bsort_input_len
	addi	a5,a5,-1	#, tmp100, tmp101
	sw	a5,-24(s0)	# tmp100, maxindex
# bubblesort.c:17: 	while (maxindex > 0) {
	j	.L2		#
.L6:
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	sw	zero,-20(s0)	#, i
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	j	.L3		#
.L5:
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lw	a5,-20(s0)		# tmp103, i
	addi	a4,s0,-16	#, tmp143,
	add	a5,a4,a5	# tmp103, tmp102, tmp143
	lbu	a4,-1076(a5)	# _1, bsort_input
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lw	a5,-20(s0)		# tmp104, i
	addi	a5,a5,1	#, _2, tmp104
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	addi	a3,s0,-16	#, tmp144,
	add	a5,a3,a5	# _2, tmp105, tmp144
	lbu	a5,-1076(a5)	# _3, bsort_input
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	bleu	a4,a5,.L4	#, _1, _3,
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp107, i
	addi	a4,s0,-16	#, tmp145,
	add	a5,a4,a5	# tmp107, tmp106, tmp145
	lbu	a4,-1076(a5)	# _4, bsort_input
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp108, i
	addi	a5,a5,1	#, _5, tmp108
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	addi	a3,s0,-16	#, tmp146,
	add	a5,a3,a5	# _5, tmp109, tmp146
	lbu	a5,-1076(a5)	# _6, bsort_input
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	xor	a5,a4,a5	# _6, tmp110, _4
	andi	a4,a5,0xff	# _7, tmp110
	lw	a5,-20(s0)		# tmp112, i
	addi	a3,s0,-16	#, tmp147,
	add	a5,a3,a5	# tmp112, tmp111, tmp147
	sb	a4,-1076(a5)	# _7, bsort_input
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp113, i
	addi	a5,a5,1	#, _8, tmp113
	addi	a4,s0,-16	#, tmp148,
	add	a5,a4,a5	# _8, tmp114, tmp148
	lbu	a3,-1076(a5)	# _9, bsort_input
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp116, i
	addi	a4,s0,-16	#, tmp149,
	add	a5,a4,a5	# tmp116, tmp115, tmp149
	lbu	a4,-1076(a5)	# _10, bsort_input
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp117, i
	addi	a5,a5,1	#, _11, tmp117
	xor	a4,a3,a4	# _10, tmp118, _9
	andi	a4,a4,0xff	# _12, tmp118
	addi	a3,s0,-16	#, tmp150,
	add	a5,a3,a5	# _11, tmp119, tmp150
	sb	a4,-1076(a5)	# _12, bsort_input
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp121, i
	addi	a4,s0,-16	#, tmp151,
	add	a5,a4,a5	# tmp121, tmp120, tmp151
	lbu	a4,-1076(a5)	# _13, bsort_input
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp122, i
	addi	a5,a5,1	#, _14, tmp122
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	addi	a3,s0,-16	#, tmp152,
	add	a5,a3,a5	# _14, tmp123, tmp152
	lbu	a5,-1076(a5)	# _15, bsort_input
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	xor	a5,a4,a5	# _15, tmp124, _13
	andi	a4,a5,0xff	# _16, tmp124
	lw	a5,-20(s0)		# tmp126, i
	addi	a3,s0,-16	#, tmp153,
	add	a5,a3,a5	# tmp126, tmp125, tmp153
	sb	a4,-1076(a5)	# _16, bsort_input
.L4:
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	lw	a5,-20(s0)		# tmp128, i
	addi	a5,a5,1	#, tmp127, tmp128
	sw	a5,-20(s0)	# tmp127, i
.L3:
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	lw	a4,-20(s0)		# tmp129, i
	lw	a5,-24(s0)		# tmp130, maxindex
	blt	a4,a5,.L5	#, tmp129, tmp130,
# bubblesort.c:28: 		maxindex--;
	lw	a5,-24(s0)		# tmp132, maxindex
	addi	a5,a5,-1	#, tmp131, tmp132
	sw	a5,-24(s0)	# tmp131, maxindex
.L2:
# bubblesort.c:17: 	while (maxindex > 0) {
	lw	a5,-24(s0)		# tmp133, maxindex
	bgtz	a5,.L6	#, tmp133,
# bubblesort.c:32: 	*((unsigned int *)0x2010) = 0xff;
	li	a5,8192		# tmp134,
	addi	a5,a5,16	#, _17, tmp134
# bubblesort.c:32: 	*((unsigned int *)0x2010) = 0xff;
	li	a4,255		# tmp135,
	sw	a4,0(a5)	# tmp135, *_17
# bubblesort.c:33: 	for (i = 0; i < bsort_input_len; i++) {
	sw	zero,-20(s0)	#, i
# bubblesort.c:33: 	for (i = 0; i < bsort_input_len; i++) {
	j	.L7		#
.L8:
# bubblesort.c:34: 		*led_register = bsort_input[i];
	li	a5,8192		# led_register.0_18,
# bubblesort.c:34: 		*led_register = bsort_input[i];
	lw	a4,-20(s0)		# tmp137, i
	addi	a3,s0,-16	#, tmp154,
	add	a4,a3,a4	# tmp137, tmp136, tmp154
	lbu	a4,-1076(a4)	# _19, bsort_input
# bubblesort.c:34: 		*led_register = bsort_input[i];
	sb	a4,0(a5)	# _19, *led_register.0_18
# bubblesort.c:33: 	for (i = 0; i < bsort_input_len; i++) {
	lw	a5,-20(s0)		# tmp139, i
	addi	a5,a5,1	#, tmp138, tmp139
	sw	a5,-20(s0)	# tmp138, i
.L7:
# bubblesort.c:33: 	for (i = 0; i < bsort_input_len; i++) {
	lw	a4,-20(s0)		# tmp140, i
	lw	a5,-28(s0)		# tmp141, bsort_input_len
	blt	a4,a5,.L8	#, tmp140, tmp141,
# bubblesort.c:37: 	return *((int *)bsort_input);
	addi	a5,s0,-1092	#, bsort_input.1_20,
# bubblesort.c:37: 	return *((int *)bsort_input);
	lw	a5,0(a5)		# _42, MEM[(int *)bsort_input.1_20]
# bubblesort.c:38: }
	mv	a0,a5	#, <retval>
	lw	ra,1100(sp)		#,
	lw	s0,1096(sp)		#,
	addi	sp,sp,1104	#,,
	jr	ra		#
	.size	sort, .-sort
	.align	2
	.globl	print
	.type	print, @function
print:
	addi	sp,sp,-32	#,,
	sw	ra,28(sp)	#,
	sw	s0,24(sp)	#,
	addi	s0,sp,32	#,,
	sw	a0,-20(s0)	# str, str
# bubblesort.c:43: 	while ((*str)!=0)
	j	.L11		#
.L12:
# bubblesort.c:45: 		putchar(*(str++));
	lw	a5,-20(s0)		# str.2_1, str
	addi	a4,a5,1	#, tmp76, str.2_1
	sw	a4,-20(s0)	# tmp76, str
# bubblesort.c:45: 		putchar(*(str++));
	lbu	a5,0(a5)	# _2, *str.2_1
# bubblesort.c:45: 		putchar(*(str++));
	mv	a0,a5	#, _3
	call	putchar		#
.L11:
# bubblesort.c:43: 	while ((*str)!=0)
	lw	a5,-20(s0)		# tmp77, str
	lbu	a5,0(a5)	# _4, *str_5
# bubblesort.c:43: 	while ((*str)!=0)
	bnez	a5,.L12	#, _4,
# bubblesort.c:47: }
	nop	
	lw	ra,28(sp)		#,
	lw	s0,24(sp)		#,
	addi	sp,sp,32	#,,
	jr	ra		#
	.size	print, .-print
	.globl	buffer1
	.section	.rodata
	.align	2
.LC1:
	.string	"        "
	.section	.sdata,"aw"
	.align	2
	.type	buffer1, @object
	.size	buffer1, 4
buffer1:
	.word	.LC1
	.globl	buffer2
	.section	.rodata
	.align	2
.LC2:
	.string	"12345678"
	.section	.sdata
	.align	2
	.type	buffer2, @object
	.size	buffer2, 4
buffer2:
	.word	.LC2
	.text
	.align	2
	.globl	str2int
	.type	str2int, @function
str2int:
	addi	sp,sp,-48	#,,
	sw	s0,44(sp)	#,
	addi	s0,sp,48	#,,
	sw	a0,-36(s0)	# input, input
# bubblesort.c:53: 	int result = 0;
	sw	zero,-20(s0)	#, result
# bubblesort.c:54: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	sw	zero,-24(s0)	#, i
# bubblesort.c:54: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	j	.L14		#
.L17:
# bubblesort.c:56: 		char temp = input[7-i];
	li	a4,7		# tmp80,
	lw	a5,-24(s0)		# tmp81, i
	sub	a5,a4,a5	# _1, tmp80, tmp81
	mv	a4,a5	# _2, _1
# bubblesort.c:56: 		char temp = input[7-i];
	lw	a5,-36(s0)		# tmp82, input
	add	a5,a5,a4	# _2, _3, tmp82
# bubblesort.c:56: 		char temp = input[7-i];
	lbu	a5,0(a5)	# tmp83, *_3
	sb	a5,-25(s0)	# tmp83, temp
# bubblesort.c:57: 		if (temp > 0x40) temp = temp-0x41+10; //A to F
	lbu	a4,-25(s0)	# tmp84, temp
	li	a5,64		# tmp85,
	bleu	a4,a5,.L15	#, tmp84, tmp85,
# bubblesort.c:57: 		if (temp > 0x40) temp = temp-0x41+10; //A to F
	lbu	a5,-25(s0)	# tmp86, temp
	addi	a5,a5,-55	#, tmp87, tmp86
	sb	a5,-25(s0)	# tmp87, temp
	j	.L16		#
.L15:
# bubblesort.c:58: 		else temp = temp-0x30;
	lbu	a5,-25(s0)	# tmp88, temp
	addi	a5,a5,-48	#, tmp89, tmp88
	sb	a5,-25(s0)	# tmp89, temp
.L16:
# bubblesort.c:59: 		result += temp << (i*4);
	lbu	a4,-25(s0)	# _4, temp
# bubblesort.c:59: 		result += temp << (i*4);
	lw	a5,-24(s0)		# tmp90, i
	slli	a5,a5,2	#, _5, tmp90
# bubblesort.c:59: 		result += temp << (i*4);
	sll	a5,a4,a5	# _5, _6, _4
# bubblesort.c:59: 		result += temp << (i*4);
	lw	a4,-20(s0)		# tmp92, result
	add	a5,a4,a5	# _6, tmp91, tmp92
	sw	a5,-20(s0)	# tmp91, result
# bubblesort.c:54: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	lw	a5,-24(s0)		# tmp94, i
	addi	a5,a5,1	#, tmp93, tmp94
	sw	a5,-24(s0)	# tmp93, i
.L14:
# bubblesort.c:54: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	lw	a4,-24(s0)		# tmp95, i
	li	a5,7		# tmp96,
	ble	a4,a5,.L17	#, tmp95, tmp96,
# bubblesort.c:61: 	return result;
	lw	a5,-20(s0)		# _19, result
# bubblesort.c:62: }
	mv	a0,a5	#, <retval>
	lw	s0,44(sp)		#,
	addi	sp,sp,48	#,,
	jr	ra		#
	.size	str2int, .-str2int
	.align	2
	.globl	getchar
	.type	getchar, @function
getchar:
	addi	sp,sp,-32	#,,
	sw	s0,28(sp)	#,
	addi	s0,sp,32	#,,
# bubblesort.c:66: 	for(int i = 0; i <200; i++){
	sw	zero,-20(s0)	#, i
# bubblesort.c:66: 	for(int i = 0; i <200; i++){
	j	.L20		#
.L21:
# bubblesort.c:67: 		__asm__("nop");
 #APP
# 67 "bubblesort.c" 1
	nop
# 0 "" 2
# bubblesort.c:66: 	for(int i = 0; i <200; i++){
 #NO_APP
	lw	a5,-20(s0)		# tmp80, i
	addi	a5,a5,1	#, tmp79, tmp80
	sw	a5,-20(s0)	# tmp79, i
.L20:
# bubblesort.c:66: 	for(int i = 0; i <200; i++){
	lw	a4,-20(s0)		# tmp81, i
	li	a5,199		# tmp82,
	ble	a4,a5,.L21	#, tmp81, tmp82,
# bubblesort.c:69: 	while ((*(uart_status_register) & 2)==0);
	nop	
.L22:
# bubblesort.c:69: 	while ((*(uart_status_register) & 2)==0);
	li	a5,8192		# tmp83,
	addi	a5,a5,5	#, uart_status_register.3_1, tmp83
	lbu	a5,0(a5)	# tmp84, *uart_status_register.3_1
	andi	a5,a5,0xff	# _2, tmp84
# bubblesort.c:69: 	while ((*(uart_status_register) & 2)==0);
	andi	a5,a5,2	#, _4, _3
# bubblesort.c:69: 	while ((*(uart_status_register) & 2)==0);
	beqz	a5,.L22	#, _4,
# bubblesort.c:70: 	return *(uart_data_register);
	li	a5,8192		# tmp85,
	addi	a5,a5,4	#, uart_data_register.4_5, tmp85
	lbu	a5,0(a5)	# tmp86, *uart_data_register.4_5
	andi	a5,a5,0xff	# _12, tmp86
# bubblesort.c:71: }
	mv	a0,a5	#, <retval>
	lw	s0,28(sp)		#,
	addi	sp,sp,32	#,,
	jr	ra		#
	.size	getchar, .-getchar
	.section	.rodata
	.align	2
.LC3:
	.string	"\r\ntest\r\n"
	.align	2
.LC4:
	.string	"\r\nplease enter a 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n"
	.align	2
.LC5:
	.string	"\r\nplease enter another 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n"
	.align	2
.LC6:
	.string	"\r\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48	#,,
	sw	ra,44(sp)	#,
	sw	s0,40(sp)	#,
	sw	s1,36(sp)	#,
	addi	s0,sp,48	#,,
# bubblesort.c:75: 	print("\r\ntest\r\n");
	lui	a5,%hi(.LC3)	# tmp94,
	addi	a0,a5,%lo(.LC3)	#, tmp94,
	call	print		#
# bubblesort.c:76: 	printhex(0x12345678);
	li	a5,305418240		# tmp95,
	addi	a0,a5,1656	#,, tmp95
	call	printhex		#
# bubblesort.c:77: 	print("\r\nplease enter a 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n");
	lui	a5,%hi(.LC4)	# tmp96,
	addi	a0,a5,%lo(.LC4)	#, tmp96,
	call	print		#
# bubblesort.c:78: 	for (int i = 0; i < 8; i++)
	sw	zero,-20(s0)	#, i
# bubblesort.c:78: 	for (int i = 0; i < 8; i++)
	j	.L25		#
.L26:
# bubblesort.c:80: 		buffer1[i] = getchar();
	lui	a5,%hi(buffer1)	# tmp97,
	lw	a4,%lo(buffer1)(a5)		# buffer1.5_1, buffer1
	lw	a5,-20(s0)		# i.6_2, i
	add	s1,a4,a5	# i.6_2, _3, buffer1.5_1
# bubblesort.c:80: 		buffer1[i] = getchar();
	call	getchar		#
	mv	a5,a0	# tmp98,
# bubblesort.c:80: 		buffer1[i] = getchar();
	sb	a5,0(s1)	# _4, *_3
# bubblesort.c:81: 		putchar(buffer1[i]);
	lui	a5,%hi(buffer1)	# tmp99,
	lw	a4,%lo(buffer1)(a5)		# buffer1.7_5, buffer1
	lw	a5,-20(s0)		# i.8_6, i
	add	a5,a4,a5	# i.8_6, _7, buffer1.7_5
	lbu	a5,0(a5)	# _8, *_7
# bubblesort.c:81: 		putchar(buffer1[i]);
	mv	a0,a5	#, _9
	call	putchar		#
# bubblesort.c:78: 	for (int i = 0; i < 8; i++)
	lw	a5,-20(s0)		# tmp101, i
	addi	a5,a5,1	#, tmp100, tmp101
	sw	a5,-20(s0)	# tmp100, i
.L25:
# bubblesort.c:78: 	for (int i = 0; i < 8; i++)
	lw	a4,-20(s0)		# tmp102, i
	li	a5,7		# tmp103,
	ble	a4,a5,.L26	#, tmp102, tmp103,
# bubblesort.c:83: 	print("\r\nplease enter another 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n");
	lui	a5,%hi(.LC5)	# tmp104,
	addi	a0,a5,%lo(.LC5)	#, tmp104,
	call	print		#
# bubblesort.c:84: 	for (int i = 0; i < 8; i++)
	sw	zero,-24(s0)	#, i
# bubblesort.c:84: 	for (int i = 0; i < 8; i++)
	j	.L27		#
.L28:
# bubblesort.c:86: 		buffer2[i] = getchar();
	lui	a5,%hi(buffer2)	# tmp105,
	lw	a4,%lo(buffer2)(a5)		# buffer2.9_10, buffer2
	lw	a5,-24(s0)		# i.10_11, i
	add	s1,a4,a5	# i.10_11, _12, buffer2.9_10
# bubblesort.c:86: 		buffer2[i] = getchar();
	call	getchar		#
	mv	a5,a0	# tmp106,
# bubblesort.c:86: 		buffer2[i] = getchar();
	sb	a5,0(s1)	# _13, *_12
# bubblesort.c:87: 		putchar(buffer2[i]);
	lui	a5,%hi(buffer2)	# tmp107,
	lw	a4,%lo(buffer2)(a5)		# buffer2.11_14, buffer2
	lw	a5,-24(s0)		# i.12_15, i
	add	a5,a4,a5	# i.12_15, _16, buffer2.11_14
	lbu	a5,0(a5)	# _17, *_16
# bubblesort.c:87: 		putchar(buffer2[i]);
	mv	a0,a5	#, _18
	call	putchar		#
# bubblesort.c:84: 	for (int i = 0; i < 8; i++)
	lw	a5,-24(s0)		# tmp109, i
	addi	a5,a5,1	#, tmp108, tmp109
	sw	a5,-24(s0)	# tmp108, i
.L27:
# bubblesort.c:84: 	for (int i = 0; i < 8; i++)
	lw	a4,-24(s0)		# tmp110, i
	li	a5,7		# tmp111,
	ble	a4,a5,.L28	#, tmp110, tmp111,
# bubblesort.c:89: 	int number_A = str2int(buffer1);
	lui	a5,%hi(buffer1)	# tmp112,
	lw	a5,%lo(buffer1)(a5)		# buffer1.13_19, buffer1
	mv	a0,a5	#, buffer1.13_19
	call	str2int		#
	sw	a0,-28(s0)	#, number_A
# bubblesort.c:90: 	int number_B = str2int(buffer2);
	lui	a5,%hi(buffer2)	# tmp113,
	lw	a5,%lo(buffer2)(a5)		# buffer2.14_20, buffer2
	mv	a0,a5	#, buffer2.14_20
	call	str2int		#
	sw	a0,-32(s0)	#, number_B
# bubblesort.c:91: 	print("\r\n");
	lui	a5,%hi(.LC6)	# tmp114,
	addi	a0,a5,%lo(.LC6)	#, tmp114,
	call	print		#
# bubblesort.c:92: 	printhex(number_A);
	lw	a0,-28(s0)		#, number_A
	call	printhex		#
# bubblesort.c:93: 	print("\r\n");
	lui	a5,%hi(.LC6)	# tmp115,
	addi	a0,a5,%lo(.LC6)	#, tmp115,
	call	print		#
# bubblesort.c:94: 	printhex(number_B);
	lw	a0,-32(s0)		#, number_B
	call	printhex		#
# bubblesort.c:96: 	int sum = number_A+number_B;
	lw	a4,-28(s0)		# tmp117, number_A
	lw	a5,-32(s0)		# tmp118, number_B
	add	a5,a4,a5	# tmp118, tmp116, tmp117
	sw	a5,-36(s0)	# tmp116, sum
# bubblesort.c:97: 	print("\r\n");
	lui	a5,%hi(.LC6)	# tmp119,
	addi	a0,a5,%lo(.LC6)	#, tmp119,
	call	print		#
# bubblesort.c:98: 	printhex(sum);
	lw	a0,-36(s0)		#, sum
	call	printhex		#
# bubblesort.c:101: 	sort();
	call	sort		#
	li	a5,0		# _52,
# bubblesort.c:111: }
	mv	a0,a5	#, <retval>
	lw	ra,44(sp)		#,
	lw	s0,40(sp)		#,
	lw	s1,36(sp)		#,
	addi	sp,sp,48	#,,
	jr	ra		#
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.0"
