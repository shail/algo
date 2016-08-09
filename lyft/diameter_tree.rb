# Diameter can be left subtree diameter
# Right subtree
# Or through the root

def diameter(root, height)
  # Height of left and right subtrees
  left_height = [0]
  right_height = [0]

  if root.nil?
    height = [0]
    return 0
  end

  # Get heights of left and right subtrees in left_height and right_height and store the return values
  # in left/right diameter
  left_diameter = diameter(root.left, left_height)
  right_diameter = diameter(root.right, right_height)

  # Height of current node is max of heights of left and right subtrees plus one
  height = [[[left_height], [right_height]].max.first + 1]

  # Return max of left, right, or through root
  return [[left_height.first + right_height.first + 1], [left_diameter, right_diameter].max].max
end
