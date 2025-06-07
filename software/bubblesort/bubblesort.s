	.file	"bubblesort.c"
	.option nopic
# GNU C17 (GCC) version 8.2.0 (riscv32-elf)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I ../include -imultilib rv32i/ilp32
# -iprefix /f-of-e-tools/tools/sunflower/sunflower-toolchain/tools/riscv/bin/../lib/gcc/riscv32-elf/8.2.0/
# -D M32 bubblesort.c -march=rv32i -mabi=ilp32 -O2 -Wall -fverbose-asm
# options enabled:  -faggressive-loop-optimizations -falign-functions
# -falign-jumps -falign-labels -falign-loops -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcode-hoisting -fcombine-stack-adjustments -fcommon
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fipa-vrp
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns
# -fschedule-insns2 -fsection-anchors -fsemantic-interposition
# -fshow-column -fshrink-wrap -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-backprop -fssa-phiopt
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss
# -mexplicit-relocs -mplt -mstrict-align

	.text
	.align	2
	.globl	sort
	.type	sort, @function
sort:
	addi	sp,sp,-1072	#,,
# bubblesort.c:9: 	unsigned char bsort_input[] = {
	lui	a5,%hi(.LANCHOR0)	# tmp84,
	addi	a5,a5,%lo(.LANCHOR0)	# tmp85, tmp84,
	addi	a1,sp,8	#, tmp99,
	mv	a4,a1	# tmp86, tmp99
	addi	t1,a5,1060	#, tmp87, tmp85
.L2:
	lw	a7,0(a5)		# tmp88,
	lw	a6,4(a5)		# tmp89,
	lw	a0,8(a5)		# tmp90,
	lw	a2,12(a5)		# tmp91,
	lw	a3,16(a5)		# tmp92,
	sw	a7,0(a4)	# tmp88,
	sw	a6,4(a4)	# tmp89,
	sw	a0,8(a4)	# tmp90,
	sw	a2,12(a4)	# tmp91,
	sw	a3,16(a4)	# tmp92,
	addi	a5,a5,20	#, tmp85, tmp85
	addi	a4,a4,20	#, tmp86, tmp86
	bne	a5,t1,.L2	#, tmp85, tmp87,
	lhu	a5,0(a5)	#,
	li	a2,1061		# ivtmp_4,
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	not	a1,a1	# tmp95, tmp99
# bubblesort.c:9: 	unsigned char bsort_input[] = {
	sh	a5,0(a4)	# tmp93,
.L3:
	addi	a5,sp,9	#, tmp101,
.L5:
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lbu	a3,-1(a5)	# _1, MEM[base: _29, offset: 4294967295B]
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	lbu	a4,0(a5)	# _3, MEM[base: _29, offset: 0B]
# bubblesort.c:20: 			if (bsort_input[i] > bsort_input[i + 1]) {
	bleu	a3,a4,.L4	#, _1, _3,
# bubblesort.c:23: 				bsort_input[i + 1] ^= bsort_input[i];
	sb	a3,0(a5)	# _1, MEM[base: _29, offset: 0B]
# bubblesort.c:24: 				bsort_input[i] ^= bsort_input[i + 1];
	sb	a4,-1(a5)	# _3, MEM[base: _29, offset: 4294967295B]
.L4:
	addi	a5,a5,1	#, ivtmp.5, ivtmp.5
# bubblesort.c:19: 		for (i = 0; i < maxindex; i++) {
	add	a4,a1,a5	# ivtmp.5, tmp96, tmp95
	blt	a4,a2,.L5	#, tmp96, ivtmp_4,
	addi	a2,a2,-1	#, ivtmp_4, ivtmp_4
# bubblesort.c:17: 	while (maxindex > 0) {
	bnez	a2,.L3	#, ivtmp_4,
# bubblesort.c:34: }
	lw	a0,8(sp)		#, MEM[(int *)&bsort_input]
	addi	sp,sp,1072	#,,
	jr	ra		#
	.size	sort, .-sort
	.align	2
	.globl	print
	.type	print, @function
print:
# bubblesort.c:41: 	while ((*str)!=0)
	lbu	a3,0(a0)	# _3, MEM[base: str_4, offset: 0B]
# bubblesort.c:43: 		while((*(uart_status_register) & 1)!=0);
	li	a4,8192		# tmp85,
# bubblesort.c:41: 	while ((*str)!=0)
	beqz	a3,.L18	#, _3,
.L13:
# bubblesort.c:43: 		while((*(uart_status_register) & 1)!=0);
	lbu	a5,5(a4)	#, MEM[(volatile char *)8197B]
# bubblesort.c:43: 		while((*(uart_status_register) & 1)!=0);
	andi	a5,a5,1	#, tmp82, MEM[(volatile char *)8197B]
	bnez	a5,.L13	#, tmp82,
# bubblesort.c:44: 		*(uart_data_register) = *(str++);
	addi	a0,a0,1	#, str, str
# bubblesort.c:44: 		*(uart_data_register) = *(str++);
	sb	a3,4(a4)	# _3, MEM[(volatile char *)8196B]
	li	a5,200		# ivtmp_5,
.L14:
# bubblesort.c:46: 			__asm__("nop");
 #APP
# 46 "bubblesort.c" 1
	nop
# 0 "" 2
 #NO_APP
	addi	a5,a5,-1	#, ivtmp_5, ivtmp_5
# bubblesort.c:45: 		for(int i = 0; i <200; i++){
	bnez	a5,.L14	#, ivtmp_5,
# bubblesort.c:41: 	while ((*str)!=0)
	lbu	a3,0(a0)	# _3, MEM[base: str_4, offset: 0B]
# bubblesort.c:41: 	while ((*str)!=0)
	bnez	a3,.L13	#, _3,
.L18:
# bubblesort.c:49: }
	ret	
	.size	print, .-print
	.align	2
	.globl	getchar
	.type	getchar, @function
getchar:
# bubblesort.c:52: {
	li	a5,200		# ivtmp_2,
.L20:
# bubblesort.c:54: 		__asm__("nop");
 #APP
# 54 "bubblesort.c" 1
	nop
# 0 "" 2
 #NO_APP
	addi	a5,a5,-1	#, ivtmp_2, ivtmp_2
# bubblesort.c:53: 	for(int i = 0; i <200; i++){
	bnez	a5,.L20	#, ivtmp_2,
# bubblesort.c:56: 	while ((*(uart_status_register) & 2)==0);
	li	a4,8192		# tmp77,
.L21:
# bubblesort.c:56: 	while ((*(uart_status_register) & 2)==0);
	lbu	a5,5(a4)	#, MEM[(volatile char *)8197B]
# bubblesort.c:56: 	while ((*(uart_status_register) & 2)==0);
	andi	a5,a5,2	#, tmp81, MEM[(volatile char *)8197B]
	beqz	a5,.L21	#, tmp81,
# bubblesort.c:57: 	return *(uart_data_register);
	lbu	a0,4(a4)	#, MEM[(volatile char *)8196B]
# bubblesort.c:58: }
	ret	
	.size	getchar, .-getchar
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16	#,,
# bubblesort.c:56: 	while ((*(uart_status_register) & 2)==0);
	li	a4,8192		# tmp82,
.L31:
# bubblesort.c:66: 	int temp = 0;
	sw	zero,12(sp)	#, temp
	li	a5,200		# ivtmp_10,
.L26:
# bubblesort.c:54: 		__asm__("nop");
 #APP
# 54 "bubblesort.c" 1
	nop
# 0 "" 2
 #NO_APP
	addi	a5,a5,-1	#, ivtmp_10, ivtmp_10
# bubblesort.c:53: 	for(int i = 0; i <200; i++){
	bnez	a5,.L26	#, ivtmp_10,
.L27:
# bubblesort.c:56: 	while ((*(uart_status_register) & 2)==0);
	lbu	a5,5(a4)	#, MEM[(volatile char *)8197B]
# bubblesort.c:56: 	while ((*(uart_status_register) & 2)==0);
	andi	a5,a5,2	#, tmp86, MEM[(volatile char *)8197B]
	beqz	a5,.L27	#, tmp86,
# bubblesort.c:57: 	return *(uart_data_register);
	lbu	a3,4(a4)	#, MEM[(volatile char *)8196B]
# bubblesort.c:68: 	*hello = getchar();
	addi	a2,sp,12	#, tmp101,
# bubblesort.c:57: 	return *(uart_data_register);
	andi	a3,a3,0xff	# prephitmp_13, MEM[(volatile char *)8196B]
# bubblesort.c:68: 	*hello = getchar();
	sb	a3,12(sp)	# prephitmp_13, MEM[(char *)&temp]
.L28:
# bubblesort.c:41: 	while ((*str)!=0)
	beqz	a3,.L31	#, prephitmp_13,
.L29:
# bubblesort.c:43: 		while((*(uart_status_register) & 1)!=0);
	lbu	a5,5(a4)	#, MEM[(volatile char *)8197B]
# bubblesort.c:43: 		while((*(uart_status_register) & 1)!=0);
	andi	a5,a5,1	#, tmp95, MEM[(volatile char *)8197B]
	bnez	a5,.L29	#, tmp95,
# bubblesort.c:44: 		*(uart_data_register) = *(str++);
	addi	a2,a2,1	#, str, str
# bubblesort.c:44: 		*(uart_data_register) = *(str++);
	sb	a3,4(a4)	# prephitmp_13, MEM[(volatile char *)8196B]
	li	a5,200		# ivtmp_11,
.L30:
# bubblesort.c:46: 			__asm__("nop");
 #APP
# 46 "bubblesort.c" 1
	nop
# 0 "" 2
 #NO_APP
	addi	a5,a5,-1	#, ivtmp_11, ivtmp_11
# bubblesort.c:45: 		for(int i = 0; i <200; i++){
	bnez	a5,.L30	#, ivtmp_11,
	lbu	a3,0(a2)	# prephitmp_13, MEM[base: str_9, offset: 0B]
	j	.L28		#
	.size	main, .-main
	.globl	uart_status_register
	.globl	uart_data_register
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
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
	.section	.srodata,"a"
	.align	2
	.type	uart_status_register, @object
	.size	uart_status_register, 4
uart_status_register:
	.word	8197
	.type	uart_data_register, @object
	.size	uart_data_register, 4
uart_data_register:
	.word	8196
	.ident	"GCC: (GNU) 8.2.0"
