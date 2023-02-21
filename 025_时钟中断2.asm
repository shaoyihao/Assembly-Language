;编写一个中断处理程序，要求在主程序运行期间，
; 每隔 10秒响铃一次，同时显示‘The bell is ring!’
assume cs:codesg, ds:datasg, es:datasg

datasg segment
    count dw 1
    mess db 'The bell is ring!', 0ah, 0dh, '$'
datasg ends

codesg segment
main proc far
start:
    push DS
    sub AX, AX
    push AX
    
    mov ax, datasg
    mov ds, ax
    mov es, ax

    mov al, 1ch    ;中断号
    mov ah, 35h
    int 21h       ;取原中断向量

    push es
    push bx       ;存放在es:bx中，保存原中断向量
    push ds       ;保护数据段

    
    mov ax, seg ring
    mov ds, ax            ;设置新的中断向量 ds:dx
    mov dx, offset ring

    mov al, 1ch
    mov ah, 25h
    int 21h      

    pop ds        ;设置完取出数据段
    in al, 21h     ;21h中断屏蔽寄存器
    and al, 11111110b
    out 21h, al          ;设置中断屏蔽位，允许定时器中断
    sti  
                   ;开中断
    mov di, 2000
delay:
    mov si, 30000
delay1:
    dec si
    jnz delay1
    dec di
    jnz delay

    pop dx
    pop ds
    mov al, 1ch
    mov ah, 25h
    int 21h
    ret 
main endp

ring proc far
    push ds
    push ax
    push dx

    mov ax, datasg
    mov ds, ax

    sti    ;开中断，允许更高级的中断
    ; EOI    ;允许同级或低级的中断
    dec count
    jnz exit

    mov dx, offset mess     ;显示The bell is ring
    mov ah, 09
    int 21h

    mov count, 18
exit:
    cli           ;关中断
    pop dx
    pop ax
    pop ds
    iret
ring endp

codesg ends
end start
