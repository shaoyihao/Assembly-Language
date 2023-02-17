assume CS:CODE, DS:DATA

DATA segment
    dd 10    ; 被除数
    dw 3     ; 除数
    dw 0     ; 将商存到这里
DATA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX

    mov AX, DS:[0]
    mov DX, DS:[2]
    div word ptr DS:[4]
    mov DS:[6], AX
    
    mov AX, 4c00h
    int 21h
CODE ends
end start
