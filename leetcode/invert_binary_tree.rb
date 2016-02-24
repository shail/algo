class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def invert_tree(root)
    if !root.nil?
        if root.right.nil? && !root.left.nil?
            root.right = root.left
            root.left = nil
            invert_tree(root.right)
        elsif !root.right.nil? && root.left.nil?
            root.left = root.right
            root.right = nil
            invert_tree(root.left)
        elsif !root.right.nil? && !root.left.nil?
            temp = root.left
            root.left = root.right
            root.right = temp
            puts root.right.inspect
            invert_tree(root.right) if !root.right.right.nil? || !root.right.left.nil?
            invert_tree(root.left) if !root.left.right.nil? || !root.left.left.nil?
        else
            temp = root.left
            root.left = root.right
            root.right = temp
        end
    end
    root
end
