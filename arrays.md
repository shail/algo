# Arrays

- an array consists of a number of variables of the same type arranged contiguously in a block of memory. an
  array provides a linear form of storage, array lookup if you know the index is O(1). if you only know the
  value then worst case the lookup is O(n) as it might be at the end of the array. the price for this improved
  lookup is decreased efficiency for insertion and deletion of data in the middle of the array. because an
  array is accessed in terms of physical memory locations, it is not possible to create/eliminate storage
  between two elements, you must move data within the array to make room for an insertion
- arrays are not dynamic data structures, they have finite, fixed number of elements, memory must be allocated
  for every element in an array, even if only part of it is used. arrays are the best when you know how many
  elements you need before the program executes
- dynamic arrays are dynamic data structures that have the properties of arrays but can change size to
  efficiently store as much or as little data as necessary, most dynamic array implementations use static
  arrays internally. a static array cannot be resized, so dynamic arrays are resized by allocating a new array
  of approximate size, copying every element from the old array into the new array and freeing the old array.
  this is obviously an expensive operation
- you cannot copy one array to another because an array name is equivalent to a pointer constant to the first
  element of the array, so you need to use a loop for an element-by-element assignment or use something like
  memcpy, you also need to keep track of the size as there is no bounds checking on array accesses
- String in C is nothing more than a char array, also size of string not tracked, end of string is marked with
  a NULL character, therefore finding the length of a string is O(n), to copy one string into another you have
  to use the strcpy() function. 

