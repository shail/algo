def copy_left_side(root)
  if root.nil?
    return
  else
    copy_left_side(root.left) if !root.left.nil?
    copy_right_side(root.right) if !root.right.nil?
    root.left = temp
    root.left = root
    root.left.left = temp
  end
  root
end
