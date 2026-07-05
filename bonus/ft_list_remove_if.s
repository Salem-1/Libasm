%include "headers.inc"

;extern void 	ft_list_sort(t_list **begin_list, int (*cmp)());

section .data
    begin_list   dq 0x00
    cmp_function dq 0x00

section .text
global ft_list_sort
extern malloc

ft_list_remove_if:
    xor rax, rax
    ret


