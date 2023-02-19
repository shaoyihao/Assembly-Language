; 将 code 段中的 a 标号处的 8 个数据累加，结果存储到 b 标号处的字中。

assume CS:code 

code segment
    a: db 1, 2, 3, 4, 5, 6, 7, 8 
    b: dw 0                          ; 标号后有冒号

start:
    mov SI, offset a 
    mov BX, offset b  ; 取出偏移地址

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
