def possible_trees(n)
  return 1 if n < 1
  sum, left, right = 0,0,0
  (1..n).to_a.each do |i|
    left = possible_trees(i-1)
    right = possible_trees(n-i)
    sum += right * left
  end
  sum
end

p possible_trees(4)
