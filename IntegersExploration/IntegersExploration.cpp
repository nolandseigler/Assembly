
#include <iostream>


extern "C" char GlChar = 10;
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GLongLong = 0x000000000FFFFFFFFF;

extern "C" void IntegerAddition(char a, short b, int c, long long d);
int main()
{
    IntegerAddition(3, 5, -37, 11);

    printf("Int value %d\n", GlInt);
}
