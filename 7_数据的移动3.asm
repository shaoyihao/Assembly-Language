; 将字符串“welcome to masm!” 复制到它后面的数据区中。

assume CS:CODE, DS:DATA

DATA segment
    db 'welcome to masm!'
    db '................'
DATA ends

CODE segment
start:

	mov AX, DATA
	mov DS, AX
	
    mov SI, 0
	
	mov CX, 8
	s:
	    mov AX, 0[SI]    ; 0为源数组首地址
	    mov 16[SI], AX   ; 16为目标数组首地址
	    add SI, 2
	loop s
	
	
	mov AX, 4c00h
	int 21h
CODE ends
end start
