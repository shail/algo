class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def print_all_paths(root, path)
  if root.nil?
    return
  else
    path << root.val
    if root.left.nil? && root.right.nil?
      puts path.inspect
      path.pop
    else
      print_all_paths(root.left, path)
      print_all_paths(root.right, path)
      path.pop
    end
  end
end

root = Tree.new(1)
root.left = Tree.new(2)
root.right = Tree.new(3)
root.left.left = Tree.new(4)
root.left.right = Tree.new(5)

print_all_paths(root, [])
