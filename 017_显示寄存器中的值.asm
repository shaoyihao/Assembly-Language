; 显示 AL 中的数据（以十六进制的形式）

assume CS:code

code segment
    table db '0123456789ABCDEF' 
start:
    mov AL, 45h   ; 要显示的字节数据X存放于AL中
    call showbyte
    jmp exit

showbyte:
    mov AH, AL
    mov CL, 4  ;设置右移位数
    shr AH, CL     ;此时AH中为X的高4位    
    and AL, 00001111b  ;AL中为X的低4位

    mov BL, AH
    mov BH, 0
    mov DL, table[BX] ;将高4位对应的值作为下标，取出对应的字符
    call display

    mov BL, AL
    mov BH, 0
    mov DL, table[BX] ;将低4位对应的值作为下标，取出对应的字符
    call display
    
    ret

display:
    push AX    ;会修改AX的值
    mov AH, 2
    int 21h  
    pop AX
    ret

exit:
    mov AX, 4C00h
    int 21h
code ends
end start
