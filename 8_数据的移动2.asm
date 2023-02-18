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
	mov DI, 16
	
	mov CX, 8
	s:
		mov AX, [SI]
		mov [DI], AX
		add SI, 2
		add DI, 2
	loop s
	
	
	mov AX, 4c00h
	int 21h
CODE ends
end start
