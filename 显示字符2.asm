assume CS:code

code segment
start:
    mov AH, 2
    mov BH, 0
    mov DH, 5
    mov DL, 12
    int 10h 

    mov AH, 9
    mov AL, 'a'
    mov BL, 11001010b  ;颜色属性
    mov BH, 0
    mov CX, 3  ;字符重复个数
    int 10h

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
