def make_change(coins, sum)
  m = coins.length
  dp_table = Array.new(sum+1) { Array.new(m) { 0 } }
  (0..m-1).to_a.each { |i| dp_table[0][i] = 1 }
  (1..sum).to_a.each do |i|
    (0..m-1).to_a.each do |j|
      x = i - coins[j] >= 0 ? dp_table[i - coins[j]][j] : 0
      y = j >= 1 ? dp_table[i][j-1] : 0
      dp_table[i][j] = x + y
    end
  end
  puts dp_table.inspect
  return dp_table[sum][m-1]
end

puts make_change([1,2,3], 4)
puts make_change([2,3,5,6], 10)
