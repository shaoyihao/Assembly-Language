    mov CX, N 
    mov AX, 0
    mov SI, 0
    s:
        add AX, array[SI]
        add SI, 2
    loop s
    mov RES, AX
