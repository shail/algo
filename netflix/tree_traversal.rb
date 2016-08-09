def post_order(node)
  return if node.nil?

  post_order(node.left)
  post_order(node.right)
  puts node
end

def in_order(node)
  return if node.nil?

  in_order(node.left)
  puts node
  in_order(node.right)
end

def pre_order(node)
  return if node.nil?

  puts node
  pre_order(node.left)
  pre_order(node.right)
end
