assume CS:code

code segment
start:
    
    mov AL, 'a' ;所要显示的字符
    mov BL, 3   ;颜色属性
    mov CX, 3   ;字符重复个数
    mov BH, 0
    
    mov AH, 9
    int 10h

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
