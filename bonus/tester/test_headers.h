#ifndef TEST_HEADERS_H
#define TEST_HEADERS_H

#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>


typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

extern	size_t	ft_strlen(char *str);
extern	char*	ft_strcpy(char *restrict dst, const char *restrict src);
extern  int 	ft_strcmp(const char *s1, const char *s2);
extern	char*	ft_strdup(const char *s1);
extern  ssize_t	ft_read(int fd, char *buf, size_t count);
extern	int 	ft_list_size(t_list *begin_list);
extern 	void 	ft_list_push_front(t_list **begin_list, void *data);
extern 	void 	ft_list_sort(t_list **begin_list, int (*cmp)());
extern 	void 	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
void 			swap_nodes(t_list **head, t_list *second, t_list *node_before);
void			list_printer(t_list *head);
void 			test_list_size(char **argv);
void 			test_ft_list_push_front(char **argv);
void			list_cmp(t_list *head, t_list *test);
void 			mock_ft_list_push_front(t_list **begin_list, void *data);
void 			mock_ft_list_sort(t_list **begin_list, int (*cmp)());
void 			test_ft_list_sort(char **argv);
void 			test_ft_list_remove_if(char **argv);
void			lprint(t_list *head, char * msg);
void 			print_node(t_list *node, char *msg);
t_list*			fill_list_for_the_test(char **argv);
t_list*			create_list(int size);

#endif