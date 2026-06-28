%include "headers.inc"

;extern void 	ft_list_sort(t_list **begin_list, int (*cmp)());

section .data
    ;function input argumenst
    list_size dq            0x00
    begin_list              dq 0x00
    ;inits
    cmp_function            dq 0x00
    smallest_node           dq 0x00
    cursor                  dq 0x00
    tmp                     dq 0x00
    node_before             dq 0x00
    perme_node_before       dq 0x00
    head                    dq 0x00
    head_before             dq 0x00
    first_time              db 0x00
    ; loop counters
    i                       dq 0x00
    j                       dq 0x00
    ; backup
    original_begin_list     dq 0x00
    msg                     db "Assembly Head", 0x0
    msn                     db " Assembly node", 0xa,  0x0
    nl                      db  "-", 0xa,  0x0

    

section .text
global ft_list_sort
extern ft_list_size

extern lprint
extern print_node
extern printf

ft_list_sort:
    mov [rel cmp_function], rsi
    cmp rdi, 0x0
    je terminate_program
    cmp BYTE [rdi], 0x0
    je terminate_program
;    if (begin_list == NULL || *begin_list == NULL)
;         return ;
    mov [rel original_begin_list], rdi
    mov rdi, [rdi]
    call ft_list_size
    cmp rax, 0x1
    jle terminate_program
    mov [rel list_size], rax
;       list_size = ft_list_size(*begin_list);
;       if (list_size == 0 || list_size == 1)
;         return;
    mov rdi, [rel original_begin_list]
    mov rax, [rdi]
    mov [rel head], rax                     ; head = *begin_list;
    mov [rel head_before], rax              ; head_before = head;
    mov [rel smallest_node], rax            ; smallest_node = *begin_list;
    mov [rel tmp], rax                      ;tmp = *begin_list;
    mov [rel cursor],rax                    ;cursor = *begin_list;
    mov rbx, 0x1        
    mov [rel first_time], rbx               ;first_time = 1;
    mov rbx, 0x0        
    mov [rel node_before], rbx              ;node_before = NULL;
    mov [rel perme_node_before], rbx        ;perme_node_before = NULL;
    ; start loop from here
    mov rax, 0x0
    mov [rel i], rax
    mov [rel j], rax 

outer_loop:
    mov rax, [rel i]
    cmp rax, [rel list_size] 
    jge normal_end
    inc rax
    mov [rel i], rax
    ;for (int i = 0; i < list_size; i++)
    xor rax, rax
    mov [rel j], rax
    
    ; mov rdi, nl
    ; call printf wrt ..plt

inner_loop:
    mov rax, [rel list_size]
    sub rax, [rel i]
    cmp [rel j], rax 
    jge after_inner_loop
    mov rax, [rel tmp]
    cmp rax, 0x0
    je after_inner_loop
    mov rcx, [rel j]
    inc rcx
    mov [rel j], rcx
;  for(int j = 0; j < list_size - i && tmp != NULL; j++)
;         {
    mov rax, [rel tmp]
    mov [rel node_before], rax
; node_before = tmp;
    mov rax, [rel tmp]
    mov rax, [rax + t_list.next]
    mov [rel tmp], rax 
;             tmp = tmp->next;
    

    ; mov rdi, rax 
    ; mov rsi, msn
    ; call print_node
    
    cmp rax, 0x0
    je after_inner_loop
    mov rbx, [rel smallest_node]
    cmp rbx, 0x0
    je after_inner_loop
;   if (tmp == NULL || smallest_node == NULL)
;                 break; 

    mov rdi, [rel tmp ]
    mov rdi, [rdi + t_list.data]
    mov rsi, [rel smallest_node ]
    mov rsi, [rsi + t_list.data]
    call [rel cmp_function]
    cmp rax, 0x0
    jle inner_loop
    ; if (cmp(smallest_node->data, tmp->data) > 0)

update_smallest_node:
    mov rax, [rel node_before]
    mov [rel perme_node_before], rax
    ;             perme_node_before = node_before;
    mov rbx, [rel tmp]
    mov [rel smallest_node], rbx
    mov rdi, rbx
    mov rsi, msn
    call print_node
    ;                smallest_node = tmp;





    jmp inner_loop
    
    
after_inner_loop: 
    jmp outer_loop

 





normal_end:
    ret

terminate_program:
    ret


;     mov rdi, [rel tmp]
    ; mov rsi, msg
    ; call lprint






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

