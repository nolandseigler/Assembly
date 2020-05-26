
#include <iostream>



extern "C" void CalculateSum(int a, int b, int c, int* s1, int* s2, int* s3);
//are the int* pointers to where the args are stored. is that how i grab them in assembly using [ebp+8], etc..
int main()
{
    int a = 2, b = 3, c = 4;
    int s1, s2, s3;

    CalculateSum(a, b, c, &s1, &s2, &s3);

    printf("Input a:    %4d    b:    %4d    c:    %4d\n", a, b, c);
    printf("Output sum:    %4d    square:    %4d    cube:    %4d\n", s1, s2, s3);

    return 0;
}

