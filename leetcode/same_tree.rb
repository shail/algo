class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
     @val = val
     @left, @right = nil, nil
  end
end

def is_same_tree(p, q)
  if p.nil? && q.nil?
    return true
  elsif p && q
    return (p.val == q.val) && is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
  else
    return false
  end
end

a = TreeNode.new(1)
b = TreeNode.new(3)
c = TreeNode.new(4)
a.left, a.right = b, c
d = TreeNode.new(2)
e = TreeNode.new(5)
b.left, b.right = d, e

f = TreeNode.new(1)
g = TreeNode.new(3)
h = TreeNode.new(4)
f.left, f.right = g, h
i = TreeNode.new(2)
j = TreeNode.new(5)
g.left, g.right = i, j

puts is_same_tree(a, f)
