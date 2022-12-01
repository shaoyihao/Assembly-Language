assume CS:code

code segment
start:
    mov AH, 9
    mov AL, 'a'
    mov BL, 3  ;颜色属性
    mov CX, 3  ;字符重复个数
    mov BH, 0
    int 10h

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
