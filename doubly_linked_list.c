#include <stdio.h>
#include <stdlib.h>

typedef struct nodeT {
    struct nodeT *next;
    struct nodeT *prev;
    struct nodeT *child;
    int value;
} node;

void Append(node *child, node **tail) {
    node *curNode;
    (*tail)->next = child;
    child->prev = *tail;

    for (curNode = child; curNode->next; curNode = curNode->next) {
    };

    *tail = curNode;
}

void flattenList(node *head, node **tail) {
    node *curNode = head;
    while (curNode) {
        if (curNode->child) {
            Append(curNode->child, tail);
        }
        curNode = curNode->next;
    }

    for (curNode = head; curNode->next; curNode = curNode->next) {
    };

    *tail = curNode;
}

void exploreAndSeparate(node *childListStart) {
  node *curNode = childListStart;

  while (curNode) {
    if (curNode->child) {
      curNode->child->prev->next = NULL;
      curNode->child->prev = NULL;
      exploreAndSeparate(curNode->child);
    }
    curNode = curNode->next;
  }
}

void unflattenList(node *head, node **tail) {
    node *curNode = head;
    exploreAndSeparate(head);
}

int main(int argc, char *argv[]) {
    node *first, *second, *third, *fourth, *fifth, *sixth, *sev, *eight;
    first = (node *) malloc(sizeof(node));
    second = (node *) malloc(sizeof(node));
    third = (node *) malloc(sizeof(node));
    fourth = (node *) malloc(sizeof(node));
    fifth = (node *) malloc(sizeof(node));
    sixth = (node *) malloc(sizeof(node));
    sev = (node *) malloc(sizeof(node));
    eight = (node *) malloc(sizeof(node));
    first->next = second;
    first->prev = NULL;
    first->child = fourth;
    first->value = 1;
    second->prev = first;
    second->next = third;
    second->child = NULL;
    second->value = 2;
    third->prev = second;
    third->next = NULL;
    third->child = NULL;
    third->value = 3;
    fourth->prev = NULL;
    fourth->next = fifth;
    fourth->child = NULL;
    fourth->value = 4;
    fifth->prev = fourth;
    fifth->next = sixth;
    fifth->child = sev;
    fifth->value = 5;
    sixth->prev = fifth;
    sixth->next = NULL;
    sixth->child = NULL;
    sixth->value = 6;
    sev->prev = NULL;
    sev->next = eight;
    sev->child = NULL;
    sev->value = 7;
    eight->prev = sev;
    eight->next = NULL;
    eight->child = NULL;
    eight->value = 8;
    flattenList(first, &third);
    node *curNode = first;
    while (curNode) {
        printf("Node value: %d\n", curNode->value);
        curNode = curNode->next;
    }
    unflattenList(first, &eight);
    curNode = first;
    while (curNode) {
        printf("Node value: %d\n", curNode->value);
        curNode = curNode->next;
    }
}
