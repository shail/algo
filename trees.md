# Trees

- A tree is made up of nodes (data elements) with zero, one, or several child pointers or references to other
  elements. Each node has only one other node pointing to it or referencing it. 

typedef struct nodeT {
  /* struct nodeT** because it points to an array of struct nodeT* */
  struct nodeT **children;
  int value;
} node;

- In this definition, children points to an array that keeps track of all the nodes that this node points to.
  You will see that there is only one top-level node. From this node, it is possible to follow pointers and
  reach every other node. The top-level node is called the root. The root is the only node from which you are
  guaranteed to have a path to every other node. The root node is inherently the start of any tree. Therefore,
  people will often say tree when talking about the root node of the tree.

  Parent: a node that points to other nodes is the parent of those nodes
  Child: a node is the child of any node that points to it
  Descendant: all nodes that can be reached by following a path of child nodes from a particular node are the descendants of that node
  Ancestor: any other node that can reach it by following a series of children
  Leaves: leaves are the nodes that do not have any children.
