.globl _start
.align	2

_start:

init:
	nop
	li		sp, 20480	# 20480 is top of data space
	call	main
	lui		a5,2
	sw 		zero, 8(a5) # write to address hex 2008, the testbench.v has a condition to stop simulation on this

	#flash the LED on real hardware
	li  	a4,255
.LC1:
	li		a3,1000000
.LC0:
	addi	a3,a3,-1
	bne 	a3,zero,.LC0
	xori 	a4,a4,255
	sw 		a4, 0(a5) # 
	j .LC1
