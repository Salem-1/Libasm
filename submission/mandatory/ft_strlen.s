section .text
global ft_strlen

ft_strlen:
	xor rax, rax 
	cmp rdi, 0;
	je end
	
loop:
	cmp BYTE [rdi + rax], 0x0
	je end
	inc rax 
	jmp loop 

end:
	ret



