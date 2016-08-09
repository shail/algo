class BSTIterator
  def initialize(root)
    @stack = []
    while root do
      stack << root
      root = root.left
    end
  end

  def has_next()
    return !stack.empty?
  end

  def next
    node = stack.pop
    result = node.val
    if node.right
      node = node.right
      while node do
        stack << node
        node = node.left
      end
    end
    return result
  end
end
