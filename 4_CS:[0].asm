assume CS:CODE

CODE segment
    dw 1, 1, 1, 1, 1, 1, 1  ; 在代码段前定义数据，从而可以直接用 CS:[0]、CS:[2]、...调用
start:
    mov AX, 0  ; 将计算结果存储于AX
    mov BP, 0  ; “数组下标”

    mov CX, 7  ; 7个数相加
    s:   
        add AX, CS:[BP]
        add SP, 2
    loop s

    mov AX, 4c00h
    int 21h
CODE ends
end start
