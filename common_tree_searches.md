# Common Searches

- When you do not have a tree with ordering properties such as a BST or a heap, you have to use different
  techniques to retrieve data from this kind of tree. Two common search algos for accomplishing this task.

  - Breadth-First Search
    - you start with the root, move left to right across the second level, then move left to right across the
      third level, and so forth. you continue the search until you have examined all of the nodes or you find 
      the node you are searching for. Time to find a node is O(n), so best avoided for large trees, and uses
      a large amount of memory because it is necessary to store pointers to a levels child nodes while
      searching that level.

  - Depth-First Search:
    - DFS follows one branch of the tree down as many levels as possible until the target node is found. When
      the search cannot go down any farther, it is continued at the nearest ancestor with unexplored children.
      DFS has much lower memory requirements because you do not need to store all the child pointers at each
      level. Also DFS has the advantage that it does not examine any single level last. This is useful if you
      suspect that the node you are searching for will be in the lower levels. If you were searching a job
      hierarchy tree looking for an employee who started less than three months ago, you would suspect that
      lower-level employees are more likely to have started recently.

# Traversals

- As opposed to searching for a particular node and stopping when you find it as in a search, a traversal
  visits every node and performs some operation on it. Three most common type of traversals are preorder, in-order, and postorder. If you are asked to implement a traversal, recursion is a good way to start thinking about the problem.
