assume CS:code
data segment
    dw 1, 2, 3, 4, 5, 6, 7, 8  ;定义8个字数据（16个字节）
    dd 0, 0, 0, 0, 0, 0, 0, 0 
data ends

code segment
main:
    mov AX, data
    mov DS, AX
    mov SI, 0  ; SI指向数据段第一组数据的首位置
    mov DI, 16 ; DI指向数据段第二组数据的首位置

    mov CX, 8  ; 枚举第一组中的每个数
    s:
        mov BX, [SI] ;将该数据存入 BX（作为函数实参）
        call cube
        mov [DI], AX    ; 运算结果的低字
        mov [DI].2, DX  ; 运算结果的高字
        add SI, 2 ; 指向下一个字
        add DI, 4 ; 指向下一个存储位置
    loop s
    jmp exit

cube:
    mov AX, BX
    mul BX
    mul BX
    ret

exit: 
    mov AX, 4c00h
    int 21h
code ends
end main
