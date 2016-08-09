class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = left
    @right = right
  end
end

def flip_tree(root)
  return nil if root.nil?

  if root.left.nil? && root.right.nil?
    return root
  end

  new_root = flip_tree(root.left)
  p root.left.left
  p root.right
  root.left.left = root.right
  root.left.right = root
  root.left = nil
  root.right = nil

  return new_root
end

root = Tree.new(1)
root.left = Tree.new(2)
root.right = Tree.new(3)
root.left.left = Tree.new(4)
root.left.right = Tree.new(5)
root.left.left.left = Tree.new(6)
root.left.left.right = Tree.new(7)

p flip_tree(root)

# Recursively traverse to the leftmost node
# This becomes the new root, and keep returning this value up the chain
# Make the follow changes
#   current_root.left.left = current_root.right
#   current_root.left.right = current_root
#   current_root.left = current_root.right = nil
