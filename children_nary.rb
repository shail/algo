class TreeNode
  attr_accessor :val, :children
  def initialize(val)
    @val = val
    @children = []
  end
end

def get_height(root)
  # Leaf check (base case)
  if root.left.nil? && root.right.nil?
    return 0
  else
    max_depth = 0
    root.children.each do |child|
      max_depth = [max_depth, get_height(child)].max
    end
    return max_depth + 1
  end
end
