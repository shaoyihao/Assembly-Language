assume CS:CODE

CODE segment

    dw 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h
    dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;开辟一段空间，之后将这段空间当作栈来使用
start:
    mov AX, CS
    mov SS, AX
    mov SP, 30h ;设置栈顶SS:SP指向CS:30（栈底）

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
