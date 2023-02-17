assume CS:CODE, DS:DATA

DATA segment
    db 'Welcome to masm!'
    db 16 dup (0)
DATA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX
    mov SI, 0   ; 设置 DS:SI
    mov ES, AX
    mov DI, 16  ; 设置 ES:DI

    mov CX, 16  ; 复制16个字节
    cld         ; 正向
    rep movsb
    
    mov AX, 4c00h
    int 21h
CODE ends
end start
