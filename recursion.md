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

- Recursion is a very powerful technique, it is not always the best and rarely the most efficient approach.
  This is due to the relatively large overhead for funtion calls on most platforms. Iterative functions, which
  use looping constructs instead of recursive function calls, do not suffer from this overhead and are
  frequently more efficient. For some problems there are no obvious iterative algorithms. It is possible to
  implement a recursive algo w/o using recursive function calls. Recursive function calls used to preserve
  current values of local variables so these values can be restored when the subtask performed by the
  recursive function call is completed. You can eliminate the need for recursive function calls by allocating
  your own stack and manually storing and retrieving values of local variables from this stack. implementing
  this type of function tends to be significantly more complicated than implementing the recursive version.
