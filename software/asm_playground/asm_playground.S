	.text
	.section	.rodata
	.align	2
.LC0:
	lui		a5,2
	sw 		zero, 8(a5) # write to address hex 2008, the testbench.v has a condition to stop simulation on this

	#flash the LED on real hardware
	li  	a4,255
.LC1:
	li		a3,262144
.LC2:
	addi	a3,a3,-1
	bne 	a3,zero,.LC2
	xori 	a4,a4,255
	sw 		a4, 0(a5) # 
    # j .LC0
# .LC1:
	j .LC1
	.word 0x00000001

    .text
    .global main
    .align 4
main:
    lui a5,1
    li a0,0x007006b7
    sw a0,12(a5)
    j 0x1000
    lui a5,2
    # li a0,0x00000055
    li a1,0x1000
bigloop:
    li  t3,16384
mainloop:
    # sw a1,80(a1)
    li a0, 0xffffffff # a0 =0xffffffff 
    # sw a0,0(a1)
    lw a0,0(a1)
    # ori a0,a0,0x55
    li t2, 32 # t2 =32 
    
outloop:
    srl t1,a0,31
    sll a0,a0,1
    sb t1,0(a5)
    addi t2, t2, -1 # t2 =t21 -1m
    bnez t2,outloop
    nop
    nop
    sw zero,8(a5)
    sb zero,0(a5)
    addi t3,t3,-1
    bnez t3,mainloop
    addi a1,a1,4
    andi a1,a1,0x7ff
    li a0,16384
    or  a1,a1,a0
    j bigloop

# LC1:
#     lui a5,2
#     li a4,42
#     sb a4,0(a5)
#     sw zero,8(a5)
#     j LC1

# LC2:
#     li a0, 42 # a0 =42 
#     ret
    

    .size	main, .-main
