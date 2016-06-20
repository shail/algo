#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <assert.h>
#include "uthash.h"
#include <limits.h>
#include <stdbool.h>

typedef struct LinkedListNode LinkedListNode;

struct LinkedListNode {
    int val;
    LinkedListNode *next;
};

typedef struct hash {
    int id;
    int value;
    UT_hash_handle hh;
} hash;

int main(void) {
    struct hash *values = NULL;
    values = malloc(sizeof(struct hash));
    LinkedListNode *first;
    LinkedListNode *second;
    LinkedListNode *third;
    LinkedListNode *fourth;
    first = (LinkedListNode *) malloc(sizeof(LinkedListNode));
    second = (LinkedListNode *) malloc(sizeof(LinkedListNode));
    third = (LinkedListNode *) malloc(sizeof(LinkedListNode));
    fourth = (LinkedListNode *) malloc(sizeof(LinkedListNode));
    first->val = 1;
    second->val = 2;
    third->val = 3;
    fourth->val = 4;
    first->next = second;
    second->next = third;
    third->next = fourth;
    fourth->next = NULL;
}

