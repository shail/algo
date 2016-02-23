class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def invert_tree(root)
  temp = root.left
  root.left = root.right
  root.right = temp
  invert_tree(root.right) if !root.right.right.nil?
  invert_tree(root.left) if !root.left.left.nil?
  return;
end
