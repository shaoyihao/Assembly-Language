; 已知有一串 L 个字符的宇符串存储于首地址为str的存储区中。在该字符串中查找空格。

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
