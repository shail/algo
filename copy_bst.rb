class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = left
    @right = right
  end
end

def copy_bst(root)
  copy_node = nil
  if root
    copy_node = Tree.new(root.val)
    copy_node.left = copy_bst(root.left)
    copy_node.right = copy_bst(root.right)
  end
  copy_node
end

root = Tree.new(1)
root.left = Tree.new(2)
root.right = Tree.new(3)

puts copy_bst(root).inspect
