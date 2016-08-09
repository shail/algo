#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *left;
    struct Node *right;
} Node;

void spine(Node *p, Node **prev, Node **head) {
    if (!p) return;
    spine(p->left, prev, head);
    if (prev) (*prev)->right = p;
    else (*head) = p;
    (*prev) = p;
    p->left = NULL;
    spine(p->right, prev, head);
    printf("VALUE: %d\n", (*prev)->data);
    printf("VALUE1: %d\n", (*head)->data);
}

void merge(Node *n1) {
    Node *prev, *head1;
    prev = (Node *) malloc(sizeof(Node));
    head1 = (Node *) malloc(sizeof(Node));
    prev = head1 = 0; spine(n1, &prev, &head1);
    /*printf("HEAD: %d", head1->data);*/
    /*[>prev = head2 = 0; spine(n2, prev, head2);<]*/
}

int main(int argc, char *argv[]) {
   Node *root;
   Node *left;
   Node *right;
   root = (Node *) malloc(sizeof(Node));
   left = (Node *) malloc(sizeof(Node));
   right = (Node *) malloc(sizeof(Node));
   root->data = 2;
   left->data = 1;
   right->data = 3;
   root->left = left;
   root->right = right;
   left->left = NULL;
   left->right = NULL;
   right->left = NULL;
   right->right = NULL;
   merge(root);
   return 0;
}
