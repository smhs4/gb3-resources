	.file	"hex_calc.c"
	.option nopic
# GNU C17 (GCC) version 8.2.0 (riscv32-elf)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I ../include -imultilib rv32i/ilp32
# -iprefix /f-of-e-tools/tools/sunflower/sunflower-toolchain/tools/riscv/bin/../lib/gcc/riscv32-elf/8.2.0/
# -D M32 hex_calc.c -march=rv32i -mabi=ilp32 -O0 -Wall -fverbose-asm
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
	.text
	.align	2
	.globl	print
	.type	print, @function
print:
	addi	sp,sp,-32	#,,
	sw	ra,28(sp)	#,
	sw	s0,24(sp)	#,
	addi	s0,sp,32	#,,
	sw	a0,-20(s0)	# str, str
# hex_calc.c:11: 	while ((*str)!=0)
	j	.L2		#
.L3:
# hex_calc.c:13: 		putchar(*(str++));
	lw	a5,-20(s0)		# str.0_1, str
	addi	a4,a5,1	#, tmp76, str.0_1
	sw	a4,-20(s0)	# tmp76, str
# hex_calc.c:13: 		putchar(*(str++));
	lbu	a5,0(a5)	# _2, *str.0_1
# hex_calc.c:13: 		putchar(*(str++));
	mv	a0,a5	#, _3
	call	putchar		#
.L2:
# hex_calc.c:11: 	while ((*str)!=0)
	lw	a5,-20(s0)		# tmp77, str
	lbu	a5,0(a5)	# _4, *str_5
# hex_calc.c:11: 	while ((*str)!=0)
	bnez	a5,.L3	#, _4,
# hex_calc.c:15: }
	nop	
	lw	ra,28(sp)		#,
	lw	s0,24(sp)		#,
	addi	sp,sp,32	#,,
	jr	ra		#
	.size	print, .-print
	.globl	buffer1
	.section	.rodata
	.align	2
.LC0:
	.string	"        "
	.section	.sdata,"aw"
	.align	2
	.type	buffer1, @object
	.size	buffer1, 4
buffer1:
	.word	.LC0
	.globl	buffer2
	.section	.rodata
	.align	2
.LC1:
	.string	"12345678"
	.section	.sdata
	.align	2
	.type	buffer2, @object
	.size	buffer2, 4
buffer2:
	.word	.LC1
	.text
	.align	2
	.globl	str2int
	.type	str2int, @function
str2int:
	addi	sp,sp,-48	#,,
	sw	s0,44(sp)	#,
	addi	s0,sp,48	#,,
	sw	a0,-36(s0)	# input, input
# hex_calc.c:21: 	int result = 0;
	sw	zero,-20(s0)	#, result
# hex_calc.c:22: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	sw	zero,-24(s0)	#, i
# hex_calc.c:22: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	j	.L5		#
.L8:
# hex_calc.c:24: 		char temp = input[7-i];
	li	a4,7		# tmp80,
	lw	a5,-24(s0)		# tmp81, i
	sub	a5,a4,a5	# _1, tmp80, tmp81
	mv	a4,a5	# _2, _1
# hex_calc.c:24: 		char temp = input[7-i];
	lw	a5,-36(s0)		# tmp82, input
	add	a5,a5,a4	# _2, _3, tmp82
# hex_calc.c:24: 		char temp = input[7-i];
	lbu	a5,0(a5)	# tmp83, *_3
	sb	a5,-25(s0)	# tmp83, temp
# hex_calc.c:25: 		if (temp > 0x40) temp = temp-0x41+10; //A to F
	lbu	a4,-25(s0)	# tmp84, temp
	li	a5,64		# tmp85,
	bleu	a4,a5,.L6	#, tmp84, tmp85,
# hex_calc.c:25: 		if (temp > 0x40) temp = temp-0x41+10; //A to F
	lbu	a5,-25(s0)	# tmp86, temp
	addi	a5,a5,-55	#, tmp87, tmp86
	sb	a5,-25(s0)	# tmp87, temp
	j	.L7		#
.L6:
# hex_calc.c:26: 		else temp = temp-0x30;
	lbu	a5,-25(s0)	# tmp88, temp
	addi	a5,a5,-48	#, tmp89, tmp88
	sb	a5,-25(s0)	# tmp89, temp
.L7:
# hex_calc.c:27: 		result += temp << (i*4);
	lbu	a4,-25(s0)	# _4, temp
# hex_calc.c:27: 		result += temp << (i*4);
	lw	a5,-24(s0)		# tmp90, i
	slli	a5,a5,2	#, _5, tmp90
# hex_calc.c:27: 		result += temp << (i*4);
	sll	a5,a4,a5	# _5, _6, _4
# hex_calc.c:27: 		result += temp << (i*4);
	lw	a4,-20(s0)		# tmp92, result
	add	a5,a4,a5	# _6, tmp91, tmp92
	sw	a5,-20(s0)	# tmp91, result
# hex_calc.c:22: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	lw	a5,-24(s0)		# tmp94, i
	addi	a5,a5,1	#, tmp93, tmp94
	sw	a5,-24(s0)	# tmp93, i
.L5:
# hex_calc.c:22: 	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	lw	a4,-24(s0)		# tmp95, i
	li	a5,7		# tmp96,
	ble	a4,a5,.L8	#, tmp95, tmp96,
# hex_calc.c:29: 	return result;
	lw	a5,-20(s0)		# _19, result
# hex_calc.c:30: }
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
# hex_calc.c:37: 	while ((*(uart_status_register) & 2)==0);
	nop	
.L11:
# hex_calc.c:37: 	while ((*(uart_status_register) & 2)==0);
	li	a5,8192		# tmp79,
	addi	a5,a5,5	#, uart_status_register.1_1, tmp79
	lbu	a5,0(a5)	# tmp80, *uart_status_register.1_1
	andi	a5,a5,0xff	# _2, tmp80
# hex_calc.c:37: 	while ((*(uart_status_register) & 2)==0);
	andi	a5,a5,2	#, _4, _3
# hex_calc.c:37: 	while ((*(uart_status_register) & 2)==0);
	beqz	a5,.L11	#, _4,
# hex_calc.c:38: 	return *(uart_data_register);
	li	a5,8192		# tmp81,
	addi	a5,a5,4	#, uart_data_register.2_5, tmp81
	lbu	a5,0(a5)	# tmp82, *uart_data_register.2_5
	andi	a5,a5,0xff	# _7, tmp82
# hex_calc.c:39: }
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
.L14:
# hex_calc.c:45: 		char ch = getchar();
	call	getchar		#
	mv	a5,a0	# tmp73,
	sb	a5,-17(s0)	# tmp73, ch
# hex_calc.c:46: 		putchar(ch);
	lbu	a5,-17(s0)	# _1, ch
	mv	a0,a5	#, _1
	call	putchar		#
# hex_calc.c:44: 	{
	j	.L14		#
	.size	echo, .-echo
	.section	.rodata
	.align	2
.LC2:
	.string	"\r\ntest\r\n"
	.align	2
.LC3:
	.string	"\r\nplease enter a 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n"
	.align	2
.LC4:
	.string	"\r\nplease enter another 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n"
	.align	2
.LC5:
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
# hex_calc.c:52: 	print("\r\ntest\r\n");
	lui	a5,%hi(.LC2)	# tmp94,
	addi	a0,a5,%lo(.LC2)	#, tmp94,
	call	print		#
# hex_calc.c:53: 	printhex(0x12345678);
	li	a5,305418240		# tmp95,
	addi	a0,a5,1656	#,, tmp95
	call	printhex		#
# hex_calc.c:54: 	print("\r\nplease enter a 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n");
	lui	a5,%hi(.LC3)	# tmp96,
	addi	a0,a5,%lo(.LC3)	#, tmp96,
	call	print		#
# hex_calc.c:55: 	for (int i = 0; i < 8; i++)
	sw	zero,-20(s0)	#, i
# hex_calc.c:55: 	for (int i = 0; i < 8; i++)
	j	.L16		#
.L17:
# hex_calc.c:57: 		buffer1[i] = getchar();
	lui	a5,%hi(buffer1)	# tmp97,
	lw	a4,%lo(buffer1)(a5)		# buffer1.3_1, buffer1
	lw	a5,-20(s0)		# i.4_2, i
	add	s1,a4,a5	# i.4_2, _3, buffer1.3_1
# hex_calc.c:57: 		buffer1[i] = getchar();
	call	getchar		#
	mv	a5,a0	# tmp98,
# hex_calc.c:57: 		buffer1[i] = getchar();
	sb	a5,0(s1)	# _4, *_3
# hex_calc.c:58: 		putchar(buffer1[i]);
	lui	a5,%hi(buffer1)	# tmp99,
	lw	a4,%lo(buffer1)(a5)		# buffer1.5_5, buffer1
	lw	a5,-20(s0)		# i.6_6, i
	add	a5,a4,a5	# i.6_6, _7, buffer1.5_5
	lbu	a5,0(a5)	# _8, *_7
# hex_calc.c:58: 		putchar(buffer1[i]);
	mv	a0,a5	#, _9
	call	putchar		#
# hex_calc.c:55: 	for (int i = 0; i < 8; i++)
	lw	a5,-20(s0)		# tmp101, i
	addi	a5,a5,1	#, tmp100, tmp101
	sw	a5,-20(s0)	# tmp100, i
.L16:
# hex_calc.c:55: 	for (int i = 0; i < 8; i++)
	lw	a4,-20(s0)		# tmp102, i
	li	a5,7		# tmp103,
	ble	a4,a5,.L17	#, tmp102, tmp103,
# hex_calc.c:60: 	print("\r\nplease enter another 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n");
	lui	a5,%hi(.LC4)	# tmp104,
	addi	a0,a5,%lo(.LC4)	#, tmp104,
	call	print		#
# hex_calc.c:61: 	for (int i = 0; i < 8; i++)
	sw	zero,-24(s0)	#, i
# hex_calc.c:61: 	for (int i = 0; i < 8; i++)
	j	.L18		#
.L19:
# hex_calc.c:63: 		buffer2[i] = getchar();
	lui	a5,%hi(buffer2)	# tmp105,
	lw	a4,%lo(buffer2)(a5)		# buffer2.7_10, buffer2
	lw	a5,-24(s0)		# i.8_11, i
	add	s1,a4,a5	# i.8_11, _12, buffer2.7_10
# hex_calc.c:63: 		buffer2[i] = getchar();
	call	getchar		#
	mv	a5,a0	# tmp106,
# hex_calc.c:63: 		buffer2[i] = getchar();
	sb	a5,0(s1)	# _13, *_12
# hex_calc.c:64: 		putchar(buffer2[i]);
	lui	a5,%hi(buffer2)	# tmp107,
	lw	a4,%lo(buffer2)(a5)		# buffer2.9_14, buffer2
	lw	a5,-24(s0)		# i.10_15, i
	add	a5,a4,a5	# i.10_15, _16, buffer2.9_14
	lbu	a5,0(a5)	# _17, *_16
# hex_calc.c:64: 		putchar(buffer2[i]);
	mv	a0,a5	#, _18
	call	putchar		#
# hex_calc.c:61: 	for (int i = 0; i < 8; i++)
	lw	a5,-24(s0)		# tmp109, i
	addi	a5,a5,1	#, tmp108, tmp109
	sw	a5,-24(s0)	# tmp108, i
.L18:
# hex_calc.c:61: 	for (int i = 0; i < 8; i++)
	lw	a4,-24(s0)		# tmp110, i
	li	a5,7		# tmp111,
	ble	a4,a5,.L19	#, tmp110, tmp111,
# hex_calc.c:66: 	int number_A = str2int(buffer1);
	lui	a5,%hi(buffer1)	# tmp112,
	lw	a5,%lo(buffer1)(a5)		# buffer1.11_19, buffer1
	mv	a0,a5	#, buffer1.11_19
	call	str2int		#
	sw	a0,-28(s0)	#, number_A
# hex_calc.c:67: 	int number_B = str2int(buffer2);
	lui	a5,%hi(buffer2)	# tmp113,
	lw	a5,%lo(buffer2)(a5)		# buffer2.12_20, buffer2
	mv	a0,a5	#, buffer2.12_20
	call	str2int		#
	sw	a0,-32(s0)	#, number_B
# hex_calc.c:68: 	print("\r\n");
	lui	a5,%hi(.LC5)	# tmp114,
	addi	a0,a5,%lo(.LC5)	#, tmp114,
	call	print		#
# hex_calc.c:69: 	printhex(number_A);
	lw	a0,-28(s0)		#, number_A
	call	printhex		#
# hex_calc.c:70: 	print("\r\n");
	lui	a5,%hi(.LC5)	# tmp115,
	addi	a0,a5,%lo(.LC5)	#, tmp115,
	call	print		#
# hex_calc.c:71: 	printhex(number_B);
	lw	a0,-32(s0)		#, number_B
	call	printhex		#
# hex_calc.c:73: 	int sum = number_A+number_B;
	lw	a4,-28(s0)		# tmp117, number_A
	lw	a5,-32(s0)		# tmp118, number_B
	add	a5,a4,a5	# tmp118, tmp116, tmp117
	sw	a5,-36(s0)	# tmp116, sum
# hex_calc.c:74: 	print("\r\n");
	lui	a5,%hi(.LC5)	# tmp119,
	addi	a0,a5,%lo(.LC5)	#, tmp119,
	call	print		#
# hex_calc.c:75: 	printhex(sum);
	lw	a0,-36(s0)		#, sum
	call	printhex		#
	li	a5,0		# _51,
# hex_calc.c:76: }
	mv	a0,a5	#, <retval>
	lw	ra,44(sp)		#,
	lw	s0,40(sp)		#,
	lw	s1,36(sp)		#,
	addi	sp,sp,48	#,,
	jr	ra		#
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.0"
