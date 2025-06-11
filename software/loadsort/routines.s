# 	.align	4
# 	.globl	func_name
# 	.type	func_name, @function
# func_name:
# 	.size	func_name, .-func_name
	.align	4
	.globl	putchar
	.type	putchar, @function
putchar:        #a0 = character to be output
	lui t1,2		#hex 2000, MMIO base address
.wait_uart:
	lbu	t0,5(t1)	#uart status register
	andi t0,t0,0x01	#bit 1: uart is busy
	bnez t0,.wait_uart
	sb a0,4(t1)
    ret
	.size	putchar, .-putchar


	.align	4
	.globl	printhex
	.type	printhex, @function
printhex:   #print the value of a0 as hex
    addi sp,sp,-16   #2 words of space
    sw ra,12(sp)
    sw  s0,8(sp)    #apparently this is a fashionable thing to do
    addi s0,sp,16
    li t1,8
.printhex_loop:
	srl t0,a0,28    # top 4 bits of a0 to t0
    sll a0,a0,4     # drop top 4 bits

	addi t2,t0,65-10
	slti t0,t0,10
	sub t2, t2, t0 # t2 = t2 - t0
	slli t0,t0,1	#times 2
	sub t2, t2, t0 # t2 = t2 - t0
	slli t0,t0,1	#times 2
	sub t2, t2, t0 # t2 = t2 - t0, these three subtractions subtracts 7 from the ascii code if the number
    sw a0,0(sp)
    sw t1,4(sp)
    mv a0,t2
    call putchar
    lw a0,0(sp)
    lw t1,4(sp)
    addi t1,t1,-1
    bnez t1,.printhex_loop
.printhex_exit:
    lw s0,8(sp)
    lw ra,12(sp)
    addi sp,sp,16
    ret
	.size	printhex, .-printhex
