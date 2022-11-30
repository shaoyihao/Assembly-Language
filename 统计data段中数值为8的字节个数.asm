assume DS:data, CS:code

data segment
    db 8, 11, 8, 1, 8, 5, 63, 38
data ends

code segment
main:
    mov AX, data
    mov DS, AX

    mov AX, 0  ;最终统计结果存于 AX 中
    mov BX, 0  ;作为下标进行遍历
    mov CX, 8
    s:
        cmp byte ptr [BX], 8
        jne next ;不相等就枚举下一个数
        inc AX   ;相等则计数+1
        
        next: 
            inc BX
    loop s

    mov AX, 4c00h
    int 21h
code ends
end main
