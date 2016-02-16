// Singly linked lists consists of a number of data elements in which each data element has a next pointer or
// next reference to the following element. The link of the last element in the list is marked to indicate the
// last element in the list, marking the next pointer as NULL. Singly linked lists can only be traversed in
// the forward direction, so a complete traversal of the list must begin with the first element. In other
// words, you need a pointer to the first element of a list in order to locate all the elements in the list. 

#include <stdlib.h>
#include <stdio.h>

typedef struct elementT {
  int data;
  struct elementT *next;
} element;

// Bug fix with this function
// 1.) Check that data comes into the function properly
//  - Make sure you arne't accessing a variable that you don't have, you aren't reading something as an int
//  that should be a long, and you have all the values you need to perform the task
// 2.) Check that each line of the function works correctly.
//  - The function is undoubtedly performing a task. Verify that the task is executed correctly at each line
//  and that the desired result is produced at the end.
// 3.) Check that the data comes out of the function correctly.
//  - The return value should be what you expect. Also, if the function is expected to update any caller
//  variables, make sure this occurs.
// 4.) Check common error conditions.
//  - Error conditions vary depending on the specifics of a problem. Tend to involve unusual argument values.
//  Functions that operate on data structures may have trouble with empty or nearly empty data structures.
//  Functions that take a pointer as an argument may fail if passed a NULL pointer.
//
//  C is pass by value, so functions get a local copy of each argument, but they need to edit the actual
//  variable, so you need to pass a pointer to the variable (pointer to the pointer).
//  Also need to check error conditions (zero-element list)
void RemoveHead(element **head) {
  element *temp;
  if (!(*head)) {
    temp = (*head)->next
    free(*head);
    *head = temp;
  }
}

// Delete and InsertAfter provide good edge cases to solve against
// This is if you have global pointers head and tail that point to the first and last element
int Delete(element *elem) {

  element *curPos = head;
  if (elem == head) {
    head = elem->next;
    free(elem);
    return 1;
  }

  while (curPos) {
    if (curPos->next == elem) {
      curPos->next = elem->next;
      free(elem);
      if (curPos->next == NULL) {
        tail = curPos;
      }
      return 1;
    }
    curPos = curPos->next;
  }

  return 0;
}

// Update the head pointer in C is to pass a pointer to the head pointer
int Insert(element *newElem, element *head) {
  newElem->next = head;
  // head gives the calling function's head pointer, so the change is not lost
  // when this function returns
  return 1;
}

int Traverse(element *start) {
  while (start) {
    printf("Value: %d\n", start->data);
    start = start->next;
  }
  return 0;
}

int DeleteElement(element *head, element *deleteMe) {
  while (head) {
    if (head->next == deleteMe) {
      head->next = deleteMe->next;
      free(deleteMe);
      return 1;
    }
    head = head->next;
  }
  return 0;
}

// Free doesn't free the integer since that wasn't malloc'd, just removes the next reference
void DeleteList(element *head) {
  element *next, *deleteMe;
  deleteMe = head;
  while (deleteMe) {
    next = deleteMe->next;
    free(deleteMe);
    deleteMe = next;
  }
}

// Don't know the length
// Start with two pointers that are k nodes apart and keep iterating until you reach the end
// k = 2 (second to last element) return 6
// 18 5 6 8

// Recursively you want to go all the way to the end and then increment a counter as you go back up

element* nthToLast(element* head, int k, int *i) {
  if (head == NULL) {
    return NULL;
  }
  element *elem = nthToLast(head->next, k, i);
  *i = *i + 1;
  if (*i == k) {
    return head;
  }
  return elem;
}

int recursiveFindKthElem(element *head, int k) {
  int i = 0;
  element *elem = (element *) malloc(sizeof(element));
  elem = nthToLast(head, k, &i);
  printf("Data: %d\n", elem->data);
  return 0;
}

int FindKthElem(element *head, int k) {
  int i = k - 1;
  element *elem = head;
  element *second_ptr = elem->next;
  while (i > 0) {
    second_ptr = second_ptr->next;
    i = i - 1;
  }
  while (second_ptr) {
    if (second_ptr->next == NULL) {
      printf("KthElem: %d\n", elem->next->data);
      return elem->next->data;
    }
    second_ptr = second_ptr->next;
    elem = elem->next;
  }
  return 0;
}

int main(int argc, char *argv[]) {
  // initialize a linkedlist
  element *head;
  element *second;
  element *tail;
  head = (element *) malloc(sizeof(element));
  second = (element *) malloc(sizeof(element));
  tail = (element *) malloc(sizeof(element));
  head->data = 5;
  second->data = 6;
  tail->data = 8;
  head->next = second;
  second->next = tail;
  tail->next = NULL;
  element *new_head;
  new_head = (element *) malloc(sizeof(element));
  new_head->data = 18;
  int head_val = new_head->data;
  Insert(new_head, head);
  printf("New_head: %d\n", new_head->next->data);
  Traverse(new_head);
  //DeleteElement(new_head, second);
  printf("\n");
  Traverse(new_head);
  FindKthElem(new_head, 2);
  recursiveFindKthElem(new_head, 2);
  DeleteList(new_head);
  if (new_head->data != head_val) {
    printf("list deleted");
  }
  return 0;
}
