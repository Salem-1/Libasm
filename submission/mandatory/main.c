#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

extern	size_t ft_strlen(char *str);
extern	char *ft_strcpy(char *restrict dst, const char *restrict src);
extern  int ft_strcmp(const char *s1, const char *s2);
extern	char *ft_strdup(const char *s1);
extern  ssize_t ft_read(int fd, char *buf, size_t count);

void test_strlen(char **argv)
{
	printf("Testing Strlen\n");
	
	int i = ft_strlen(argv[1]);
	printf("the string size is %i\n", i);
}

void test_strcpy(char **argv){
	printf("Testing \n");

	char a[1000];

	printf("a location = %p\n\n", a);
	char* ret = ft_strcpy(a, argv[1]);
	printf("our src:<%s>\ndst:<%s>, \nret: %p \n", argv[1], a, ret);
	ret = strcpy(a, argv[1]);
	printf("thier src:<%s>\ndst:<%s>, \nret: %p\n", argv[1], a,ret );
}

void test_strcmp(char **argv)
{
	printf("Testing Strcmp \n");

	int st = strcmp(argv[1], argv[2]);
	int my = ft_strcmp(argv[1], argv[2]);

	printf("my: %d\nst: %d\n", my, st);
	if (my == st){
		printf("strcmp test passess :)\n");
	}else{
		printf("strcmp test failed :(\n");

	}
}

void test_strdup(char **argv)
{
	printf("Testing strdup\n");
	char* st = strdup(argv[1]);
	printf("st: %s\n",st);
	char* my = ft_strdup(argv[1]);
	printf("my: %s\n", my);
	
	if (
		(ft_strlen(my) == ft_strlen(st)) && (strcmp(st, my) == 0) && (ft_strcmp(st, my) == 0)
	)
	{
		printf("strdup test passess :)\n");
	}else{
		printf("strdup test failed :(\n");

	}
}


void test_read(char ** argv)
{
	int fd = open(argv[1], O_RDONLY);
	int fd2 = open(argv[1], O_RDONLY);
	// if (fd < 0)
	// {
	// 	printf("failed to open the file\n");
	// 	return ;
	// }
	char *buff = malloc(1000);
	char *buff2 = malloc(1000);
	// int count = read(fd, buff, 1000);
	int count = 1;
	printf("File is : %s\n", buff);
	printf("-------------------------\n");
	int our_count = ft_read(fd2, buff2, 1000);
	printf("File is : %s\n", buff2);
	printf("-------------------------\n");
	printf("Read count: %d\n Our. count: %d\n", count, our_count);
	if (count != our_count){
		printf("read count failed :( \n");
	}
	else{
		printf("Read succeded :)\n");
	}

}
int main(int argc, char **argv)
{

	char *a = "Hello";
	if (argc < 2)
	{
		printf("Please enter at least one argument then rerun the program\n");
		return (1);
	}
	test_strlen(argv);
	printf("------------------------------\n");
	test_strcpy(argv);
	// printf("------------------------------\n");
	// test_strcmp(argv);
	printf("------------------------------\n");
	test_strdup(argv);
	printf("------------------------------\n");
	test_read(argv);
}

// rdi
// rsi
// rdx
// rcx
// r8
// r9
// RAX (64-bit) / EAX (32-bit): Accumulator; used for arithmetic operations and function return values.
// RBX (64-bit) / EBX (32-bit): Base register; often used for data pointer.
// RCX (64-bit) / ECX (32-bit): Counter; used for shifts and loops.
// RDX (64-bit) / EDX (32-bit): Data register; used for I/O and multiplication/division.
// RSI (64-bit) / ESI (32-bit): Source Index; pointer to source string/data.
// RDI (64-bit) / EDI (32-bit): Destination Index; pointer to destination string/data.
// RBP (64-bit) / EBP (32-bit): Base Pointer; points to the base of the current stack frame.
// RSP (64-bit) / ESP (32-bit): Stack Pointer; points to the current top of the stack.
// R8–R15 (64-bit): Additional GPRs added in x86-64, available for general

// SYSCALL also saves RFLAGS into R11 and then masks RFLAGS using the IA32_FMASK MSR (MSR address C0000084H); specifically, the processor clears in RFLAGS every bit corresponding to a bit that is set in the IA32_FMASK MSR.
//r11 register will change with a specific mask it must represent somehting

// Common read failure values

// For Linux read(fd, buf, count):

// Failure	Meaning	Raw RAX after syscall
// EINTR	interrupted by signal before reading data	-4
// EIO	I/O error	-5
// EBADF	bad fd, or fd not open for reading	-9
// EAGAIN	nonblocking fd would block	-11
// EFAULT	buf points outside accessible memory	-14
// EISDIR	fd refers to a directory	-21
// EINVAL	unsuitable fd/object, bad alignment with O_DIRECT, wrong timerfd buffer size, etc.	-22
//errno number list https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/errnos/

// read   	| return	| errno 
// EINTER	| -4		| 0x04.   //system interrupt
// EAGAIN	| -11	   	| 0x0b.   // resource temporary unavailable
// EBADF	| -9		| 0x09. //invalid file descriptor
// EFAULT	| -14		| 0x0e	//Address outside accessable value
// EINVAL	| -22		| 0x16		//unsuitable aligned (invalid arguments)
// EIO 		| -5 		| 0x05  //I/O error, may be due to processes issues
// EISDIR	| -21		| 0x15	//reading form directory
// EDESTADDRQ
// EDQUOT
// EFAULT
// EFBIG
//EINVAL
// EIO
// ENOSPC

