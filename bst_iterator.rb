class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BSTIterator
  attr_accessor :has_next, :next
  def initialize(root)
    @stack = []
    push_all(root)
  end

  def has_next()
    !@stack.empty?
  end

  def next()
    tmp = @stack.pop
    push_all(tmp.right)
    return tmp.val
  end

  private

  def push_all(node)
    while node do
      @stack << node
      node = node.left
    end
  end
end

root = TreeNode.new(6)
root.left = TreeNode.new(4)
root.right = TreeNode.new(10)
root.left.left = TreeNode.new(3)
root.left.right = TreeNode.new(5)
root.right.left = TreeNode.new(9)
root.right.right = TreeNode.new(11)

iterator = BSTIterator.new(root)
result = []
7.times do
  result << iterator.next
end
puts result == [3,4,5,6,9,10,11]
puts iterator.has_next == false
