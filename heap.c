#include <stdio.h>
#include <stdlib.h>

// Another common tree is a heap. All heaps are binary trees. Heaps have the property that each node's value
// is less than its parent node's value so the root node has the greatest value. The biggest advantage of a
// heap is that it is possible to find the maximum value in constant time by simply returning the root value.
// Insertion and deletion are still O(log(n)), but lookup becomes O(n). Not possible to find the next-higher
// node to a given node in O(log(n)) time or print out the nodes in sorted order in O(n) time. You could model
// the patients waiting in a hospital emergency room with a heap, as each patient enters, he is assigned a
// priority and put into the heap. As a doctor becomes available they just pull the highest priority patient
// out, which is a constant time operation.
