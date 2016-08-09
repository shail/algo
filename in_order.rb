def in_order_traversal(root)
  if root.nil?
    return
  else
    in_order_traversal(root.left)
    puts root.data
    in_order_traversal(root.right)
  end
end
