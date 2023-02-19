assume CS:code 

code segment
    a db 1, 2, 3, 4, 5, 6, 7, 8 ;标号后无冒号
    b dw 0                      
    ;标号“a”表示了地址code:0和从该地址开始之后的内存单元都是字节单元
    ;标号“b”表示了地址code:8和从该地址开始之后的内存单元都是字单元

start:
    mov SI, 0

    mov CX, 8
    s: 
        mov AL, a[SI]
        mov AH, 0
        add b, AX    ; b直接代表着一个字单元
        inc SI
    loop s

    mov AX, 4C00h 
    int 21h
code ends 
end start
