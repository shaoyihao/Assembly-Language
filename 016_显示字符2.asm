assume CS:code

code segment
start:

    mov BH, 0   ; 第0页
    mov DH, 5   ; 第5列
    mov DL, 12  ; 第12行
    
    mov AH, 2   ; 调用 10h号中断处理程序的 2 号子程序，功能为设置光标位置
    int 10h 

    mov AL, 'a'        ; 显示的内容
    mov BL, 11001010b  ; 颜色属性
    mov CX, 3          ; 字符重复个数
    
    mov AH, 9
    int 10h

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
