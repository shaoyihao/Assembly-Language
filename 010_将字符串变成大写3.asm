assume CS:code

data segment
    db 'word', 0
    db 'unix', 0
    db 'good', 0
    db 'wind', 0
data ends

code segment
main:

    mov AX, data
    mov DS, AX
    
    mov BX, 0 ;枚举每个字符串
    mov CX, 4 
    s:
        mov SI, BX ;SI指向某个字符串的首字符
        call f
        add BX, 5  ;指向下一个字符串
    loop s
    jmp exit

f:  ;将SI所指向的字符串转化为大写
    push CX
    push SI

    convert:
        mov CL, [SI]
        mov CH, 0
        jcxz OK
        and byte ptr [SI], 11011111b ;没到末尾
        inc SI
    jmp convert

    OK: 
        pop SI
        pop CX  ; 注意出栈与入栈的顺序要对应（逆序）
        ret

exit:
    mov AX, 4c00h
    int 21h
code ends
end main
