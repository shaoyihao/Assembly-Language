; 以十六进制打印 BX 中的数据

assume CS:CODE

CODE segment
start:
    ; mov BX, 1234h

    mov CH, 4      ; 循环次数 
rotate:
    mov CL, 4      
    rol BX, CL     ; 将 BX 中的数据循环左移 4 位
    mov AL, BL     ; 本次所要显示的数据在 BL 中了
    and AL, 0fh    ; 取出 4 位
    add AL, 30h    ; 加上 30h 以将数字转化为对应的 ASCII 码
    cmp AL, 3ah    ; 若加上 30h 后的值比 3ah 小，说明是数字，否则是 A~F
    jl print       ; 直接输出 AL 中的内容
    add AL, 7h     ; A~F 需要再加 7h，才能转化为 ASCII 码
print:
    mov DL, AL     ; 调用 21h 中断的 2 号功能来打印 DL 中的字符
    mov AH, 2
    int 21h
    
    dec CH
    jnz rotate

exit:
    mov AX, 4c00h
    int 21h
CODE ends
end start
