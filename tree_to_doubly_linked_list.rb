def tree_to_linked_list(root, prev, head)
  return unless root
  tree_to_linked_list(root.left, prev, head)
  root.left = prev[0]
  if !prev[0].nil?
    prev[0].right = root
  else
    head[0] = root
  end
  right = root.right
  head[0].left = root
  root.right = head[0]
  prev[0] = root
  tree_to_linked_list(right, prev, head)
end


class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = left
    @right = right
  end
end

def test
  root = Tree.new(4)
  root.left = Tree.new(2)
  root.right = Tree.new(5)
  root.left.left = Tree.new(1)
  root.left.right = Tree.new(3)
  head = [nil]
  prev = [nil]
  start = root
  tree_to_linked_list(start, prev, head)
  expected_forward = [1,2,3,4,5]
  expected_backward = [1,5,4,3,2]

  temp = head[0]
  count = 0
  while (temp && count < expected_forward.length) do
    puts temp.val == expected_forward[count]
    temp = temp.right
    count += 1
  end

  temp = head[0]
  count = 0
  while (temp && count < expected_backward.length) do
    puts temp.val == expected_backward[count]
    temp = temp.left
    count += 1
  end
end

test
