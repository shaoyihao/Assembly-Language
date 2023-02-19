assume CS:code, DS:data

data segment
    str db 'Hello world!', '$'  ; '$'作为字符串结束符
data ends

code segment
start:
    mov AX, data
    ; mov AX, seg str    获取str所在的段地址
    mov DS, AX
    mov DX, offset str  ;获取str所在的偏移地址 
    ; lea DX, str  ;设置DS:DX的指向

    mov AH, 9
    int 21h

    mov AX, 4c00h
    int 21h
code ends
end start
