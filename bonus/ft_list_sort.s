%include "headers.inc"

;extern void 	ft_list_sort(t_list **begin_list, int (*cmp)());
section .data
    begin_list      dq 0x00
    smallest_node   dq 0x00
    cursor          dq 0x00
    cmp_function    dq 0x00
    list_size dq    0x00

section .text
global ft_list_sort
extern ft_list_size

ft_list_sort:
    mov rax, [rdi]
    mov [rel begin_list], rax
    mov [rel cmp_function], rsi
    mov rdi, [rel begin_list]
    call ft_list_size
    mov [rel list_size], rax
    mov rcx, 0x0
    mov rax, [rel begin_list]
    mov [rel smallest_node], rax
    mov [rel cursor], rax

outer_loop:
    cmp rcx, [rel list_size] ; i
    jg end_loop
    mov rdx, 0 ; j
    jmp inner_loop

inc_outer_loop:
    inc rcx ;i++
    jmp outer_loop

inner_loop:
    mov rax, [rel list_size]
    sub rax, rcx
    cmp rdx,  rax ; j < list_size - i
    jg inc_outer_loop
    inc rdx


    jmp inner_loop


end_loop:
    ret



; logic:
; 1- get list size
; 2- select smallest node
; 3- double loop
; 4- check smallest node vs current node
; 5- update smallest node
; 6- repeate till end
; 7- swap nodes with head
; 8- move to head->next, consider it smallest 
; 9- got step 4 till list end 


; rax — also holds return values
; rcx
; rdx
; rsi
; rdi
; r8
; r9
; r10
; r11

; Callee-saved (non-volatile) — if you use these, you must push them on entry and pop them before ret, because the function that called you expects them unchanged:

; rbx
; rbp
; r12
; r13
; r14
; r15
; rsp — special: it's the stack pointer, managed implicitly by push/pop/call/ret

