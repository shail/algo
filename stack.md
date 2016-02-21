# Stack implementation: Dynamic Array or Linked List
- Principal advantage of a dynamic array is random access (immediately access any element). Operations on a
  stack always work on the end of hte data structure so the random accessibility of a dynamic array gains little.
  As a dynamic array grows it must be resized which is a time-consuming operation, if it is planned intelligently,
  a dynamic array may grow more efficiently than a linked list because a linked list must dynamically allocate 
  memory for each element. A linked list also has a memory overhead of one pointer for each element. If you store pieces of data on the stack, like single integers, this overhead is significant. For these reasons a dynamic array will be better for a stack.
