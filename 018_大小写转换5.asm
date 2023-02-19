; 使用栈来暂存 CX 的值

; 将 DATA 段中每个单词均改为大写
assume CS:CODE, DS:DATA, SS:STACK

DATA segment
    db 'ibm             '
    db 'dec             '
    db 'dos             '
    db 'vax             '
DATA ends

STACK segment
    dw 0, 0, 0, 0, 0, 0, 0, 0  ; 16字节（够用即可）
STACK ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX
    
    mov AX, STACK
    mov SS, AX
    mov SP, 16     ; 设置栈顶指针
    
    mov BX, 0      ; BX指向字符串的首地址
    mov CX, 4      ; 枚举 4 个字符串
    s1:
    	push CX    ; 暂存 CX 的值
        mov SI, 0  ; 遍历字符串中的每个字符
        mov CX, 3
        s2:
            mov AL, [BX + SI]     ; 将字符串首地址与偏移地址结合起来，指向一个字符
            and AL, 11011111b
            mov [BX + SI], AL
            inc SI
        loop s2
        and BX, 16  ; BX指向下一个字符串
        pop CX      ; 恢复CX的值
    loop s1
    
    mov AX, 4c00h
    int 21h
CODE ends
end start
