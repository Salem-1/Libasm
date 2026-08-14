
SRC = ft_strcpy.s ft_strlen.s ft_strcmp.s ft_strdup.s ft_read.s ft_write.s ft_list_size
OBJ = $(SRC:.s=.o)

ASM = nasm
ASMFLAGS = -f elf64 
NAME = libasm.a 
CC = gcc
MAIN = main.c
EXEC = a.out

all: $(NAME)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)


run: $(NAME) $(MAIN)
	$(CC) $(MAIN) $(NAME) -o $(EXEC)


clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) $(EXEC)

re: fclean all


.PHONY: all clean fclean re run

# $<: firsrt dependency
# $@: target 
# ar   = archive tool
# r    = replace/add object files
# c    = create archive if missing
# s    = create index for linker
# .PHONY tells make that those are target namse not file name so if there is a file names clean it's not confused with ti