# Max depth of a binary tree, get the left most height, when that is exhaustive, go right. The depth of a
# binary tree can be gotten by the greater between the left subtree depth + 1 or the right subtree depth + 1.

def max_depth(root)
  return 0 if root.nil?
  left_height = max_depth(root.left)
  right_height = max_depth(root.right)
  return left_height > right_height ? left_height + 1 : right_height + 1;
end
