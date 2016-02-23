# Recursion
- recursion is most useful for tasks that can be defined in terms of similar subtasks. sort, search, and
  traversal problems often have simiple recursive solutions. a recursive function performs a task in part by
  calling itself to perform the subtasks. at some point, the function encounters a subtask that it can perform
  without calling itself, this is called the base case. the recursive case is where the function calls itself
  to perform a subtask. Factorial equation is a very good example of this recursion. Often recursive functions
  may require an additional data structure that tracks the recursion level. The best soultion is usually to
  move the data structure or argument initialization code into a separate function. This wrapper function,
  which performs initialization and then calls the purely recursive function, provides a clean, simple
  interface to the rest of the program.
