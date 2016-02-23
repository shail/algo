#include <stdio.h>
#include <stdlib.h>

// Could've done without the level param, but in many cases there is no alternative to tracking the recursion
// level

int DoAllFactorials(int n, int *results, int level) {
  if (n > 1) {
    results[level] = n * DoAllFactorials(n - 1, results, level + 1);
    return results[level];
  } else {
    results[level] = 1;
    return 1;
  }
}

int *AllFactorials(int n) {
  int *results;
  int length = (n == 0 ? 1 : n);
  results = (int *) malloc(sizeof(int) * length);
  if (!results) {
    return NULL;
  }
  DoAllFactorials(n, results, 0);
  return results;
}

int main(int argc, char *argv[]) {
  int *results;
  int n = 5;
  results = AllFactorials(n);
  for (int i = 4; i > -1; i--) {
    printf("Number: %d\n", results[i]);
  }
}
