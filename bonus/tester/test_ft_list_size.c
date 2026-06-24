#include "test_headers.h"


void test_list_size(char **argv)
{
	t_list *tmp;
	int size = atoi(argv[1]);
	t_list *head = create_list(size); 
	list_printer(head);
	int list_size = ft_list_size(head);
	printf("\n\nList size %i\nIt should be %i\n", list_size, size);
	if (list_size == size)
		printf("ft_list_size success :)\n");
	else
		printf("ft_list_size failed :(\n");
	while (head != NULL)
	{
		tmp = head;
		head = head->next;
		free(tmp);
	}
}