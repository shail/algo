INT_MIN = -(2**63)
INT_MAX = 2**63 - 1

class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def find_largest_bst(root, min_val, max_val, max_nodes, largest_bst, child)
  return [0] unless root
  if min_val < root.val && root.val < max_val
    left_nodes = find_largest_bst(root.left, min_val, root.val, max_nodes, largest_bst, child).first
    left_child = left_nodes == 0 ? nil : child
    right_nodes = find_largest_bst(root.right, root.val, max_val, max_nodes, largest_bst, child).first
    right_child = right_nodes == 0 ? nil : child
    parent = Tree.new(root.val)
    parent.left = left_child
    parent.right = right_child
    child = parent
    total_nodes = left_nodes + right_nodes + 1
    if total_nodes > max_nodes
      max_nodes = total_nodes
      largest_bst = parent
    end
    return [total_nodes, largest_bst]
  else
    find_largest_bst(root, INT_MIN, INT_MAX, max_nodes, largest_bst, child).first
    return [0]
  end
end

root = Tree.new(15)
root.left = Tree.new(10)
root.right = Tree.new(20)
root.left.left = Tree.new(5)
root.left.right = Tree.new(7)
root.left.right.left = Tree.new(2)
root.left.right.right = Tree.new(5)
root.left.right.left.left = Tree.new(0)
root.left.right.left.right = Tree.new(8)
root.left.right.right.left = Tree.new(3)

largest_bst = Tree.new(nil)
child = Tree.new(nil)
result = find_largest_bst(root, INT_MIN, INT_MAX, INT_MIN, largest_bst, child)
puts "Max number of nodes: #{result.first}"
puts "Value of root of largest BST: #{result[1].val}"
