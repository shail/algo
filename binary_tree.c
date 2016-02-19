#include <stdio.h>
#include <stdlib.h>

// Binary tree - each node has no more than two children, called right and left.
// When an element has no left or right child, the corresponding pointer is set to NULL. You need to clarify
// in an interview if they are referring to a binary tree or not.
// Trees are often used to store sorted or ordered data. Most common way to store data in a tree is using a
// special tree called a binary search tree (BST). In a BST, the value of each node's left child is less than
// or equal to its value, and the value of each node's right child is greater than or equal to its value.
//
// Lookup of BST:
//  Lookup is fast and simple because you start at the root node and basically remove half the nodes you need
//  to lookup at every iteration. Running time is equal to the number of times that you can halve n nodes
//  before you get to 1. O(log(n)) -- the caveat to this is that you can guarantee that the number of nodes
//  remaining to be searched will be halved or nearly halved on each iteration. In the worst case, each node
//  has only one child. A tree with approximately the same number of nodes on each side is called a balanced
//  tree. Insert and deletion into a BST is also O(log(n)). BSTs also allow you to find the smallest element
//  by following all the left child pointers and to obtain the largest elemenet by following all of the right
//  child pointers. The nodes can be printed out in order in O(n) time. It is even possible, given a node, to
//  find the next highest node in O(log(n)) time.
//
// Tree problems are often designed to test your ability to think recursively as each node in a tree is the
// root of a subtree beginning at that node. You start with the root, perform an action, and then move to the
// left or right subtree (or both, one after the other), continuing until you reach a NULL pointer.

typedef struct nodeT {
  struct nodeT *left;
  struct nodeT *right;
  int value;
} node;
