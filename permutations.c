#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Given a string "hat", function should print "tha", "aht", "tah", "ath", "hta", "hat". Treat each character
// in the input string as a distinct character even if it is repeated. Given the string "aaa", it should print
// "aaa" six times

int main(int argc, char *argv[]) {

}

// Consider listing all the permutations in alphabetical order. First group of permutations start with "a",
// within this group, you'll first have the permutations with a second letter "b", then "c", and finally "d".
// There are n! possible arrangements of n objects. You can define the algorithm as picking a letter for a
// given position and performing the permutation process starting at the next position to the right before
// coming back to change the letter you just picked.
//abcd
//abdc
//acbd
//acdb
//adbc
//adcb
