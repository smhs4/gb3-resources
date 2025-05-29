.globl _start
.align	2

_start:

init:
	nop
	li		sp, 20480	# 4096 (== 0x1000) for the code section plus another 1k for the data section !!!WRONG!!! It should be 4096+1024 WORDS (4 bytes per word), NOT BYTE
	j		main
