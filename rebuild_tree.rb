class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def map_to_index(inorder, n)
  hash = {}
  (0..n-1).to_a.each do |i|
    if inorder[i] >= 0 && inorder[i] <= 255
      hash[inorder[i]] = i
    end
  end
  hash
end

def build_tree(inorder, preorder, n, offset, hash)
  return if n == 0 || n <= 0
  root_val = preorder.first
  i = hash[root_val]-offset
  root = TreeNode.new(root_val)
  root.left = build_tree(inorder, preorder[1..preorder.length-1], i, offset, hash)
  root.right = build_tree(inorder[i+1..inorder.length-1], preorder[1+i..preorder.length-1], n-i-1, offset+i+1, hash)
  return root
end

def print_val(root)
  return if root.nil?
  queue = []
  nodes_current_level = 1
  nodes_next_level = 0
  queue << root
  while !queue.empty? do
    current_node = queue.shift
    nodes_current_level -= 1
    if current_node
      print current_node.val.to_s + " "
      queue << current_node.left
      queue << current_node.right
      nodes_next_level += 2
    end

    if nodes_current_level == 0 && !queue.empty?
      puts
      nodes_current_level = nodes_next_level
      nodes_next_level = 0
    end
  end
end

def constructTree(iInOrderArray, iPreOrderArray)
  hash = map_to_index(iInOrderArray, iInOrderArray.length)
  root = build_tree(iInOrderArray, iPreOrderArray, iInOrderArray.length, 0, hash)
  print_val(root)
end

constructTree([4,10,3,1,7,11,8,2], [7,10,4,3,1,2,8,11]).inspect
