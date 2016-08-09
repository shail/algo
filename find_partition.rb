def find_partition(array)
  sum = 0
  n = array.length
  (0..n-1).to_a.each do |i|
    sum += array[i]
  end

  return false if sum % 2 != 0

  lookup_matrix = Array.new(sum/2+1) { Array.new }

  (0..n).to_a.each do |i|
    lookup_matrix[0][i] = true
  end

  (1..sum/2).to_a.each do |i|
    lookup_matrix[i][0] = false
  end

  (1..sum/2).to_a.each do |i|
    (1..n).to_a.each do |j|
      lookup_matrix[i][j] = lookup_matrix[i][j-1]
      if i >= array[j-1]
        lookup_matrix[i][j] = lookup_matrix[i][j] || lookup_matrix[i - array[j-1]][j-1]
      end
    end

  end

  puts lookup_matrix[sum/2][n]
end

find_partition([1,3,11,5])
