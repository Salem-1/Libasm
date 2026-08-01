#include "test_headers.h"





void free_fct(void *data)
{
    if (data != NULL)
        free(data);
}


// ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

void case_null(void)
{
    t_list *head = NULL;
    t_list *test = NULL;
   

    char * a = "3";
    ft_list_remove_if(&test, (void *)a ,ft_strcmp, free_fct);
    
    lprint(test, "Test Case NULL\n");
    list_cmp(head, test);
}

void    visualize_argv(char **argv, char *msg){
    printf("%s\n", msg);
    for (int i = 0; argv[i] != NULL; i++)
    {
        printf("%s\n", argv[i]);
    }
}
void test_argv(char **argv, char *a)
{
    int k = 0;
    for (int i = 0; argv[i] != NULL; i++)
        k++;

    char **mirror_argv = malloc(sizeof(char **) * k);
    char **test_argv = malloc(sizeof(char **) * k);
    if (mirror_argv == NULL || test_argv == NULL)
        return;

    int j = 0;

    for (int i = 0; argv[i] != NULL; i++)
    {
        test_argv[i] = ft_strdup(argv[i]);
        if (ft_strcmp(argv[i], a) != 0)
        {
            mirror_argv[j] = ft_strdup(argv[i]);
            j++;
        }
        if (argv[i + 1] == NULL)
            test_argv[i + 1] = NULL;
    }
    mirror_argv[j] = NULL;
    // visualize_argv(mirror_argv, "mirror argv");
    // visualize_argv(test_argv, "test argv");
    t_list *head = fill_list_for_the_test(mirror_argv);
    t_list *test = fill_list_for_the_test(test_argv);
    lprint(test, "test before");
    printf("\n\n");
    lprint(head, "head");
    printf("\n\n");
    ft_list_remove_if(&test, (void *)a ,ft_strcmp, free_fct);
    lprint(test, "Test argv\n");
    
    list_cmp(head, test);
}

void test_ft_list_remove_if(char **argv)
{
    test_argv(argv, "3");
    // case_null();
}
