; 计算 (A×B+C)/D

assume CS:CODE, DS:DATA

DATA segment
    A dw 2h
    B dw 2h
    C dw 2h
    D dw 2h
DATA ends

CODE segment
main proc far
start:
    push DS
    sub AX, AX
    push AX
    mov AX, DATA
    mov DS, AX
    
    mov AX, A
    mov BX, B
    imul BX       ; DX AX
    
    mov BX, AX
    mov CX, DX    ; CX BX
    
    mov AX, C
    cwd           ; DX AX
    add AX, BX
    adc DX, CX    ; DX AX
    
    mov BX, D
    idiv BX       ; AX...DX
    
    ret
main endp
CODE ends
end start
