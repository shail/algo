def maxWin(intCoins)
  raise "Must have even number of coins for this game" if intCoins.length % 2 != 0
  length = intCoins.length
  solution_matrix = Array.new(length) { Array.new(length, 0) }
  (0..length-1).to_a.each do |gap|
    i = 0
    (gap..length-1).to_a.each do |j|
      x = ((i+2) <= j) ? solution_matrix[i+2][j] : 0
      y = ((i+1) <= (j-1)) ? solution_matrix[i+1][j-1]: 0
      z = (i <= (j-2)) ? solution_matrix[i][j-2] : 0
      solution_matrix[i][j] = [intCoins[i] + [x,y].min, intCoins[j] + [y,z].min].max
      i += 1
    end
  end
  return solution_matrix[0][length-1]
end


puts maxWin([8,15,3,7])
puts maxWin([5,3,7,10])
