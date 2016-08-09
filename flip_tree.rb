class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end
def flip_tree(root)
  if root.nil?
    return
  else
    temp = root.left
    root.left = root.right
    root.right = temp
    flip_tree(root.left) if !root.left.nil?
    flip_tree(root.right) if !root.right.nil?
  end
  root
end

root = Tree.new(1)
root.left = Tree.new(2)
root.right = Tree.new(3)
root.left.left = Tree.new(4)
root.left.right = Tree.new(5)
root.right.left = Tree.new(6)
root.right.right = Tree.new(7)

puts flip_tree(root).inspect
