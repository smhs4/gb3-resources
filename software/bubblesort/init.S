.globl _start
.align	2

_start:

init:
	nop
	li		sp, 20480	# 20480 is top of data space
.LC1:
	call	main
	lui		a5,2
	sb 		zero, 8(a5) # write to address hex 2008, the testbench.v has a condition to stop simulation on this
	#flash the LED on real hardware
	li  	a4,255
	sw 		a4, 0(a5)
	call 	main
	lui		a5,2
	li  	a4,0
	sb 		a4, 0(a5)
	j .LC1
