#include <stdio.h>
#include <stdlib.h>

// First function should convert an ASCII string to a signed integer, and the second function a signed integer
// to an ASCII string. A digits numeric value is 'digit' - '0', as it is basically a distance from '0'. The
// compiler will know to interpret this as "subtract the ASCII value of 0". To know what place value each
// digit is, you can iterate through the string and multiply the previous value by 10 everytime you encounter
// a new digit. This optimization is called Horner's Rule. If the number is negative you have to set a flag to
// signify if it is positive or negative and multiply by -1 if it is negative.

int StrToInt(char str[]);
void IntToStr(int num, char str[]);

int main(int argc, char *argv[]) {

}
