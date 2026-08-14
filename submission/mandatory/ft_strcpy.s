extern ft_strlen
section .text
global ft_strcpy

ft_strcpy:
	cmp rsi, 0
	je safety_end
	cmp rdi, 0
	je safety_end
	xor rcx, rcx

copy_str:
	cmp BYTE [rsi + rcx], 0x0
	je end
	mov al,  BYTE [rsi + rcx]
	mov BYTE [rdi + rcx],  al
	inc rcx
	jmp copy_str

end:
	mov BYTE [rdi + rcx],  0x0
	mov rax, rdi

safety_end:
	ret