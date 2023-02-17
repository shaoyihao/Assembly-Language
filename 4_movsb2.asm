assume CS:code, DS:data

data segment
    db 16 dup (0)
data ends

code segment
start:
	; 若十六位地址的首位为字母，则需要在前面添一个 0 以说明这是一个十六进制数（考虑AH和0AH的区别）
    mov AX, 0F000h 
    
    mov DS, AX 
    mov SI, 0FFFFh ;指向F000h段的末尾
    mov ES, AX 
    mov DI, 15     ;指向data段的末尾

    mov CX, 16 ;传送16个字节
    std ; 注意此处需要是逆向传送！
    rep movsb
    
    mov AX, 4c00h
    int 21h
code ends
end start
