; 将 ffff:0 ~ ffff:b 中的数据复制到 0:200 ~ 0:20b（等价于 0020:0 ~ 0020:b）中：

assume CS:CODE

CODE segment
start:
	
	mov AX, 0ffffh
	mov DS, AX
	
	mov AX, 20h
	mov ES, AX
	
	mov BX, 0    ; 使用同一个下标
	mov CX, 12
	s:
	    mov DL, DS:[BX]
	    mov ES:[BX], DL
	    inc BX
	loop s
	
  
	mov AX, 4c00h
	int 21h
CODE ends
end start
