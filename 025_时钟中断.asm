assume CS:CODE, DS:DATA, ES:DATA

DATA segment
    count dw 1
    msg db '9'
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
    
    mov AL, 1ch
    mov AH, 35h
    int 21h    ; 将 1ch 号中断的中断向量送入 ES:BX
    
    push ES    ; 原中断向量的段地址
    push BX    ; 原中断向量的偏移地址
    push DS ; 暂存 DS（下面会覆盖DS）
    
    mov AX, seg ring     
    mov DS, AX
    mov DX, offset ring
    
    mov AL, 1ch
    mov AH, 25h
    int 21h      ; 将 DS:DX 作为 1ch 号中断的中断向量（存入中断向量表）
    
    pop DS
    
    in AL, 21h        ; 21h中断屏蔽寄存器
    and AL, 11111110b
    out 21h, AL       ; 设置中断屏蔽位，允许定时器中断
    sti               ; 开中断
    

    mov DI, 2000
delay:
    mov SI, 30000
delay1:
    dec SI
    jnz delay1
    dec DI
    jnz delay
    
    
    pop DX
    pop DS
    mov AL, 1ch
    mov AH, 25h
    int 21h      ; 恢复 1ch 号中断原来的中断向量
    
    ret  
main endp

ring proc near     ; 自定义中断处理程序
    push DS
    push AX
    push DX
    
    mov AX, DATA
    mov DS, AX
    
    sti      ; 开中断
    dec count
    jnz exit  ; count不为0就继续
    
    mov DL, msg    ; 显示字符
    mov AH, 02h 
    int 21h
    
    dec DL
    cmp DL, 30h  ; 判断是否为0
    jne cnt      
    mov DL, 39h  
cnt:
    mov msg, DL
    mov count, 18    ; 每隔 1s 输出一次
 
exit:
    cli    ;关中断
    pop DX
    pop AX
    pop DS
    iret
ring endp

CODE ends
end start
