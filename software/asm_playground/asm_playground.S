    .text
    .global main
    .align 4
main:
    li  a1,42
    lui a2,1
    add a3,a1,a2
    slt a4,a1,a2
    lui a5,2
    li  s0,255
    sw s0, 0(a5) # 
    
    ret

    .size	main, .-main
