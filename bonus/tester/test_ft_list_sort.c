#include "test_headers.h"



// void 	mock_ft_list_sort(t_list **begin_list, int (*cmp)())
// {
//     t_list *head = *begin_list;
//     t_list *tmp = head;
//     t_list *smallest_node = head;
//     t_list *cursor = head;
//     t_list *node_before = head;
//     t_list *perm_node_before = NULL;

//     int list_size = ft_list_size(head);
//     if (list_size < 2)
//         return; 
//     for (int i = 0; i < list_size ; i++)
//     {
//         for (int j = 0; j < list_size - i; j++)
//         {
//             node_before = tmp;
//             tmp = tmp->next;
//             if (tmp == NULL)
//             {
//                 printf("This is a design issue, shouldn't reach null\n");
//                 break;
//             }
//             printf("(%i, %i)\n", i, j);
//             printf("is  %s < %s ?", (char *)smallest_node->data, 
//             (char *)tmp->data);
//             if (cmp(smallest_node->data, tmp->data) >= 0)
//             {
//                 printf(". Yes %s is smaller than %s\n",(char *)tmp->data, (char *)smallest_node->data);

//                 smallest_node = tmp;
//                 perm_node_before = node_before;
//             }
//             else
//             {
//                 printf(". No it's not\n");
//             }
//         }
//         if (perm_node_before)
//         {
//             printf("#####before swapping: \n");
//             list_printer(cursor);
//             swap_nodes(&cursor, smallest_node, perm_node_before);
//             printf("#####after swapping: \n");
//             list_printer(cursor);
//             perm_node_before = NULL;
//         }
//         else{
//             printf("failed to set perm node before\n");
//         }
//         cursor = cursor->next;
//         tmp = cursor;
//         smallest_node = tmp;
//         printf("#####New cursor \n");
//         list_printer(cursor);
//     }
//     return;
// }
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
    t_list  *head = *begin_list;
    t_list  *perme_node_before; 
    t_list  *head_before = head;


    list_size = ft_list_size(*begin_list);
    smallest_node = *begin_list;
    tmp = *begin_list;
    cursor = *begin_list;
    int first_time = 1;
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
            if (cmp(smallest_node->data, tmp->data) >= 0)
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
            head = cursor;
            first_time = 0;
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
    ft_list_sort(&head, strcmp);
    
    lprint(head, "list finally\n");
    list_cmp(head, test);
}
