default rel



section .text
global ft_write
extern ft_strlen, __errno_location

ft_write:
	mov rax, 0x01
	syscall
	cmp rax, 0
	jl check_error
	ret

check_error:
	neg rax
	mov r9, rax
	jmp call_errno


call_errno:
	call __errno_location wrt ..plt
	mov [rax], r9
	jmp fail_end 

fail_end:
	mov rax, 0xFFFFFFFFFFFFFFFF
	ret

