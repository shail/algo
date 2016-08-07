class Tree
  attr_accessor :left, :right, :val
  def initialize(val)
    @left = nil
    @right = nil
    @val = val
  end
end

def serialize_binary_tree(binary_tree, result)
  if binary_tree.nil?
    result << "#"
    return
  else
    result << binary_tree.val
    serialize_binary_tree(binary_tree.left, result)
    serialize_binary_tree(binary_tree.right, result)
  end
end

def deserialize(array, i)
  if array[i] == "#"
    return
  else
    node = Tree.new(array[i])
    node.left = deserialize(array, i + 1)
    node.right = deserialize(array, i + 2)
    return node
  end
end

root = Tree.new(20)
root.right = Tree.new(8)
root.right.right = Tree.new(10)
root.right.right.right = Tree.new(5)

array = []
serialize_binary_tree(root, array)
tree = deserialize(array, 0)
p tree.val
p tree.right.val
p tree.right.right.val
p tree.right.right.right.val
