#include "test_headers.h"


void print_head(t_list *head, int i, int j)
{
    printf("\n;;;;;;;;;;;;;;;;;;\n");
	if (head == NULL)
	{
        printf("Head is NULL\n");
        printf("\n;;;;;;;;;;;;;;;;;;\n");
		return;
	}
	printf("(%i, %i)\n", i, j);
	lprint(head, "Head Before swap:");
    printf("\n;;;;;;;;;;;;;;;;;;\n");

}

void 	mock_ft_list_sort(t_list **begin_list, int (*cmp)())
{
    int     list_size;
    t_list  *smallest_node;
    t_list  *cursor;
    t_list  *tmp;
    t_list  *node_before;
    t_list  *perme_node_before; 
    t_list  *head;
    t_list  *head_before;
    int     first_time;
    
    if (begin_list == NULL || *begin_list == NULL)
        return ;
    list_size = ft_list_size(*begin_list);
    if (list_size == 0 || list_size == 1)
        return;
    
    head = *begin_list;
    head_before = head;
    smallest_node = *begin_list;
    tmp = *begin_list;
    cursor = *begin_list;
    first_time = 1;
    node_before = NULL;
    perme_node_before = NULL;
    
    for (int i = 0; i < list_size; i++)
    {
        for(int j = 0; j < list_size - i && tmp != NULL; j++)
        {
            node_before = tmp;
            tmp = tmp->next;
            if (tmp == NULL || smallest_node == NULL)
                break; 
            if (cmp(smallest_node->data, tmp->data) > 0)
            {
                perme_node_before = node_before;
                smallest_node = tmp;
            }
        }
        if (cursor != smallest_node)
        {
            if (perme_node_before == cursor)
        	{
        		cursor->next = smallest_node->next;
        		smallest_node->next = cursor;
        		cursor = smallest_node;
        	}
            else
            {
                t_list *cursor_next = cursor->next;
                cursor->next = smallest_node->next;
                smallest_node->next = cursor_next;
                (perme_node_before)->next = cursor;
                cursor = smallest_node;
            }
        }
        if (first_time == 1)
        {
            first_time = 0;
            head = cursor;
            head_before = head;
        }
        else 
        {
            head_before->next = cursor;
            head_before = head_before->next;
        }
        tmp = cursor;
        if (cursor->next == NULL)
            break;
        cursor = cursor->next;
        smallest_node = cursor;
        perme_node_before = NULL;
    }
    *begin_list = head;
    return;
}

t_list *fill_list_for_the_test(char **argv){
    t_list *head = NULL;
    int lazy_count = 0;
    for (int i = 1; argv[i] != NULL; i++)
        lazy_count++;
    for (int i = lazy_count; i > 0; i--)
    {
        ft_list_push_front(&head, argv[i]);        
    }
    return (head);
}

void test_ft_list_sort(char **argv)
{
    t_list *head = fill_list_for_the_test(argv);
    t_list *test = fill_list_for_the_test(argv);
    printf("Mokcing list sort\n");
    lprint(head, "list starts\n");
    mock_ft_list_sort(&head, strcmp);
    printf("--------------\n\n\n");
    ft_list_sort(&test, strcmp);
    printf("\n\n--------------\n");
    
    // lprint(head, "Head list finally\n");
    list_cmp(head, test);
    lprint(test, "Test list finally\n");
}
