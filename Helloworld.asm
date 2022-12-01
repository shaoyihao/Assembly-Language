assume CS:code, DS:data

data segment
    db 'Hello world!', '$'  ; '$'作为字符串结束符
data ends

code segment
start:
    ; 设置光标位置
    ; mov BH, 0
    ; mov DH, 5
    ; mov DL, 12
    ; mov AH, 2
    ; int 10h

    ;显示字符串
    mov AX, data
    mov DS, AX
    mov DX, 0  ;设置DS:DX的指向
    mov AH, 9
    int 21h

    mov AX, 4c00h
    int 21h
code ends
end start
