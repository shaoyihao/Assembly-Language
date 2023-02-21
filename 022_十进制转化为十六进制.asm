; 将键盘输入的十进制数转化为十六进制，并进行显示

assume CS:CODE
CODE segment
 
main proc far    ; 主程序
repeat:
    call decibin
    call crlf
    call binihex
    call crlf
    jmp repeat
main endp

decibin proc near
    mov BX, 0    ; 将键盘输入转换为一个十进制数，BX记录该数
newchar:
    mov AH, 1
    int 21h      ; 调用21h中断的1号功能来获取键盘输入
    sub AL, 30h  ; 由ASCII码转化为数字
    jl exit      ; 输入的字符的ASCII码小于30h，一定不是数字，直接退出
    cmp AL, 9    ; 判断输入的到底是不是数字（ASCII码范围为：30h~39h）
    jg exit      ; 输入的是非数字字符，直接退出
    cbw          ; 将 AL 扩展至 AX
    
    xchg AX, BX
    mov CX, 10
    mul CX
    xchg AX, BX
    add BX, AX   ; BX = BX×10 + AX
    
    jmp newchar  ; 获取下一个字符

exit:
    ret
decibin endp

binihex proc near ; 以十六进制的形式显示BX中的数
    mov CH, 4  ; 显示4位数
rotate:
    mov CL, 4
    rol BX, CL ; 循环左移4位
    mov AL, BL
    and AL, 0fh
    add AL, 30h
    cmp AL, 3ah
    jl print    ; 显示0~9
    add AL, 7h  ; A~F
print:
    mov DL, AL
    mov AH, 2
    int 21h
    
    dec CH
    jnz rotate
    
    ret
binihex endp

crlf proc near    ; 显示回车和换行
    mov DL, 0dh
    mov AH, 2
    int 21h
    
    mov DL, 0ah
    mov AH, 2
    int 21h
    
    ret
crlf endp

CODE ends
end main
