default rel



section .text
global ft_read
extern ft_strlen, __errno_location

ft_read:
	xor rax, rax
	syscall
	cmp rax, 0
	jl check_error
	ret

check_error:
	neg rax
	mov r9, rax
	cmp rax, 0x4
	je	call_errno
	cmp rax, 0x0b
	je	call_errno
	cmp rax, 0x09
	je	call_errno
	cmp rax, 0x0e
	je	call_errno
	cmp rax, 0x16
	je	call_errno
	cmp rax, 0x05
	je	call_errno
	cmp rax, 0x15
	je	call_errno
	jmp fail_end


call_errno:
	call __errno_location wrt ..plt
	mov [rax], r9; move specific value to location pointed by rax
	jmp fail_end 

fail_end:
	mov rax, 0xFFFFFFFFFFFFFFFF
	ret

; syscalls in 64 bit x86
; rax 0 -> read
; rdi -> file descriptor
; rsi -> buffer address
; rdx -> count bytes to read
; syscall