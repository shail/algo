class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# Given a node, and an array containing the path from the root node
# up to but not including this node, print out all root-leaf paths
def print_all_root_leaf(root, length_of_path, path_array)
  return if root.nil?

  # append node
  path_array[length_of_path] = root.val
  length_of_path += 1

  # leaf, so print the path that brung ya
  if root.left.nil? && root.right.nil?
    p path_array
  else
    print_all_root_leaf(root.left, length_of_path, path_array)
    print_all_root_leaf(root.right, length_of_path, path_array)
  end
end

root = Node.new(10)
root.left = Node.new(8)
root.right = Node.new(2)
root.left.left = Node.new(3)
root.left.right = Node.new(5)
root.right.left = Node.new(2)

print_all_root_leaf(root, 0, [])
