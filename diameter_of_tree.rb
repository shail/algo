class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @children = nil
    @right = nil
  end
end

def diameter(root)
  height_and_diameter = [0,0]

  if !root.nil?
    left = diameter(root.left)
    right = diameter(root.right)

    height = [left[0], right[0]].max + 1
    left_diameter = left[1]
    right_diameter = right[1]
    root_diameter = left.first + right.first + 1
    final_diameter = [left_diameter, right_diameter, root_diameter].max
    height_and_diameter[0] = height
    height_and_diameter[1] = final_diameter
  end
  height_and_diameter
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.left.right.left = Node.new(6)
root.left.right.left.right = Node.new(7)
root.left.left.left = Node.new(8)

puts diameter(root)
