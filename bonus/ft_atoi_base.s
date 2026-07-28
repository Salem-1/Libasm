section .data
	input		dq 0x00
	base		dq 0x00
	base_len 	dq 0x00
	

section .text
extern ft_strlen
global ft_atoi_base

ft_atoi_base:
	cmp rdi, 0x0
	je return_zero
	cmp rsi, 0x0
	je return_zero
	mov [rel input], rdi
	mov [rel base], rsi
	mov rdi, rsi
	call ft_strlen
	cmp rax, 0x2
	jl return_zero
	xor rcx, rcx
	mov rbx, [rel base]

checker_loop:


	cmp BYTE [rbx + rcx], 0x0
	je after_loop
	cmp BYTE [rbx + rcx], 0x20
	jl return_zero
	cmp BYTE [rbx + rcx], 0x2b
	je return_zero
	cmp BYTE [rbx + rcx], 0x2d
	je return_zero
	inc rcx
	jmp checker_loop

after_loop:
	nop


; 0x09 < 0x20, = 0x2b, = 0x2d
test_return_one:
	mov rax, 0x1
	ret

return_zero:
	xor rax, rax
	ret