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
