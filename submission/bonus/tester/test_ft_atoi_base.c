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
    test_case_atoi_base("11", "11", 0, "testing repeated character base");
    test_case_atoi_base("0", "01", 0, "testing 0 base 2");
    test_case_atoi_base("1", "01", 1, "testing 1 base 2");
    test_case_atoi_base("0", "0123456789", 0, "testing 0");
    test_case_atoi_base("4", "0123456789", 4, "testing repeated character base");
    test_case_atoi_base("b", "0123456789", 0, "testing invalid character input");
    test_case_atoi_base("11", "0123456789", 11, "testing 11 in decimal");
    test_case_atoi_base("66a", "0123456789", 66, "testing 66");
    test_case_atoi_base("-5", "0123456789", -5, "testing -5");
    test_case_atoi_base("5333333", "0123456789", 5333333, "testing 5333333");
    test_case_atoi_base("-5333333", "0123456789", -5333333, "testing higher negative value");
    test_case_atoi_base("01", "01", 1, "testing 1 in binary");
    char s14[] = {'0', '1', 14, 0}; char * gap = (char*)"0123450";
    test_case_atoi_base("1", gap, 0, "testing repeated 0 gap");
    test_case_atoi_base("1", s14, 1, "testing repeated 1 s14");
    test_case_atoi_base("           123", "0123456789", 123, "testing 123");
    test_case_atoi_base("--123", "0123456789", 123, "testing 123");
    test_case_atoi_base("-+123", "0123456789", -123, "testing 123");
    test_case_atoi_base(" ---+--+123", "0123456789", -123, "testing ---+--+123");
    // case_null();
}
