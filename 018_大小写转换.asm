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
        mov AL, [BX]
        and AL, 11011111B
        mov [BX], AL
        inc BX
    loop s
    
    mov AX, 4c00h
    int 21h                    
CODE ends
end start
