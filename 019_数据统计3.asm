; 输入一个字符，统计数据段中已有4个字符串中包含有输入字符的串的个数并显示出来。

assume CS:CODE, DS:DATA

DATA segment
    str1 db 'Happy   '  ; 每个串的长度为8
    str2 db 'Love    '
    str3 db 'Marriage'
    str4 db 'Hate    '
DATA ends

CODE segment
main proc far
start:
    push DS
    sub AX, AX
    push AX
    
    mov AX, DATA
    mov DS, AX
    mov ES, AX
    
    mov AH, 1
    int 21h    ; 输入的字符存储在 AL 中
    
    mov BX, 0
    mov DL, 0  ; 统计结果
search:
    mov CL, 3
    push BX
    shl BX, CL   ; BX 存储所枚举的串的偏移地址   （左移的目的是×8）
    mov DI, BX  
    
    mov CX, 8
    cld
    repne scasb         ; 比较 AL 与 ES:DI 所指向的字节
                        ; CX = 0 或 ZF ≠ 0（遇到相等）时，退出循环
    jne next     ; 并非是由 ZF≠0 导致的循环退出，说明该串中不存在 (AL)，枚举下一个串
    inc DL  
next:
    pop BX
    inc BX     ; 枚举下一个串
    cmp BX, 4  ; (BX)=4时意味着枚举完毕
    jnz search
    
    add DL, 30h ; 转化为 ASCII 码
    mov AH, 2
    int 21h
        
    ret
main endp
CODE ends
end start
