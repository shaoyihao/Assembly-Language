; 统计 Y 中 比特'1' 的个数

assume CS:CODE, DS:DATA

DATA segment
    addr dw number
    number dw 10    ; 以 Y=10 为例
    count dw ?
DATA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX
    
    mov BX, addr
    mov AX, [BX]  ; 将number中的数存入AX
    
    mov CX, 0  ; 统计1的数目，初始值为0
repeat:
    test AX, 0ffffh
    jz exit    ; 若该数为0，则直接输出结果，退出
    jns shift  ; 若最高位不是1，则移位    （通过 SF 来判断最高位是否为1）
    
    inc CX

shift:
    shl AX, 1  ; 左移1位 （每次其实只判断最高位）
    jmp repeat    

exit:
    mov count, CX    ; 将CX的值存入count单元
    
    mov AX, 4c00h
    int 21h
CODE ends
end start
