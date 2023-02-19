; 将 datasg 段中每个单词的首字母改为大写。

assume CS:CODE, DS:DATA

DATA segment
    db '1. file         '   ; 字符串的长度为16字节，下标为3的字符为首字母
    db '2. edit         '
    db '3. search       '
    db '4. view         '
    db '5. options      '
    db '6. help         '
DATA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX
	
    mov BX, 0                ; BX指向每个字符串的首地址
    mov CX, 6                ; 循环次数为6（6个字符串）
    s:  
        mov AL, [BX + 3]     ; 单位是字节，所以是AL
       	and AL, 11011111b    ; 使第 5 位为零
       	mov [BX + 3], AL
       	add BX, 16           ; 移至下一行
    loop s

    mov AX, 4c00h
    int 21h
CODE ends
end start
