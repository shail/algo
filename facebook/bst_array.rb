def in_order_array(node, array, index)
  return if node.nil?
  in_order_array(node.left, array, index)
  array[index] = node.val
  index += 1
  in_order_array(node.right, array, index)
  array
end

in_ord
