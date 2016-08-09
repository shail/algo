class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def sorted_array_to_bst(array, start, end_value)
  return if start > end_value
  mid = (start + end_value)/2
  root = TreeNode.new(array[mid])
  root.left = sorted_array_to_bst(array, start, mid-1)
  root.right = sorted_array_to_bst(array, mid+1, end_value)
  return root
end

def print_val(root)
  return if root.nil?
  queue = []
  return_string = ""
  nodes_current_level = 1
  nodes_next_level = 0
  queue << root
  while !queue.empty? do
    current_node = queue.shift
    nodes_current_level -= 1
    if current_node
      return_string << current_node.val.to_s + " "
      queue << current_node.left
      queue << current_node.right
      nodes_next_level += 2
    end

    if nodes_current_level == 0 && !queue.empty?
      return_string << "\n"
      nodes_current_level = nodes_next_level
      nodes_next_level = 0
    end
  end
  return_string
end

def createBalancedBST(iArray)
  sorted_array_to_bst(iArray, 0, iArray.length-1)
end

puts print_val(createBalancedBST([8,10,12,15,16,20,25]))
