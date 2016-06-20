class Tree
  attr_accessor :val, :left, :right, :sibling
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
    @sibling = nil
  end
end

root = Tree.new(1)
root.left = Tree.new(2)
root.right = Tree.new(3)
root.left.left = Tree.new(4)
root.left.right = Tree.new(5)
root.right.left = Tree.new(6)
root.right.right = Tree.new(7)

def sibling_pointer(root)
  return if root.nil?
  root.left.sibling = root.right if root.left
  if root.right
    sibling = root.sibling ? root.sibling.left : nil
    root.right.sibling = sibling
  end
  sibling_pointer(root.left)
  sibling_pointer(root.right)
  root
end

root = sibling_pointer(root)
puts root.left.sibling.val == 3
puts root.left.left.sibling.val == 5
puts root.left.right.sibling.val == 6
puts root.right.left.sibling.val == 7
puts root.right.right.sibling == nil


