class Tree
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def bfs(root)
  queue = []
  if root.nil?
    return
  else
    queue << root
    while (!queue.empty?) do
      node = queue.shift
      puts node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end
end

root = Tree.new(1)
second = Tree.new(2)
third = Tree.new(3)
fourth = Tree.new(4)
fifth = Tree.new(5)
sixth = Tree.new(6)
seventh = Tree.new(7)

root.left = second
root.right = third
second.left = fourth
second.right = fifth
third.left = sixth
third.right = seventh

bfs(root)
