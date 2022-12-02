assume CS:code

stack segment
    db 128 dup (0)
stack ends

code segment
start:
    mov AX, stack
    mov SS, AX
    mov SP, 128

    mov AX, 0B800h
    mov ES, AX

    mov AH, 'a'
s:  mov ES:[160*12+40*2], AH
    call delay
    inc AH
    cmp AH, 'z'
    jna s
    jmp exit

delay:
    push AX
    push DX
    mov AX, 0
    mov DX, 0010h

s1: sub AX, 1
    sbb DX, 0
    cmp AX, 0
    jne s1
    cmp DX, 0
    jne s1

    pop DX
    pop AX
    ret

exit:
    mov AX, 4C00h    
    int 21h
code ends
end start
