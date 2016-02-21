// Given the value of two nodes in a binary search tree, find the lowest common ancestor. Assume that both
// values already exist in the tree. Running time here is O(log(n)). More efficient than a similar recursive
// solution because you don't have the overhead of repeated function calls

typedef struct nodeT {
  struct nodeT *left;
  struct nodeT *right;
  int value;
} node;

int FindLowestCommonAncestor(node *root, int value1, int value2) {
  node *curNode = root;
  while (1) {
    if (value1 < curNode->value && value2 < curNode->value) {
      curNode = curNode->left;
    } else if (value1 > curNode->value && value2 > curNode->value) {
      curNode = curNode->right;
    } else {
      return curNode->value;
    }
  }
}
