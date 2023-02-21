; 计算 A+(B×10+C)/D

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
 
    mov AX, B
    mov BX, 10
    imul BX        ; (AX)×(BX) = (DX AX)
    mov BX, AX     
    mov CX, DX     ;             (CX BX)
    mov AX, C
    cwd            ; (DX AX) = 0 C
    add AX, BX
    adc DX, CX     ; (DX AX) + (CX BX) = (DX AX)
    idiv D         ; (DX AX) / D = AX ... DX
    add AX, A
            
    ret
main endp
CODE ends
end start
