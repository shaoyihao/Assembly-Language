assume CS:CODE, SS:STACK

STACK segment
    dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;开辟一段空间（够用即可），之后将这段空间当作栈来使用
STACK ends

CODE segment

    dw 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h
start:
    mov AX, STACK
    mov SS, AX
    mov SP, 16h ;栈顶SS:SP指向栈底

    mov BX, 0
    mov CX, 8 
    s1: 
        push CS:[BX]
        add BX, 2
    loop s1

    mov BX, 0 
    mov CX, 8
    s2:
        pop CS:[BX]
        add BX, 2
    loop s2
    

    mov AX, 4c00h
    int 21h
CODE ends
end start
