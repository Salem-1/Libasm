section .data
	input		dq 0x00
	base		dq 0x00
	sign 		db 0x1
	result 		dq 0x00
	base_len 	dq 0x00


section .text
extern ft_strlen
global ft_atoi_base

ft_atoi_base:
	cmp rdi, 0x0
	je return_zero
	cmp rsi, 0x0
	je return_zero
	mov rax, 0x1
	mov [rel sign], rax
	mov [rel input], rdi
	mov [rel base], rsi
	mov rdi, rsi
	call ft_strlen
	cmp rax, 0x2
	jl return_zero
	mov [rel base_len], rax
	xor rcx, rcx
	mov rbx, [rel base]

checker_loop:
	cmp BYTE [rbx + rcx], 0x0
	je after_loop
	movzx rdi, BYTE [rbx + rcx]
	call is_space
	cmp rax, 0x1
	je return_zero
	cmp BYTE [rbx + rcx], 0x2b
	je return_zero
	cmp BYTE [rbx + rcx], 0x2d
	je return_zero
	inc rcx
	xor r15, r15
	xor r11, r11
check_repeated:
	cmp BYTE [rbx + r15], 0x0
	je end_repeated_check
	mov al, BYTE [rbx + rcx]
	cmp al, BYTE [rbx + r15]
	jne continue_repeated_chekcer_loop
	inc r11
	cmp r11, 0x1
	jg return_zero
continue_repeated_chekcer_loop:
	inc r15
	jmp check_repeated
end_repeated_check:
	jmp checker_loop

; input
after_loop:
	xor rcx, rcx
	xor r15, r15
	xor r11, r11
	xor r8, r8
	xor r14, r14
	mov rbx, [rel input]

trailing_checker_loop:
	movsx rdi, BYTE [rbx + rcx]
	call is_space
	cmp rax, 0x1
	je check_next_char
	cmp BYTE [rbx + rcx], 0x2b ; +
	je check_next_char
	cmp BYTE [rbx + rcx], 0x2d ; -
	je assign_negative
	jmp do_the_math


assign_negative:
	mov rax, [rel sign]
	neg rax
	mov [rel sign], rax
	

check_next_char:
	inc rcx
	jmp trailing_checker_loop

do_the_math:
	mov rax, 0x0
	mov [rel result], rax
atoi_base_loop:
	cmp BYTE [rbx + rcx], 0x00
	je normal_return
	mov rdi, rbx
	add rdi, rcx
	call check_char_order
	cmp rax, 0xFFFFFFFFFFFFFFFF
	je normal_return
	; check character order
	inc r15
	inc rcx
	mov r13,[rel base_len]
	mov r9, rax
	mov rax, [rel result]
	cmp r15, 0x1
	je after_inc_loop
	mul r13

after_inc_loop:
	add rax, r9
	mov [rel result], rax
	jmp atoi_base_loop	
	inc rcx
	jmp atoi_base_loop







	
check_char_order:
	xor rax, rax
	mov r12, [rel base]
char_order_loop:
	cmp BYTE[r12 + rax], 0x0
	je non_available_char
	mov r13b,  BYTE [rdi]
	cmp BYTE [r12 + rax],  r13b
	je char_order_ret
	inc rax
	jmp char_order_loop

char_order_ret:
	ret

non_available_char:
	mov rax, 0xFFFFFFFFFFFFFFFF
	ret


	

; 0x09 < 0x20, = 0x2b, = 0x2d
normal_return:
	mov rax, [rel result]
	movsx rbx, BYTE [rel sign]
	mul rbx
	; je ret_negative
	ret

ret_negative:
	neg rax
	ret

return_zero:
	xor rax, rax
	ret

is_space:
	cmp rdi, 0x20
	je return_true
	cmp rdi, 0x09
	je return_true
	cmp rdi, 0x0a
	je return_true
	cmp rdi, 0x0b
	je return_true
	cmp rdi, 0x0c
	je return_true
	cmp rdi, 0x0d
	je return_true
return_false:
		mov rax, 0x0
		ret
return_true:
	mov rax, 0x1
	ret