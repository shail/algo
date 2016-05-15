class Tree
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def spine(root, prev, head)
  return unless root
  spine(root.left, prev, head)
  if prev[0].val
    prev[0].right = root
  else
    head[0] = root
  end
  prev[0] = root
  prev[0].left = nil
  spine(root.right, prev, head)
end

def advance(last, node)
  last.right = node
  last = node
  node = node.right
  [last, node]
end

def merge_spines(head1, head2)
  head = Tree.new(nil)
  last = head
  while head1 || head2 do
    if !head1
      result = advance(last, head2)
      last, head2 = result[0], result[1]
    elsif !head2
      result = advance(last, head1)
      last, head1 = result[0], result[1]
    elsif head1.val < head2.val
      result = advance(last, head1)
      last, head1 = result[0], result[1]
    elsif head1.val > head2.val
      result = advance(last, head2)
      last, head2 = result[0], result[1]
    else
      result = advance(last, head1)
      last, head1 = result[0], result[1]
      puts "Duplicate key skipped #{head2.val}"
      head2 = head2.right
    end
  end
  head.right
end

def balance_nodes(list, n)
  return nil if n <= 0
  left = balance_nodes(list, n/2)
  parent = list[0]
  parent.left = left
  list[0] = list[0].right
  parent.right = balance_nodes(list, n-n/2-1)
  return parent
end

def size_and_balance(head)
  size = 0
  temp = head
  while temp do
    temp = temp.right
    size += 1
  end
  balance_nodes([head], size)
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

def merge(tree1, tree2)
  prev = [Tree.new(nil)]
  head1 = [Tree.new(nil)]
  spine(tree1, prev, head1)
  prev = [Tree.new(nil)]
  head2 = [Tree.new(nil)]
  spine(tree2, prev, head2)
  parent = size_and_balance(merge_spines(head1.first, head2.first))
  print_val(parent)
end

first = Tree.new(2)
first.left = Tree.new(1)
first.right = Tree.new(3)

second = Tree.new(7)
second.left = Tree.new(6)
second.right = Tree.new(8)

merge(first, second)
