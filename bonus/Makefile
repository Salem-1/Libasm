
SRC =  ft_list_push_front.s ft_list_remove_if.s ft_list_size.s ft_list_sort.s ft_atoi_base.s ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s ft_write.s

OBJ = $(SRC:.s=.o)

ASM = nasm
ASMFLAGS = -f elf64 
NAME = libasm.a 
CC = gcc
TESTER_FILES = tester/*.c
EXEC = a.out

all: $(NAME)

# required by libasmTester and 42libasm_tester (they run `make bonus` here);
# bonus objects are already part of $(NAME)
bonus: $(NAME)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)


run: $(NAME) $(TESTER_FILES)
	$(CC) $(TESTER_FILES) $(NAME) -o $(EXEC)


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


# ══════════════════════════════════════════════════════════════════════════
# ▼▼▼ DEV HELPERS (x86-64 Docker on ARM Mac) — DELETE BEFORE SUBMISSION ▼▼▼
# Work from the host (wrapped in docker compose) AND from inside the
# container (run directly) — auto-detected via /.dockerenv.
#
#   make shell        open an x86-64 Linux shell inside the con`tainer
#   make img          (re)build the docker image
#   make mytest       build + run my own tester          make mytest ARGS="a b c"
#   make t1           libasmTester: all bonus tests      make t1 FN=list_sort  (one test)
#   make t1v          libasmTester: bonus with valgrind  make t1v FN=list_sort (one test)
#   make t1m          libasmTester: mandatory tests
#   make t2           42libasm_tester: all bonus tests   make t2 FN=list_sort  (one test)
#   make t2l          42libasm_tester: bonus leak checks (valgrind)
#   make t2m          42libasm_tester: mandatory tests   make t2m FN=strlen    (one test)
#   make testers      run t1 + t2
#   make debug        gdb on ./a.out via qemu gdb stub   make debug ARGS="5 1 1 3 2"
#                     (host only; uses your gdbcfg, start/run become continue)

ifneq ($(wildcard /.dockerenv),)
DC   =
else
DC   = docker compose run --rm asm
endif
ARGS ?= banana apple cherry zebra

shell:
	$(DC) bash

img:
	docker compose build

mytest:
	$(DC) sh -c 'make run && ./a.out $(ARGS)'

t1:
	$(DC) sh -c 'cd libasmTester && make -k $(if $(FN),$(FN),b) UPD=0'

t1v:
	$(DC) sh -c 'cd libasmTester && make -k $(if $(FN),v$(FN),vb) UPD=0'

t1m:
	$(DC) sh -c 'cd libasmTester && make -k m UPD=0'

t2:
	$(DC) sh -c 'cd 42libasm_tester && bash runtest.sh bonus $(FN)'

t2l:
	$(DC) sh -c 'cd 42libasm_tester && bash runtest.sh bonus leak'

t2m:
	$(DC) sh -c 'cd 42libasm_tester && bash runtest.sh $(FN)'

testers: t1 t2

# native gdb can't ptrace under x86 emulation, so: qemu-x86_64 runs a.out with
# its gdb stub on :1234 and native gdb-multiarch connects to it. gdbcfg is
# used via a filtered copy (remote stubs use `continue`, never `start`/`run`).
debug:
	docker compose run --rm dbg sh -c '\
		sed -E "/^[[:space:]]*(start|run)([[:space:]]|$$)/d" gdbcfg > /tmp/gdbrc; \
		qemu-x86_64 -g 1234 ./a.out $(ARGS) & \
		sleep 0.5; \
		gdb-multiarch -q ./a.out -ex "target remote localhost:1234" -x /tmp/gdbrc'

.PHONY: shell img mytest t1 t1v t1m t2 t2l t2m testers debug
# ▲▲▲ END DEV HELPERS — DELETE EVERYTHING FROM THE ▼▼▼ LINE TO HERE ▲▲▲