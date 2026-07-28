#include "test_headers.h"



void test_case_atoi_base(char *str, char *base, int expected_out, char *msg)
{
    int result = ft_atoi_base(str, base);
    if (result == expected_out)
    {
        printf("%s, Test passed 😎\n", msg);
        return;
    }
    else
    {
        printf("%s, Test failed 😱\n", msg);
        printf("Expected %d, got %d\n", expected_out, result);
        return; 

    }

}
void 	test_ft_test_atoi_base(char **argv)
{
    test_case_atoi_base(NULL, "0123456789", 0, "testing NULL string");
    test_case_atoi_base("11", NULL, 0, "testing NULL base");
    test_case_atoi_base("11", "", 0, "testing empty base");
    test_case_atoi_base("11", "1", 0, "testing one character");
    test_case_atoi_base("11", "01 234", 0, "testing space in the base");
    test_case_atoi_base("11", "01\t234", 0, "testing tab in the base");
    test_case_atoi_base("11", "01\n234", 0, "testing new line in the base");
    test_case_atoi_base("11", "+0123456789", 0, "testing + character base");
    test_case_atoi_base("11", "-01123456789", 0, "testing - character base");
    test_case_atoi_base("11", "01123456789", 0, "testing repeated character base");
    // test_case_atoi_base("11", "0123456789", 11, "testing repeated character base");
    // test_case_atoi_base("0", "0123456789", 0, "testing 0");
    // case_null();
}
