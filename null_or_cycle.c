#include <stdio.h>
#include <stdlib.h>

typedef struct nodeT {
    struct nodeT *next;
    int data;
} node;

int AcyclicOrCyclic(node *head);

int AcyclicOrCyclic(node *head) {
    node *fast = head->next;
    node *slow = head;
    while (1) {
        if (!fast || !fast->next) {
            return 0;
        } else if (fast == slow || fast->next == slow) {
            return 1;
        } else {
            slow = slow->next;
            fast = fast->next->next;
        }
    }
}

// Given a linked list that is either NULL-terminated (acyclic) or ends in a cycle (cyclic)
int main(int argc, char *argv[]) {
    node *head;
    node *second;
    node *tail;
    head = (node *) malloc(sizeof(node));
    second = (node *) malloc(sizeof(node));
    tail = (node *) malloc(sizeof(node));
    head->data = 5;
    second->data = 6;
    tail->data = 8;
    head->next = second;
    second->next = tail;
    tail->next = NULL;
    printf("Value: %d\n", AcyclicOrCyclic(head));
    tail->next = head;
    printf("Value: %d\n", AcyclicOrCyclic(head));
}
