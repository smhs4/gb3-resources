	.file	"loadsort.c"
	.option nopic
# GNU C17 (GCC) version 8.2.0 (riscv32-elf)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I ../include -imultilib rv32i/ilp32
# -iprefix /f-of-e-tools/tools/sunflower/sunflower-toolchain/tools/riscv/bin/../lib/gcc/riscv32-elf/8.2.0/
# -D M32 loadsort.c -march=rv32i -mabi=ilp32 -O0 -Wall -fverbose-asm
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
# loadsort.c:10: 	unsigned char bsort_input[] = {
	lui	a5,%hi(.LC0)	# tmp91,
	addi	a4,s0,-1092	#, tmp92,
	addi	a5,a5,%lo(.LC0)	# tmp93, tmp91,
	li	a3,1062		# tmp94,
	mv	a2,a3	#, tmp94
	mv	a1,a5	#, tmp93
	mv	a0,a4	#, tmp92
	call	memcpy		#
# loadsort.c:14: 	const int bsort_input_len = 0x426;
	li	a5,1062		# tmp96,
	sw	a5,-28(s0)	# tmp96, bsort_input_len
# loadsort.c:17: 	int maxindex = bsort_input_len - 1;
	lw	a5,-28(s0)		# tmp98, bsort_input_len
	addi	a5,a5,-1	#, tmp97, tmp98
	sw	a5,-24(s0)	# tmp97, maxindex
# loadsort.c:18: 	while (maxindex > 0) {
	j	.L2		#
.L6:
# loadsort.c:20: 		for (i = 0; i < maxindex; i++) {
	sw	zero,-20(s0)	#, i
# loadsort.c:20: 		for (i = 0; i < maxindex; i++) {
	j	.L3		#
.L5:
# loadsort.c:21: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lw	a5,-20(s0)		# tmp100, i
	addi	a4,s0,-16	#, tmp132,
	add	a5,a4,a5	# tmp100, tmp99, tmp132
	lbu	a4,-1076(a5)	# _1, bsort_input
# loadsort.c:21: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lw	a5,-20(s0)		# tmp101, i
	addi	a5,a5,1	#, _2, tmp101
# loadsort.c:21: 			if (bsort_input[i] > bsort_input[i + 1]) {
	addi	a3,s0,-16	#, tmp133,
	add	a5,a3,a5	# _2, tmp102, tmp133
	lbu	a5,-1076(a5)	# _3, bsort_input
# loadsort.c:21: 			if (bsort_input[i] > bsort_input[i + 1]) {
	bleu	a4,a5,.L4	#, _1, _3,
# loadsort.c:23: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp104, i
	addi	a4,s0,-16	#, tmp134,
	add	a5,a4,a5	# tmp104, tmp103, tmp134
	lbu	a4,-1076(a5)	# _4, bsort_input
# loadsort.c:23: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp105, i
	addi	a5,a5,1	#, _5, tmp105
# loadsort.c:23: 				bsort_input[i] ^= bsort_input[i + 1];
	addi	a3,s0,-16	#, tmp135,
	add	a5,a3,a5	# _5, tmp106, tmp135
	lbu	a5,-1076(a5)	# _6, bsort_input
# loadsort.c:23: 				bsort_input[i] ^= bsort_input[i + 1];
	xor	a5,a4,a5	# _6, tmp107, _4
	andi	a4,a5,0xff	# _7, tmp107
	lw	a5,-20(s0)		# tmp109, i
	addi	a3,s0,-16	#, tmp136,
	add	a5,a3,a5	# tmp109, tmp108, tmp136
	sb	a4,-1076(a5)	# _7, bsort_input
# loadsort.c:24: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp110, i
	addi	a5,a5,1	#, _8, tmp110
	addi	a4,s0,-16	#, tmp137,
	add	a5,a4,a5	# _8, tmp111, tmp137
	lbu	a3,-1076(a5)	# _9, bsort_input
# loadsort.c:24: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp113, i
	addi	a4,s0,-16	#, tmp138,
	add	a5,a4,a5	# tmp113, tmp112, tmp138
	lbu	a4,-1076(a5)	# _10, bsort_input
# loadsort.c:24: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp114, i
	addi	a5,a5,1	#, _11, tmp114
	xor	a4,a3,a4	# _10, tmp115, _9
	andi	a4,a4,0xff	# _12, tmp115
	addi	a3,s0,-16	#, tmp139,
	add	a5,a3,a5	# _11, tmp116, tmp139
	sb	a4,-1076(a5)	# _12, bsort_input
# loadsort.c:25: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp118, i
	addi	a4,s0,-16	#, tmp140,
	add	a5,a4,a5	# tmp118, tmp117, tmp140
	lbu	a4,-1076(a5)	# _13, bsort_input
# loadsort.c:25: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp119, i
	addi	a5,a5,1	#, _14, tmp119
# loadsort.c:25: 				bsort_input[i] ^= bsort_input[i + 1];
	addi	a3,s0,-16	#, tmp141,
	add	a5,a3,a5	# _14, tmp120, tmp141
	lbu	a5,-1076(a5)	# _15, bsort_input
# loadsort.c:25: 				bsort_input[i] ^= bsort_input[i + 1];
	xor	a5,a4,a5	# _15, tmp121, _13
	andi	a4,a5,0xff	# _16, tmp121
	lw	a5,-20(s0)		# tmp123, i
	addi	a3,s0,-16	#, tmp142,
	add	a5,a3,a5	# tmp123, tmp122, tmp142
	sb	a4,-1076(a5)	# _16, bsort_input
.L4:
# loadsort.c:20: 		for (i = 0; i < maxindex; i++) {
	lw	a5,-20(s0)		# tmp125, i
	addi	a5,a5,1	#, tmp124, tmp125
	sw	a5,-20(s0)	# tmp124, i
.L3:
# loadsort.c:20: 		for (i = 0; i < maxindex; i++) {
	lw	a4,-20(s0)		# tmp126, i
	lw	a5,-24(s0)		# tmp127, maxindex
	blt	a4,a5,.L5	#, tmp126, tmp127,
# loadsort.c:29: 		maxindex--;
	lw	a5,-24(s0)		# tmp129, maxindex
	addi	a5,a5,-1	#, tmp128, tmp129
	sw	a5,-24(s0)	# tmp128, maxindex
.L2:
# loadsort.c:18: 	while (maxindex > 0) {
	lw	a5,-24(s0)		# tmp130, maxindex
	bgtz	a5,.L6	#, tmp130,
# loadsort.c:38: 	return *((int *)bsort_input);
	addi	a5,s0,-1092	#, bsort_input.0_17,
# loadsort.c:38: 	return *((int *)bsort_input);
	lw	a5,0(a5)		# _33, MEM[(int *)bsort_input.0_17]
# loadsort.c:39: }
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
# loadsort.c:42: 	while ((*str)!=0)
	j	.L9		#
.L10:
# loadsort.c:44: 		putchar(*(str++));
	lw	a5,-20(s0)		# str.1_1, str
	addi	a4,a5,1	#, tmp76, str.1_1
	sw	a4,-20(s0)	# tmp76, str
# loadsort.c:44: 		putchar(*(str++));
	lbu	a5,0(a5)	# _2, *str.1_1
# loadsort.c:44: 		putchar(*(str++));
	mv	a0,a5	#, _3
	call	putchar		#
.L9:
# loadsort.c:42: 	while ((*str)!=0)
	lw	a5,-20(s0)		# tmp77, str
	lbu	a5,0(a5)	# _4, *str_5
# loadsort.c:42: 	while ((*str)!=0)
	bnez	a5,.L10	#, _4,
# loadsort.c:46: }
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
# loadsort.c:52: 	int result = 0;
	sw	zero,-20(s0)	#, result
# loadsort.c:53: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	sw	zero,-24(s0)	#, i
# loadsort.c:53: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	j	.L12		#
.L15:
# loadsort.c:55: 		char temp = input[7-i];
	li	a4,7		# tmp80,
	lw	a5,-24(s0)		# tmp81, i
	sub	a5,a4,a5	# _1, tmp80, tmp81
	mv	a4,a5	# _2, _1
# loadsort.c:55: 		char temp = input[7-i];
	lw	a5,-36(s0)		# tmp82, input
	add	a5,a5,a4	# _2, _3, tmp82
# loadsort.c:55: 		char temp = input[7-i];
	lbu	a5,0(a5)	# tmp83, *_3
	sb	a5,-25(s0)	# tmp83, temp
# loadsort.c:56: 		if (temp > 0x40) temp = temp-0x41+10; //A to F
	lbu	a4,-25(s0)	# tmp84, temp
	li	a5,64		# tmp85,
	bleu	a4,a5,.L13	#, tmp84, tmp85,
# loadsort.c:56: 		if (temp > 0x40) temp = temp-0x41+10; //A to F
	lbu	a5,-25(s0)	# tmp86, temp
	addi	a5,a5,-55	#, tmp87, tmp86
	sb	a5,-25(s0)	# tmp87, temp
	j	.L14		#
.L13:
# loadsort.c:57: 		else temp = temp-0x30;
	lbu	a5,-25(s0)	# tmp88, temp
	addi	a5,a5,-48	#, tmp89, tmp88
	sb	a5,-25(s0)	# tmp89, temp
.L14:
# loadsort.c:58: 		result += temp << (i*4);
	lbu	a4,-25(s0)	# _4, temp
# loadsort.c:58: 		result += temp << (i*4);
	lw	a5,-24(s0)		# tmp90, i
	slli	a5,a5,2	#, _5, tmp90
# loadsort.c:58: 		result += temp << (i*4);
	sll	a5,a4,a5	# _5, _6, _4
# loadsort.c:58: 		result += temp << (i*4);
	lw	a4,-20(s0)		# tmp92, result
	add	a5,a4,a5	# _6, tmp91, tmp92
	sw	a5,-20(s0)	# tmp91, result
# loadsort.c:53: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	lw	a5,-24(s0)		# tmp94, i
	addi	a5,a5,1	#, tmp93, tmp94
	sw	a5,-24(s0)	# tmp93, i
.L12:
# loadsort.c:53: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	lw	a4,-24(s0)		# tmp95, i
	li	a5,7		# tmp96,
	ble	a4,a5,.L15	#, tmp95, tmp96,
# loadsort.c:60: 	return result;
	lw	a5,-20(s0)		# _19, result
# loadsort.c:61: }
	mv	a0,a5	#, <retval>
	lw	s0,44(sp)		#,
	addi	sp,sp,48	#,,
	jr	ra		#
	.size	str2int, .-str2int
	.align	2
	.globl	getchar
	.type	getchar, @function
getchar:
	addi	sp,sp,-16	#,,
	sw	s0,12(sp)	#,
	addi	s0,sp,16	#,,
# loadsort.c:68: 	while ((*(uart_status_register) & 2)==0);
	nop	
.L18:
# loadsort.c:68: 	while ((*(uart_status_register) & 2)==0);
	li	a5,8192		# tmp79,
	addi	a5,a5,5	#, uart_status_register.2_1, tmp79
	lbu	a5,0(a5)	# tmp80, *uart_status_register.2_1
	andi	a5,a5,0xff	# _2, tmp80
# loadsort.c:68: 	while ((*(uart_status_register) & 2)==0);
	andi	a5,a5,2	#, _4, _3
# loadsort.c:68: 	while ((*(uart_status_register) & 2)==0);
	beqz	a5,.L18	#, _4,
# loadsort.c:69: 	return *(uart_data_register);
	li	a5,8192		# tmp81,
	addi	a5,a5,4	#, uart_data_register.3_5, tmp81
	lbu	a5,0(a5)	# tmp82, *uart_data_register.3_5
	andi	a5,a5,0xff	# _7, tmp82
# loadsort.c:70: }
	mv	a0,a5	#, <retval>
	lw	s0,12(sp)		#,
	addi	sp,sp,16	#,,
	jr	ra		#
	.size	getchar, .-getchar
	.align	2
	.globl	echo
	.type	echo, @function
echo:
	addi	sp,sp,-32	#,,
	sw	ra,28(sp)	#,
	sw	s0,24(sp)	#,
	addi	s0,sp,32	#,,
.L21:
# loadsort.c:76: 		char ch = getchar();
	call	getchar		#
	mv	a5,a0	# tmp73,
	sb	a5,-17(s0)	# tmp73, ch
# loadsort.c:77: 		putchar(ch);
	lbu	a5,-17(s0)	# _1, ch
	mv	a0,a5	#, _1
	call	putchar		#
# loadsort.c:75: 	{
	j	.L21		#
	.size	echo, .-echo
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16	#,,
	sw	ra,12(sp)	#,
	sw	s0,8(sp)	#,
	addi	s0,sp,16	#,,
# loadsort.c:83: 	putchar('e');
	li	a0,101		#,
	call	putchar		#
# loadsort.c:84: 	putchar('e');
	li	a0,101		#,
	call	putchar		#
# loadsort.c:85: 	putchar(getchar());
	call	getchar		#
	mv	a5,a0	# tmp76,
# loadsort.c:85: 	putchar(getchar());
	mv	a0,a5	#, _2
	call	putchar		#
# loadsort.c:86: 	return 0;
	li	a5,0		# _8,
# loadsort.c:87: }
	mv	a0,a5	#, <retval>
	lw	ra,12(sp)		#,
	lw	s0,8(sp)		#,
	addi	sp,sp,16	#,,
	jr	ra		#
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.0"
