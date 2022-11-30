assume CS:code

data segment
    db 'helloworld', 0
data ends

code segment
start:
    mov AX, data
    mov DS, AX
    mov SI, 0  ; DS:SI指向字符串的首地址
    s:
        mov CL, [SI]
        mov CH, 0  ;将一个字符(8位)存入 AX 中
        jcxz exit  ; 末尾字节为0，当遇到0说明就到了字符串末尾
        and byte ptr [SI], 11011111b ;没到末尾
        inc SI
    jmp s

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
