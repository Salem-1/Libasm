%include "headers.inc"


section .data
    begin_list      dq 0x00
    data_ref        dq 0x00
    cmp_function    dq 0x00
    free_function   dq 0x00
    tmp_node        dq 0x00
    node_to_free    dq 0x00
    node_before     dq 0x00
    msg             db "Node to remove", 0xa, 0x0

section .text
global ft_list_remove_if
extern free
extern print_node

ft_list_remove_if:
    cmp rdi, 0x0
    je end_exec
    cmp rsi, 0x0
    je end_exec
    cmp rdx, 0x0
    je end_exec
    cmp rcx, 0x0
    je end_exec
    mov [rel begin_list], rdi
    mov [rel data_ref], rsi
    mov [rel cmp_function], rdx
    mov [rel free_function], rcx
    mov rdi, [rdi]
    mov [rel tmp_node], rdi

    
node_checker_loop:
    mov rax, [rel tmp_node]
    cmp rax, 0x0
    je end_exec
    mov rax, [rax]
    cmp rax, 0x0
    je end_exec

cmp_nodes:
    mov rdi, [rel tmp_node]
    mov rdi, [rdi]
    mov rsi, [rel data_ref]
    call [rel cmp_function]
    cmp rax, 0x0 
    je remove_node

in_loop_move_to_next_node:
    mov rax, [rel tmp_node]
    mov [rel node_before], rax
    mov rax, [rax + t_list.next]
    mov [rel tmp_node], rax
    jmp node_checker_loop


    ; There is something wrong with the node or the data we are removing
remove_node:
    mov rax, [rel node_before]
    cmp rax, 0x0
    jne case_non_head_node

remove_head:
    mov rax, [rel tmp_node]
    mov [rel node_to_free], rax
    mov rbx, [rax + t_list.next]
    mov rdi, [rax]
    mov [rel tmp_node], rbx
    call [rel free_function]
    mov rdi, [rel node_to_free]
    call free wrt ..plt 
    mov rax, [rel tmp_node]
    mov rbx, [rel begin_list]
    mov [rbx], rax

update_head_next:
    mov rcx, [rel tmp_node + t_list.next]
    mov [rbx + t_list.next], rcx
    jmp node_checker_loop

case_non_head_node:
    mov rax, [rel tmp_node]
    mov rcx, [rax + t_list.next]
    mov rbx, [rel node_before]
    mov [rbx + t_list.next], rcx
    mov rdi, [rel tmp_node]
    mov rdi, [rdi]
    call [rel free_function]
    mov rdi, [rel tmp_node]
    call free wrt ..plt 
    mov rax, [rel node_before]
    mov rcx, [rax + t_list.next]
    mov [rel tmp_node], rcx
    jmp node_checker_loop

end_exec:
    ret


