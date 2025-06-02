    .text
    .global main
    .align 4
main:
LC0:
    li  a0,-1
    addi a1,a0,100
    slt a2,a1,a0
    sltu a3,a1,a0
    lui a5,2
    li  s0,255
    sw s0, 0(a5) # 
    
    j LC0

    .size	main, .-main
