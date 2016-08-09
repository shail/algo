INT_MAX = 2 ** 63 - 1
def minMultiplicationCost(mtxSizes)
  n = mtxSizes.length
  dp_array = Array.new(n+1) { Array.new(n+1) { 0 } }
  (1..n-1).to_a.each do |i|
    dp_array[i][i] = 0
  end

  (2..n-1).to_a.each do |l|
    (1..(n-l+1)).to_a.each do |i|
      j = i + l - 1
      dp_array[i][j] = INT_MAX
      (i..(j-1)).to_a.each do |k|
        value = mtxSizes[j].nil? ? INT_MAX : mtxSizes[j]
        q = dp_array[i][k] + dp_array[k+1][j] + mtxSizes[i-1] * mtxSizes[k] * value
        dp_array[i][j] = q if q < dp_array[i][j]
      end
    end
  end
  return dp_array[1][n-1]
end

puts minMultiplicationCost([10,20,30])
