; 已知在存储器中有一个首地址为 array 的 N 字数组，统计其中正数、0及负数的个数。
; 正数的个数放在 DI 中，0的个数放在 SI 中，并根据 N-(DI)-(SI) 求得负数的个数，放在 AX 中。如果有负数，则转移到 f 中去执行。

assume CS:CODE

CODE segment
start:
    mov DI, 0    ; 存放正数的个数
    mov SI, 0    ; 存放 0 的个数
    
    mov CX, N
    mov BX, 0    ; 下标
again:
    cmp array[BX], 0
    jle less_or_eq     ; array[BX] ≤ 0
    inc DI             ; array[BX] > 0
    jmp short next     ; 跳过下面一些语句（启发：将公用的语句放在后面）

less_or_eq:
    jl next   ; array[BX] < 0
    inc SI    ; array[BX] = 0
    
next:
    add BX, 2  ; 指向下一个字
    dec CX
    jnz again  ; CX ≠ 0
    
    mov AX, N
    sub AX, DI
    sub AX, SI
    jz exit         ; 没有负数
    jmp near ptr f  ; 有负数
        
f:
    ...
exit:
    ...
CODE ends
end start
