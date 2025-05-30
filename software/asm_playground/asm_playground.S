    .text
    .global main
    .align 4
main:
    jal a0,LC0
    nop
    nop
    nop
    nop
    nop
LC0:
    add a1,a0,100
    lui a5,2
    li  s0,255
    sw s0, 0(a5) # 
    
    ret

    .size	main, .-main
