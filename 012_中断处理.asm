assume CS:CODE

CODE segment
start:

	mov AX, CS
	mov DS, AX
	mov SI, offset do0 ; 将DS:SI设置为 CS:do0（即do0程序块的首地址）
	
	mov AX, 0
	mov ES, AX
	mov DI, 200h  ; 将ES:DI设置为 0000:0200h
	
	mov CX, offset do0end - offset do0 ;获取该代码块的长度（字节数）  【小技巧】
	cld
	rep movsb  ; 将 DS:SI（CS:do0）指向的内容移到 ES:DI（0000:0200h）中
	
	; 以编写的是 0 号中断处理程序为例（ 0号中断对应的中断向量的存储地址为：0×4+2、0×4 ）
	mov word ptr ES:[0*4+2], 0000h ;将0000h（段号）存入0000:0002单元
	mov word ptr ES:[0*4], 0200h   ;将0200h（偏移地址）存入0000:0000单元
	
	jmp exit
	
	do0:
		...
	do0end: nop ; 标记代码块的结束，便于编译器求出代码块的长度
	
	
exit:
	mov AX, 4c00h
	int 21h
CODE ends
end start
