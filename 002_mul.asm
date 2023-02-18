assume CS:CODE, DS:DATA

DATA segment
    dw 2  ; 乘数1
    dw 3  ; 乘数2
    dd 0  ; 存放积的低16位
DATA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX

    mov AX, DS:[0]
    mul word ptr DS:[2]  ; 乘数2存储于内存中
    mov DS:[4], AX

    mov AX, 4c00h
    int 21h
CODE ends
end start
