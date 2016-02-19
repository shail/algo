#include <stdio.h>

int AcyclicOrCyclic(node *head);

typedef struct nodeT {
  struct nodeT *next;
  int data;
} node;

int AcyclicOrCyclic(node *head) {
  node *fast = head;
  node *slow = head;
  while (1) {
    if (!fast || !fast->next) {
      return 0;
    } else if (fast == slow || fast->next == slow) {
      return 1;
    } else {
      fast = fast->next->next;
      slow = slow->next;
    }
  }
}

// Given a linked list that is either NULL-terminated (acyclic) or ends in a cycle (cyclic)
int main(int argc, char *argv[]) {

}
