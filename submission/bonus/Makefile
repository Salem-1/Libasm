
SRC =  ft_list_push_front.s ft_list_remove_if.s ft_list_size.s ft_list_sort.s ft_atoi_base.s ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s ft_write.s

OBJ = $(SRC:.s=.o)

ASM = nasm
ASMFLAGS = -f elf64 
NAME = libasm.a 
CC = gcc
TESTER_FILES = tester/*.c
EXEC = a.out

all: $(NAME)

bonus: $(NAME)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)


# run: $(NAME) $(TESTER_FILES)
# 	$(CC) $(TESTER_FILES) $(NAME) -o $(EXEC)


clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) $(EXEC)

re: fclean all


.PHONY: all bonus clean fclean re run

# $<: firsrt dependency
# $@: target 
# ar   = archive tool
# r    = replace/add object files
# c    = create archive if missing
# s    = create index for linker
# .PHONY tells make that those are target namse not file name so if there is a file names clean it's not confused with ti
