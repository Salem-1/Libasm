default rel ; to allow the variable declaration to be relative in the .data section

section .data
	msg dq 0x16 

section .text
global ft_strdup
extern ft_strlen, malloc, ft_strcpy

ft_strdup:
	xor rcx, rcx
	xor rax, rax
	cmp rdi, 0x0
	je end
	call ft_strlen
	mov  [msg], rdi 
	inc rax
	mov rdi, rax 
	call malloc wrt ..plt ; Allow position independatand tables to external library like doing lea rdi, [rel msg]
	cmp rax, 0x0
	je end
	mov rdi, rax 
	mov rsi, [msg]
	call ft_strcpy
	ret
end:
	ret


