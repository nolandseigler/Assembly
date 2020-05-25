
#include <iostream>

extern "C" int AdderASM(int a, int b, int c);
int AdderCPP(int a, int b, int c);

int main()
{
    int a = 17, b = 11, c = 14;
    int sum = AdderCPP(a, b, c);
    int assemblySum = AdderASM(a, b, c);

    printf("a:    %d\n", a);
    printf("b:    %d\n", b);
    printf("c:    %d\n", c);
    printf("cPPSum:  %d\n", sum);
    printf("assemblySum:  %d\n", assemblySum);

    return 0;
}

int AdderCPP(int a, int b, int c)
{
    return a + b + c;
}
