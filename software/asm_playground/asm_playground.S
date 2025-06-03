    .text
    .global main
    .align 4
main:
    li  a0,0
    li a2, 100 # a2 =100 
    li a3, 0 # a3 =0 
    lui a5,2
LC0:
    addi a0,a0,1
    add a3,a3,a0
    # li  s0,255
    sw a3, 0(a5) # 
    # bltu a0,a2,LC0
    call LC2
    sw a0, 0(a5) # 
    

LC1:
    j LC1

LC2:
    li a0, 42 # a0 =42 
    ret
    

    .size	main, .-main
