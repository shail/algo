class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# This assumes that the keys are in the tree
# Traverse tree from root
#   - if any matche the root then the root is the LCA
#   - recur left and right subtree
#   - otherwise the node which has one key present in left subtree and one in right subtree is the LCA
#   - if both keys are in left subtree, then left subtree has LCA, otherwise the right does
def find_lca(root, n1, n2)
  # Base case
  return if root.nil?

  # if either n1 or n2 matches with root key, report the presence by returning root, if a key is ancestor of
  # other, then the ancestor key becomes LCA
  return root if root.val == n1 || root.val == n2

  # look for keys in left and right subtrees
  left_lca = find_lca(root.left, n1, n2)
  right_lca = find_lca(root.right, n1, n2)

  # if both return non-null values, the one key is present in one subtree and one is in other so this is the
  # LCA
  return root if left_lca && right_lca

  return !left_lca.nil? ? left_lca : right_lca
end

root = Tree.new(1)
root.left = Tree.new(2)
root.right = Tree.new(3)
root.left.left = Tree.new(4)
root.left.right = Tree.new(5)
root.right.left = Tree.new(6)
root.right.right = Tree.new(7)

puts find_lca(root, 4, 5).inspect
