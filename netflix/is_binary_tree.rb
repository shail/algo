class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def is_binary_tree(root, min, max)
  return true if root.nil?
  if min < root.val && root.val < max
    result = is_binary_tree(root.left, min, root.val)
    result_two = is_binary_tree(root.right, root.val, max)
  else
    return false
  end
  result && result_two
end

root = Tree.new(10)
root.left = Tree.new(8)
root.left.left = Tree.new(4)
root.left.right = Tree.new(9)
root.right = Tree.new(12)

false_tree = Tree.new(1)
false_tree.left = Tree.new(5)
false_tree.right = Tree.new(6)

puts is_binary_tree(root, -2**63, 2**63-1)
puts is_binary_tree(false_tree, -2**63, 2**63-1)
