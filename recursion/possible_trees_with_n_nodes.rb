def countTrees(iNodeCount)
  possible_trees(n)
end

def possible_trees(n)
  if n < 1
    1
  else
    sum, left, right = 0, 0, 0
    (1..n).to_a.each do |i|
      left = possible_trees(i-1)
      right = possible_trees(n-i)
      sum += (left * right)
    end
    sum
  end
end

# Table with n columns and n+1 rows, n+1 row is to store the sum of each column
# - number of elements as the column, 6th column, assume we have 6 elements to create BST
# - a given cell C(4,6) contains the count of trees which can be made by 6 unique elements given the 4th
# element is chosen as the root. We know that for one element the number of trees possible is 1. So we can
# populate all the cells in the first column with 0 and all cells in the first row with 1. We populate through
# the column, not through the row
def dp_possible_trees(n)
  array = Array.new(n+2) { Array.new(n+1) { 0 } }
  (0...n+2).to_a.each do |i|
    array[i][0] = 1
  end

  sum = 0
  (1...n+1).to_a.each do |i|
    sum = 0
    (1..i).to_a.each do |j|
      array[j][i] = array[n+1][i-j] * array[n+1][j-1]
      sum += array[j][i]
    end
    array[n+1][i] = sum
  end
  array[n+1].last
end

puts possible_trees(5).inspect
puts dp_possible_trees(5).inspect
