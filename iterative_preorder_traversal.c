#include <stdio.h>
#include <stdlib.h>

int Push(element **stack, void *data);
int Pop(element **stack, void *data);
int CreateStack(element **stack);
int DeleteStack(element **stack);

typedef struct nodeT {
  struct nodeT *left;
  struct nodeT *right;
  int value;
} node;

// To do this iteratively, store the right child on an implicit stack and when you run out of children you
// should pull off the stack
void PreorderTraversal(node *root) {

}

int main(int argc, char *argv[]) {

}
