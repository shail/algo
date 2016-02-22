#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_DIGITS_INT 10
// First function should convert an ASCII string to a signed integer, and the second function a signed integer
// to an ASCII string. A digits numeric value is 'digit' - '0', as it is basically a distance from '0'. The
// compiler will know to interpret this as "subtract the ASCII value of 0". To know what place value each
// digit is, you can iterate through the string and multiply the previous value by 10 everytime you encounter
// a new digit. This optimization is called Horner's Rule. If the number is negative you have to set a flag to
// signify if it is positive or negative and multiply by -1 if it is negative.
//
// IntToStr - you can convert integer values back to ASCII digits by adding '0' to each digit. Computers don't
// store digits as decimals but rather as a binary representation. Becase you can't select decimal digits
// directly from a binary number, you'll have to calculate the value of each digit.

int StrToInt(char str[]) {
    int number = 0;
    int i = 0;
    int isNeg = 0;
    if (str[0] == '-') {
        isNeg = 1;
        i = 1;
    }
    for (; i < strlen(str); i++) {
        number *= 10;
        number += (str[i] - '0');
    }

    if (isNeg) {
        number *= -1;
    }
    return number;
}
void IntToStr(int num, char str[]) {
    int i = 0, j = 0, isNeg = 0;
    // Buffer big enough for larget int, - sign and NULL
    char temp[MAX_DIGITS_INT + 2];
    if (num < 0) {
        num *= -1;
        isNeg = 1;
    }

    do {
        temp[i++] = (num % 10) + '0';
        num /= 10;
    } while (num);

    if (isNeg) {
        temp[i++] = '-';
    }

    // Reverse numbers
    while (i > 0) {
        str[j++] = temp[--i];
    }

    str[j] = '\0';
}

int main(int argc, char *argv[]) {
    char str[] = "123\0";
    char negativeStr[] = "-123\0";
    int zero = 0;
    char first[MAX_DIGITS_INT+2];
    int one = 1;
    char second[MAX_DIGITS_INT+2];
    int negOne = -1;
    char third[MAX_DIGITS_INT+2];
    int digits = 534;
    char fourth[MAX_DIGITS_INT+2];
    printf("Number: %d\n", StrToInt(str));
    printf("Number: %d\n", StrToInt(negativeStr));
    IntToStr(zero, first);
    IntToStr(one, second);
    IntToStr(negOne, third);
    IntToStr(digits, fourth);
    printf("Number: %s\n", first);
    printf("Number: %s\n", second);
    printf("Number: %s\n", third);
    printf("Number: %s\n", fourth);
}
