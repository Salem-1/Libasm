section .text
global ft_strcmp

ft_strcmp:

	xor rax, rax
	xor rcx, rcx 
	char_checker_loop

char_checker_loop:
	mov al, BYTE [rdi + rcx]
	sub al,  [rsi + rcx]
	jne end
	cmp BYTE[rdi + rcx], 0x0
	je end
	inc rcx
	jmp char_checker_loop


end:
	movsx rax, al
	ret




