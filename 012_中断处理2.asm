mov AL, N
mov AH, 35h
int 21h      ; 将 N 号中断的中断向量送入 ES:BX

push ES      ; 段地址 
push BX      ; 偏移地址
push DS

mov AX, seg f
mov DS, AX
mov DX, offset f  ; 将 f 的地址存入 DS:DX

mov AL, N
mov AH, 25h
int 21h     ; 将 DS:DX 作为 N 号中断的中断向量（存入中断向量表）

pop DS

...

pop DX      ; 偏移地址
pop DS      ; 段地址
mov AL, N
mov AH, 25h
int 21h     ; 恢复 N 号中断原来的中断向量

ret


f:
    ...
    iret
