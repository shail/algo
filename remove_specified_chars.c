#include <stdio.h>
#include <stdlib.h>

// Strings are stored in arrays, so your task is to delete an elemnt from an array. An array is a contiguous
// block of memory so you can't simply remove an element from the middle as you might with a linked list. For
// example, if you want to delete 'c' from 'abcd', you could shift 'a' and 'b' forward one position, or shift
// 'd' back one position. Shifting backward is cleaner because you can just add the null character after the
// last character and this will ignore everything afterwards. Shifting backward run time for the worst case
// would be O(n^2). You could store a temporary string and then copy it back to the original string but this
// has the overhead of the temporary buffer. To implement O(n) algo w/o extra space, need to track a source
// position for the read location in the original string and a destination position for the write position in
// the temporary buffer. Both start at zero, source will be incremented every time you read and destination
// every time you read and destination at every time you write. When you copy a character you'll increment
// both positions, but when you delete a character you'll increment only the source position. Source position
// will always be at or ahead of the destination position. Once you've read a character from the original
// string (source position has advanced passed it), you no longer need the character, you're just going to
// copy the modified string over it. Because the destination position in the original string is always a
// character you don't need anymore, you can write directly into the original string, eliminating the
// temporary buffer entirely. Runtime O(n) but without the overhead of the earlier version. In order to decide
// whether you need to delete the character or not, could use a lookup table (array) or a hash table. Because
// the set of possible is pretty low (ASCII - 256), lookup table here should be easy enough.

void RemoveChars(char str[], char remove[]) {
  int src, dst, removeArray[256];

  // Zero all elements in lookup table
  for (src = 0; src < 256; src++) {
    removeArray[src] = 0;
  }

  // Set true for chars to be removed
  src = 0;
  while (remove[src]) {
    removeArray[remove[src]] = 1;
    src++;
  }

  // Copy char unless it must be removed
  src = dst = 0;
  do {
    if (!removeArray[str[src]]) {
      str[dst++] = str[src];
    }
  } while (str[src++]);
}

int main(int argc, char *argv[]) {
  char str[] = "Blahtreef\0";
  char remove[] = "a\0";
  RemoveChars(str, remove);
  printf("String: %s\n", str);
}
