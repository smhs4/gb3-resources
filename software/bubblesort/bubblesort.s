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
# bubblesort.c:9: 	unsigned char bsort_input[] = {
	lui	a5,%hi(.LC0)	# tmp91,
	addi	a4,s0,-1092	#, tmp92,
	addi	a5,a5,%lo(.LC0)	# tmp93, tmp91,
	li	a3,1062		# tmp94,
	mv	a2,a3	#, tmp94
	mv	a1,a5	#, tmp93
	mv	a0,a4	#, tmp92
	call	memcpy		#
# bubblesort.c:12: 	const int bsort_input_len = 0x426;
	li	a5,1062		# tmp96,
	sw	a5,-28(s0)	# tmp96, bsort_input_len
# bubblesort.c:15: 	int maxindex = bsort_input_len - 1;
	lw	a5,-28(s0)		# tmp98, bsort_input_len
	addi	a5,a5,-1	#, tmp97, tmp98
	sw	a5,-24(s0)	# tmp97, maxindex
# bubblesort.c:17: 	while (maxindex > 0) {
	j	.L2		#
.L6:
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	sw	zero,-20(s0)	#, i
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	j	.L3		#
.L5:
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lw	a5,-20(s0)		# tmp100, i
	addi	a4,s0,-16	#, tmp132,
	add	a5,a4,a5	# tmp100, tmp99, tmp132
	lbu	a4,-1076(a5)	# _1, bsort_input
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lw	a5,-20(s0)		# tmp101, i
	addi	a5,a5,1	#, _2, tmp101
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	addi	a3,s0,-16	#, tmp133,
	add	a5,a3,a5	# _2, tmp102, tmp133
	lbu	a5,-1076(a5)	# _3, bsort_input
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	bleu	a4,a5,.L4	#, _1, _3,
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp104, i
	addi	a4,s0,-16	#, tmp134,
	add	a5,a4,a5	# tmp104, tmp103, tmp134
	lbu	a4,-1076(a5)	# _4, bsort_input
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp105, i
	addi	a5,a5,1	#, _5, tmp105
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	addi	a3,s0,-16	#, tmp135,
	add	a5,a3,a5	# _5, tmp106, tmp135
	lbu	a5,-1076(a5)	# _6, bsort_input
# bubblesort.c:22: 				bsort_input[i] ^= bsort_input[i + 1];
	xor	a5,a4,a5	# _6, tmp107, _4
	andi	a4,a5,0xff	# _7, tmp107
	lw	a5,-20(s0)		# tmp109, i
	addi	a3,s0,-16	#, tmp136,
	add	a5,a3,a5	# tmp109, tmp108, tmp136
	sb	a4,-1076(a5)	# _7, bsort_input
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp110, i
	addi	a5,a5,1	#, _8, tmp110
	addi	a4,s0,-16	#, tmp137,
	add	a5,a4,a5	# _8, tmp111, tmp137
	lbu	a3,-1076(a5)	# _9, bsort_input
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp113, i
	addi	a4,s0,-16	#, tmp138,
	add	a5,a4,a5	# tmp113, tmp112, tmp138
	lbu	a4,-1076(a5)	# _10, bsort_input
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	lw	a5,-20(s0)		# tmp114, i
	addi	a5,a5,1	#, _11, tmp114
	xor	a4,a3,a4	# _10, tmp115, _9
	andi	a4,a4,0xff	# _12, tmp115
	addi	a3,s0,-16	#, tmp139,
	add	a5,a3,a5	# _11, tmp116, tmp139
	sb	a4,-1076(a5)	# _12, bsort_input
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp118, i
	addi	a4,s0,-16	#, tmp140,
	add	a5,a4,a5	# tmp118, tmp117, tmp140
	lbu	a4,-1076(a5)	# _13, bsort_input
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	lw	a5,-20(s0)		# tmp119, i
	addi	a5,a5,1	#, _14, tmp119
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	addi	a3,s0,-16	#, tmp141,
	add	a5,a3,a5	# _14, tmp120, tmp141
	lbu	a5,-1076(a5)	# _15, bsort_input
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	xor	a5,a4,a5	# _15, tmp121, _13
	andi	a4,a5,0xff	# _16, tmp121
	lw	a5,-20(s0)		# tmp123, i
	addi	a3,s0,-16	#, tmp142,
	add	a5,a3,a5	# tmp123, tmp122, tmp142
	sb	a4,-1076(a5)	# _16, bsort_input
.L4:
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	lw	a5,-20(s0)		# tmp125, i
	addi	a5,a5,1	#, tmp124, tmp125
	sw	a5,-20(s0)	# tmp124, i
.L3:
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	lw	a4,-20(s0)		# tmp126, i
	lw	a5,-24(s0)		# tmp127, maxindex
	blt	a4,a5,.L5	#, tmp126, tmp127,
# bubblesort.c:28: 		maxindex--;
	lw	a5,-24(s0)		# tmp129, maxindex
	addi	a5,a5,-1	#, tmp128, tmp129
	sw	a5,-24(s0)	# tmp128, maxindex
.L2:
# bubblesort.c:17: 	while (maxindex > 0) {
	lw	a5,-24(s0)		# tmp130, maxindex
	bgtz	a5,.L6	#, tmp130,
# bubblesort.c:33: 	return *((int *)bsort_input);
	addi	a5,s0,-1092	#, bsort_input.0_17,
# bubblesort.c:33: 	return *((int *)bsort_input);
	lw	a5,0(a5)		# _33, MEM[(int *)bsort_input.0_17]
# bubblesort.c:34: }
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
	sw	s0,28(sp)	#,
	addi	s0,sp,32	#,,
	sw	a0,-20(s0)	# str, str
# bubblesort.c:38: 	while ((*str)!=0)
	j	.L9		#
.L10:
# bubblesort.c:40: 		*((unsigned int *)0x2010) = *(str++);
	lw	a5,-20(s0)		# str.1_1, str
	addi	a4,a5,1	#, tmp77, str.1_1
	sw	a4,-20(s0)	# tmp77, str
# bubblesort.c:40: 		*((unsigned int *)0x2010) = *(str++);
	lbu	a4,0(a5)	# _2, *str.1_1
# bubblesort.c:40: 		*((unsigned int *)0x2010) = *(str++);
	li	a5,8192		# tmp78,
	addi	a5,a5,16	#, _3, tmp78
# bubblesort.c:40: 		*((unsigned int *)0x2010) = *(str++);
	sw	a4,0(a5)	# _4, *_3
.L9:
# bubblesort.c:38: 	while ((*str)!=0)
	lw	a5,-20(s0)		# tmp79, str
	lbu	a5,0(a5)	# _5, *str_6
# bubblesort.c:38: 	while ((*str)!=0)
	bnez	a5,.L10	#, _5,
# bubblesort.c:43: }
	nop	
	lw	s0,28(sp)		#,
	addi	sp,sp,32	#,,
	jr	ra		#
	.size	print, .-print
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16	#,,
	sw	ra,12(sp)	#,
	sw	s0,8(sp)	#,
	addi	s0,sp,16	#,,
.L12:
# bubblesort.c:47: 	*((unsigned int *)0x2000) = 0xff;
	li	a5,8192		# _1,
# bubblesort.c:47: 	*((unsigned int *)0x2000) = 0xff;
	li	a4,255		# tmp75,
	sw	a4,0(a5)	# tmp75, *_1
# bubblesort.c:48: 	sort();
	call	sort		#
# bubblesort.c:49: 	*((unsigned int *)0x2000) = 0x00;
	li	a5,8192		# _2,
# bubblesort.c:49: 	*((unsigned int *)0x2000) = 0x00;
	sw	zero,0(a5)	#, *_2
# bubblesort.c:50: 	sort();
	call	sort		#
# bubblesort.c:47: 	*((unsigned int *)0x2000) = 0xff;
	j	.L12		#
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.0"
