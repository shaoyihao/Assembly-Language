; 根据接收的单个数字，显示相应字符串。如输入为1-5之外的其他字符，则不显示。

assume CS:CODE, DS:DATA, ES:DATA

DATA segment
    str1 db 'Happy Birthday !'   ; 每个字符串的长度均为16
    str2 db 'Happy New Year !'
    str3 db 'Merry Chrismas !'
    str4 db 'Hello Mr.Min   !'
    str5 db 'Hello Ms.Ju    !'
    msg db 16 dup (?), 13, 10, '$'    ; CRLF
DATA ends

CODE segment
main proc far
start:
    push DS
    sub AX, AX
    push AX
    
    mov AX, DATA
    mov DS, AX
    mov ES, AX
input:
    mov AH, 01h
    int 21h      ; 获取键盘输入
    ; 正确输入的字符的 ASCII 码为：31h ~ 35h
    sub AL, 31h  ; 此时 AL 中值的正确范围为：0h ~ 4h
    jl input     ; 小于 31h
    cmp AL, 4    
    ja input     ; 大于 35h
    
    mov AH, 0   
    mov CL, 4
    shl AX, CL   ; 将 0,1,2,3,4 转化为 0,16,32,48,64 （每个字符串的首地址）
    
    mov BX, AX   ; BX 中存储着所要输出的那个字符串的首地址
    lea SI, [str1 + BX]   ; 源字符串的起始地址
    lea DI, msg           ; 目的起始地址
    
    mov CX, 16    
    cld
    rep movsb    ; 将 DS:SI 指向的字符串（长度为16）送入 ES:DI 指向的地址中
    
    lea DX, msg
    mov AH, 09h  ; 输出 DS:DX 指向的字符串（以$结尾）
    int 21h
    
    jmp input
main endp
CODE ends
end start
