assume CS:code

code segment
start:
    mov AX, CS
    mov DS, AX
    mov SI, offset f
    
    mov AX, 0
    mov ES, AX
    mov DI, 200h
    
    mov CX, offset f_end - offset f
    cld 
    rep movsb

    mov AX, 0
    mov ES, AX ;设置段号为0000
    mov word ptr ES:[7Ch*4+2], 0000h
    mov word ptr ES:[7Ch*4], 0200h

    ;程序部分
    mov AX, 3
    int 7ch
    jmp exit

f:
    mul AX
    iret
f_end: nop

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
