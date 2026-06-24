#include "test_headers.h"



void test_ft_list_push_front(char **argv)
{
    t_list *tmp;
	int size = atoi(argv[1]);
	// t_list *head = create_list(size); 
	// list_printer(head);
    t_list *head;
    t_list *test;
    printf("adding items to the list\n");
    for (int i = 0; i < 10; i++)
    {
        int *data;
        data = malloc(sizeof(int));
        *data = i;
        mock_ft_list_push_front(&test, data);
        printf("----------------------\n");
        ft_list_push_front(&head, data);
        printf("----------------------\n");
        printf("i <%i>\n", i);
        printf("\t head: [%i]\n", *(int *)head->data);
        printf("\t head address: %p\n", head);
        
        printf("Printing pushed list\n");
        printf("###############");
        list_printer(head);
        list_cmp(head, test);
        printf("###############\n");
        printf("-----------------------\n");
    }
}
