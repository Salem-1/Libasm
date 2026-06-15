%include "headers.inc"

section .text
global ft_list_size

ft_list_size:
    xor rax, rax
    cmp rdi, 0x0
    je end_counting

counter_loop:
    inc rax
    mov rdi, [rdi + t_list.next]
    cmp rdi, 0x0
    jne counter_loop

end_counting:
    ret