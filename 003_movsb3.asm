assume CS:CODE, DS:DATA, ES:EXTRA

DATA segment
    mess1 db 'Hello$'
DATA ends

EXTRA segment
    mess2 db 5 dup (?)
EXTRA ends

CODE segment
start:
    mov AX, DATA
    mov DS, AX
    mov AX, EXTRA
    mov ES, AX
    
    lea SI, mess1
    lea DI, mess2
    
    mov CX, 5
    cld         ; 正向传输
    rep movsb
    
CODE ends
end start
