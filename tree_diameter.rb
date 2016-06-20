class TreeNode
  attr_accessor :distance_from_father, :sons
  def initialize(distance_from_father)
    @distance_from_father = distance_from_father
    @sons = []
  end
end

def diameter(tree)
  return -1 if tree.nil?
  return diameter_recursion(tree)[:diameter]
end

def diameter_recursion(tree)
  result = {}
  if tree.sons.empty?
    result[:distance_to_most_distant_leaf] = tree.distance_from_father
    result[:diameter] = 0
    return result
  end

  result[:diameter] = -1
  total_max_distance, total_2nd_max_distance = 0,0
  tree.sons.each do |son|
    rv = diameter_recursion(son)
    rv[:diameter] = [result[:diameter], rv[:diameter]].max
    if rv[:distance_to_most_distant_leaf] > total_max_distance
      total_2nd_max_distance = total_max_distance
      total_max_distance = rv[:distance_to_most_distant_leaf]
    elsif rv[:distance_to_most_distant_leaf] > total_2nd_max_distance
      total_2nd_max_distance = rv[:distance_to_most_distant_leaf]
    end
  end

  result[:distance_to_most_distant_leaf] = total_max_distance + tree.distance_from_father
  result[:diameter] = [result[:diameter], total_max_distance + total_2nd_max_distance].max

  return result
end

head = TreeNode.new(0)
first = TreeNode.new(3)
second = TreeNode.new(4)
third = TreeNode.new(5)
fourth = TreeNode.new(2)
head.sons = [first, second, third]
first.sons << fourth

puts diameter(head).inspect
