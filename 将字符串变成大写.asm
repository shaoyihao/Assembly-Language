assume CS:code

data segment
    db 'helloworld'
data ends

code segment
start:
    mov AX, data
    mov DS, AX
    mov SI, 0  ; DS:SI指向字符串的首地址

    call f
    jmp exit

f:
    mov CX, 10
    s:  and byte ptr [SI], 11011111b
        inc SI
    loop s
    ret

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
