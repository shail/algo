#include <stdio.h>
#include <stdlib.h>

typedef struct nodeT {
  struct nodeT *left;
  struct nodeT *right;
  int value;
} node;

void PreorderTraversal(node *root) {
    if (root) {
        printf("Value: %d\n", root->value);
    } else {
        return ;
    }
    PreorderTraversal(root->left);
    PreorderTraversal(root->right);
}

int main(int argc, char *argv[]) {
}
