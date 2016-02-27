#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Given a string "hat", function should print "tha", "aht", "tah", "ath", "hta", "hat". Treat each character
// in the input string as a distinct character even if it is repeated. Given the string "aaa", it should print
// "aaa" six times

void DoPermute(char in[], char out[], int used[], int length, int recursLev) {
  int i;

  if (recursLev == length) {
    printf("%s\n", out);
    return;
  }

  for (i = 0; i < length; i++) {
    if (used[i]) {
      continue;
    }

    out[recursLev] = in[i]; /* put current letter in output */
    used[i] = 1; /* mark letter as used */
    DoPermute(in, out, used, length, recursLev + 1);
    used[i] = 0;
  }
}

int Permute(char inString[]) {
  int length, i, *used;
  char *out;

  length = strlen(inString);
  out = (char *) malloc(length + 1);
  out[length] = '\0';
  used = (int *) malloc(sizeof(int) * length);

  for (i = 0; i < length; i++) {
    used[i] = 0;
  }

  DoPermute(inString, out, used,length, 0);

  free(out);
  free(used);
  return 1;
}

int main(int argc, char *argv[]) {
  char *string = "abcd";
  Permute(string);
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
