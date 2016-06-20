# A trie is an efficient information retrieval data structure. Using a trie, search complexities can be
# brought to the optimal limit (key length). A well balanced BST will need time proportional to M*logn(n)
# where M is the maximum string length and N is the number of keys in the tree. Using a tree, we can search
# the key in O(m). The penalty is in on trie storage requirements. Every node of trie consists of multiple
# branchces. Each branch represents a possible character of keys. We need to mark the last node of every key
# as a leaf node. A trie node field value will be used to distinguish the node as leaf node. Inserting a key
# into a trie is simple. Every character of the input key is inserted as an individual trie node. Children is
# an array of pointers to next level trie nodes. The key character acts as an index into the array children.
# If the input key is new or an extension of an existing key, we need to construct non-existing nodes of the
# key and mark the leaf node.
