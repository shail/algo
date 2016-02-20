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
//
// Create the stack
// Push the root node on the stack
// While stack is not empty
//  Pop a node
//  If node is not Null
//  Print its value
//  Push the node's right child on the stack
//  Push the node's left child on the stack
void PreorderTraversal(node *root) {
  node *stack;
  void *data;
  node *curNode;

  CreateStack(&stack);
  Push(&stack, root);

  while (Pop(&stack, &data)) {
    curNode = (node *) data;
    if (curNode) {
      printf("%d\n", curNode->value);
      Push(&stack, curNode->right);
      Push(&stack, curNode->left);
    }
  }
  DeleteStack(&stack);
}
