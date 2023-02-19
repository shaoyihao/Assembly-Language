assume CS:code

code segment
start:
    mov AH, 2 ;调用 10h号中断处理程序的 2 号子程序，功能为设置光标位置
    mov BH, 0 ;第0页
    mov DL, 12;第12行
    mov DH, 5 ;第5列
    int 10h

exit:
    mov AX, 4c00h
    int 21h
code ends
end start
