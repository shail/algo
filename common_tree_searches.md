# Common Searches

- When you do not have a tree with ordering properties such as a BST or a heap, you have to use different
  techniques to retrieve data from this kind of tree. Two common search algos for accomplishing this task.

  - Breadth-First Search
    - you start with the root, move left to right across the second level, then move left to right across the
      third level, and so forth. you continue the search until you have examined all of the nodes or you find the node you are searching for. Time to find a node is O(n), so best avoided for large trees, and uses a large amount of memory because it is necessary to store pointers to a levels child nodes while searching that level.
