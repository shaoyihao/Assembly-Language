assume CS:CODE

CODE segment
main:
    mov AX, 1
    call f  ; 先将 mov BX, AX 这一指令的地址压入栈中，再跳转到f
    mov BX, AX
    jmp exit

f:	
	mov CX, 3 ; 此处是求 2 的 3 次幂
	s:  
		add AX, AX
    loop s
    ret  ; 将栈中的数据存入IP，即接下来会跳转到 mov BX, AX
    
exit:
	mov AX, 4c00h
    int 21h
CODE ends
end main
