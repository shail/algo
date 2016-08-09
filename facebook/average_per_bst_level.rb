class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def avg_level(root)
  result = Hash.new(0)
  queue = []

  queue << [root,1] if !root.nil?
  count = 0
  current_depth = 1
  while !queue.compact.empty? do
    if queue.first.nil?
      result[current_depth] /= count
      count = 0
      queue.shift
    else
      if current_depth != queue.first[1]
        queue << nil
        p count
      end
      current_node = queue.first[0]
      current_depth = queue.first[1]
      queue.shift
      result[current_depth] += current_node.val
      if current_node.left
        count += 1
        queue << [current_node.left, current_depth + 1]
      end

      if current_node.right
        count += 1
        queue << [current_node.right, current_depth + 1]
      end
    end
  end
  return result
end

root = Node.new(1)
root.left = Node.new(3)
root.right = Node.new(4)
root.left.left = Node.new(5)
root.left.right = Node.new(5)
root.right.left = Node.new(10)
root.right.right = Node.new(10)

p avg_level(root)
