; 如何累加 ffff:0 ~ ffff:b 中的所有数据，并将结果存储在 DX 中？

assume CS:CODE

CODE segment
start:

    mov AX, 0ffffh
    mov DS, AX 

    mov DX, 0
    mov BX, 0 
    mov CX, 12
    s:
        mov AL, [BX]
        mov AH, 0
        add DX, AX
        inc BX 
    loop s


    mov AX, 4c00h
    int 21h
CODE ends
end start
