; 已知数组 A 包含 15 个互不相等的整数，数组 B 包含 20 个互不相等的整数。
; 统计既在 A 中出现又在 B 中出现的元素的个数，并以十进制显示出来。

assume CS:CODE, DS:DATA

DATA segment
    A db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
    B db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
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
 
    mov BX, 0          ; 记录结果
    mov SI, 0          ; 指向 A 中的元素
    mov CX, 15         ; 枚举 A 中的某个元素
    s:
        mov AL, A[SI]
        push CX        ; 暂存外层循环次数
        
        mov CX, 20     ; 遍历 B 中所有元素
        lea DI, B
        cld
        repne scasb    ; 比较 (AL) 与 ES:DI 所指向的字节，遇到相等即退出
        
        jne noo      ; 没有找到相等的
        inc BX       ; 找到相等了，答案 + 1
    noo:
        inc SI    ; 枚举下一个 A 中的元素
        pop CX
    loop s
    ; 此时 BX 中存储着最终结果
    
    mov CL, 10
    mov AX, BX
    div CL       ; AX ÷ CL = AL ... AH        AX ÷ 10 = AL ... AH    AL是十位，AH为个位 
    
    mov BH, AH
    
    mov DL, AL   ; 显示 AL 的值
    add DL, 30h
    mov AH, 02
    int 21h
    
    mov DL, BH   ; 显示 BH（AH）的值
    add DL, 30h
    mov AH, 02
    int 21h
                
    ret
main endp
CODE ends
end start
