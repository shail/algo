class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def k_smallest_elements(root, k, count, stack)
  return if root.nil? || count.first >= k
  k_smallest_elements(root.left, k, count, stack)
  count[0] += 1
  stack << root.val
  if count.first == k
    stack.each do |val|
      puts val if val <= root.val
    end
    return
  end
  k_smallest_elements(root.right, k, count, stack)
end

root = TreeNode.new(20)
root.left = TreeNode.new(8)
root.right = TreeNode.new(22)
root.left.left = TreeNode.new(4)
root.left.right = TreeNode.new(12)
root.left.right.left = TreeNode.new(10)
root.left.right.right = TreeNode.new(14)

k_smallest_elements(root, 3, [0], [])
