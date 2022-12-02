assume CS:code 

code segment
    a: db 1, 2, 3, 4, 5, 6, 7, 8 
    b: dw 0

start:
    mov SI, offset a 
    mov BX, offset b

    mov CX, 8
    s: 
        mov AL, CS:[SI]
        mov AH, 0
        add CS:[BX], AX 
        inc SI
    loop s

    mov AX, 4C00h 
    int 21h
code ends 
end start
