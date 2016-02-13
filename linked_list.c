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
  DeleteElement(new_head, second);
  printf("\n");
  Traverse(new_head);
  DeleteList(new_head);
  if (new_head->data != head_val) {
    printf("list deleted");
  }
  return 0;
}
