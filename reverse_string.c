#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  char *string_to_reverse = "tree";
  char *reversed_string = malloc((strlen(string_to_reverse) + 1) * sizeof(char));
  for (int i = 0; i < strlen(string_to_reverse); i++) {
   reversed_string[strlen(string_to_reverse) - i - 1] = string_to_reverse[i];
  }
  reversed_string[strlen(string_to_reverse) + 1] = '\0';
  printf("String: %s", reversed_string);
  free(reversed_string);
  return 0;
}
