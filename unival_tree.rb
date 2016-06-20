class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = left
    @right = right
  end
end

def count(root, counter)
  return true unless root

  left = count(root.left, counter)
  right = count(root.right, counter)
  if left && right
    left_node = root.left
    right_node = root.right
    if !left_node && !right_node
      counter[0] += 1
      return true
    elsif left_node && right_node && left_node.val == root.val && right_node.val == root.val
      counter[0] += 1
      return true
    elsif left_node && left_node.val == root.val
      counter[0] += 1
      return true
    elsif right_node && right_node.val == root.val
      counter[0] += 1
      return true
    end
  else
    return false
  end
end

root = Tree.new(1)
root.left = Tree.new(2)
root.left.left = Tree.new(2)
root.left.right = Tree.new(2)
root.left.left.left = Tree.new(5)
root.left.left.right = Tree.new(5)
root.right = Tree.new(3)
root.right.left = Tree.new(3)
root.right.right = Tree.new(3)
root.right.left.left = Tree.new(4)
root.right.left.right = Tree.new(4)
root.right.right.left = Tree.new(3)
root.right.right.right = Tree.new(3)

second_root = Tree.new(5)
second_root.left = Tree.new(5)
second_root.right = Tree.new(5)
second_root.left.left = Tree.new(5)
second_root.left.right = Tree.new(5)
second_root.right.right = Tree.new(5)

# This function is easier to define with counter being a reference, but ruby is pass by value, but if you use
# an array, a ref will be passed.
counter = [0]
count(root, counter)
puts counter.first.inspect
counter = [0]
count(second_root, counter)
puts counter.first.inspect
