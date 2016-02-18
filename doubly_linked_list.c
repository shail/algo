#include <stdio.h>
#include <stdlib.h>

typedef struct nodeT {
  struct nodeT *next;
  struct nodeT *prev;
  struct nodeT *child;
  int value;
} node;
