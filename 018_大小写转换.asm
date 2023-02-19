assume CS:CODE, DS:DATA

DATA segment
    db 'BaSic'
DATA ends

CODE segment
start:
    
    mov AX, DATA
    mov DS, AX
    
    mov BX, 0   ; BX用作下标
    mov CX, 5
    s:
        mov AL, [BX]        ; 也可写为 mov AL, 0[BX]  （采用了数组的思想，0即数组的首地址）
        and AL, 11011111B
        mov [BX], AL        ; 也可写为 mov 0[BX], AL
        inc BX
    loop s
    
    mov AX, 4c00h
    int 21h                    
CODE ends
end start
