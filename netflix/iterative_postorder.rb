class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def post_order(root)
  return unless root
  stack = []

  loop do
    while root do
      stack << root.right if root.right
      stack << root
      root = root.left
    end

    root = stack.pop
    if root.right && stack.last == root.right
      stack.pop
      stack << root
      root = root.right
    else
      print "#{root.val} "
      root = nil
    end
    break if stack.empty?
  end
end

def recursive_post_order(root)
  return if root.nil?
  recursive_post_order(root.left)
  recursive_post_order(root.right)
  print "#{root.val} "
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)

post_order(root)
puts
recursive_post_order(root)

