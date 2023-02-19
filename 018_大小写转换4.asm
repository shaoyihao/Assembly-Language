; 在 018_大小写转换4.asm 中，是用 DX 来暂存主循环中 CX 的值。除此之外还可以直接用一个内存单元来存储 CX 的值，这样就节省出了寄存器 DX。

; 将 DATA 段中每个单词均改为大写
assume CS:CODE, DS:DATA

DATA segment
    db 'ibm             '
    db 'dec             '
    db 'dos             '
    db 'vax             '
    dw 0   ; 定义一个字（地址为 DATA:40h），用来暂存 CX
DATA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX
    
    mov BX, 0      ; BX指向字符串的首地址
    mov CX, 4      ; 枚举 4 个字符串
    s1:
        mov DS:[40h], CX ;将主循环的循环次数存储到 DATA:40H 单元中
        mov SI, 0  ; 遍历字符串中的每个字符
        mov CX, 3
        s2:
            mov AL, [BX + SI]     ; 将字符串首地址与偏移地址结合起来，指向一个字符
            and AL, 11011111b
            mov [BX + SI], AL
            inc SI
        loop s2
        and BX, 16  ; BX指向下一个字符串
        mov CX, DS:[40h]  ; 恢复CX的值
    loop s1
    
    mov AX, 4c00h
    int 21h
CODE ends
end start
