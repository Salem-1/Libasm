#include "test_headers.h"



t_list *create_list(int size){
	if (size <= 0)
		return (NULL);
	t_list *head = malloc(sizeof(t_list));
	int *val = malloc(sizeof(int));
	* val = 0;
	head->data = val;
	t_list *tmp = head;
	int i = 1;
	while(i < size){
		printf("Added %i items to the list, address %p\n", *(int *)tmp->data, tmp);
		t_list *next = malloc(sizeof(t_list));
		int * new_val = malloc(sizeof(int));
		*new_val = i;
		next->data = new_val;
		next->next = NULL;
		tmp->next = next;
		tmp = next;
		i++;
	}
	printf("Added %i items to the list, address %p\n", *(int *)tmp->data, tmp);

	return (head);
}

void	list_printer(t_list *head){
	t_list *count_me = head;
	printf("List Printer:\n");
	while (count_me != NULL)
	{
		printf("\t[%s]      , address %p\n", (char *)count_me->data, count_me);
		printf("         |\n         V         \n");
		count_me = count_me->next;
	}
	if (count_me == NULL)
		printf("\tNULL         , address %p\n", count_me);

	printf("End list Printer\n\n");
}


void	lprint(t_list *head, char * msg)
{
	t_list *count_me = head;
	if (count_me != NULL)
	{
		printf("\033[33m[%s]\033[0m %p -> ", (char *)count_me->data, count_me);
		count_me = count_me->next;
	}
	while (count_me != NULL)
	{
		printf("[%s] %p -> ", (char *)count_me->data, count_me);
		count_me = count_me->next;
	}
	if (count_me == NULL)
		printf("[NULL] %p. ", count_me);
	printf("\033[33m %s, size %i\033[0m\n", msg, ft_list_size(head));
}

void	list_cmp(t_list *head, t_list *test)
{
	t_list *count_head = head;
	t_list *count_test = test;
	printf("List cmp:\n");
	if (count_head == NULL && count_test == NULL)
	{
		printf("Both linked lists are NULL\n");	
		printf("TEST passed 😎\n\n");
		return;
	}
	if ((count_head == NULL && count_test != NULL) ||
		(count_head == NULL ) || (count_test == NULL) || (count_head->data != count_test->data))
		{
			printf("FAILED 😱");
			if (count_head == NULL)
				printf("the head is NULL\n");
			if (count_head == NULL)
				printf("the test is NULL\n");
			// printf("\t[%i]      , address %p != \t[%i]      , address %p \n", *(int *)count_head->data, count_head, 
			// 																  *(int *)count_test->data, count_test);
			printf("FAILED 😬\n");
			return ; 
		}
	while ((count_head != NULL) && (count_test != NULL))
	{
		if ((count_head == NULL) || (count_test == NULL) || (count_head->data != count_test->data))
		{
			printf("FAILED 😱");
			printf("\t[%i]      , address %p != \t[%i]      , address %p \n", *(int *)count_head->data, count_head, 
																			  *(int *)count_test->data, count_test);
			printf("FAILED 😬\n");
			return ; 
		}
		count_head = count_head->next;
		count_test = count_test->next;
	}

	printf("TEST passed 😎\n\n");
	return;
}


void 	mock_ft_list_push_front(t_list **begin_list, void *data){
    t_list* new_head = malloc(sizeof(t_list));
    if (new_head == NULL)
        return;
    new_head->data = data;
    new_head->next = *begin_list;
    *begin_list = new_head;
}

void print_node(t_list *node, char *msg)
{
	if (node)
		printf("%s(%s) %p ", msg, (char*)node->data, node);
	else
		printf("%s(NULL)", msg);

}
void 			swap_nodes(t_list **head, t_list *second, t_list *node_before)
{
	t_list *first = *head;
	print_node(node_before, "node before");
	if (first == second)
	{
		printf("No swapping needed\n");
		return;
	}
	if (node_before == *head)
	{
		printf("\n=======================\n");
		printf("\nSwapping second to head \n");
		first->next = second->next;
		second->next = first;
		// (*node_before)->next = second;
		*head = second;
		lprint(*head, "\nINside controversial swap firs and second node\n");
		printf("\nEnd controversial swap\n");
		printf("\n=======================\n");
		return;
	}
	t_list *first_next = first->next;
	first->next = second->next;
	second->next = first_next;
	(node_before)->next = first;
	*head = second;
}




