mov AL, 20h
mov CX, L
mov SI, -1
s:
    inc SI
    cmp AL, str[SI]
loopne s    ; 退出循环有 2 种可能：CX=0 或 str[SI]=20h（此时ZF=1）

jnz NOT_FOUND ; 若ZF≠1，说明是CX=0这种情况
jmp FOUND

NOT_FOUND:
    ...
FOUND:
    ...
