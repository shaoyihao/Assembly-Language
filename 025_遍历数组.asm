; 数据段中有一个首地址为 list 的未经排序的无符号字数组。
; 在数组的第一个字中，存放着该数组的长度，数组的首地址已经存放在 DI 中，AX 中存放着一个数。
; 要求数组中比 (AX) 大的数的个数，并将其以十进制形式显示出来。
assume CS:CODE, DS:DATA

DATA segment
    list dw 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
DATA ends

CODE segment
main proc far
start:
    push DS
    sub AX, AX
    push AX
    mov AX, DATA
    mov DS, AX
    
    lea DI, list
    mov CX, [DI]   ; DS:[DI] 即列表中的元素个数，存入CX
    add DI, 2      ; 使DI指向列表下一个元素
    
    mov AX, 3      ; 以 (AX)=3 为例
    mov BX, 0      ; 存储列表中比 (AX) 大的元素的数目
    s:
        cmp AX, [DI]   ; 将 DI 指向的数与 AX 中的数进行比较
        jge next    
        inc BX 
    next:
        add DI, 2
    loop s
    ; 此时 BX 中存储着答案
    
    mov CX, 10000
    call f
    mov CX, 1000
    call f
    mov CX, 100
    call f
    mov CX, 10
    call f
    mov CX, 1
    call f
        
    ret
main endp

f proc near
    mov AX, BX
    mov DX, 0
    div CX        ; (DX AX) ÷ CX = AX ... DX
    mov BX, DX    ; 将 BX 中的值更新为余数
    
    mov DL, AL
    add DL, 30h
    mov AH, 02h   ; 显示 DL 中的字符
    int 21h
    ret
f endp
CODE ends
end start
