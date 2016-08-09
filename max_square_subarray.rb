def print_max_subarray(mtx)
  lookup_matrix = Array.new(mtx.length) { Array.new(mtx.first.length) }
  (0..mtx.length-1).to_a.each do |i|
    lookup_matrix[i][0] = mtx[i][0]
  end

  (0..mtx.first.length-1).to_a.each do |j|
    lookup_matrix[0][j] = mtx[0][j]
  end

  (1..mtx.length-1).to_a.each do |i|
    (1..mtx.first.length-1).to_a.each do |j|
      if mtx[i][j] == 1
        lookup_matrix[i][j] = [lookup_matrix[i][j-1], lookup_matrix[i-1][j], lookup_matrix[i-1][j-1]].min + 1
      else
        lookup_matrix[i][j] = 0
      end
    end
  end

  max_of_lookup = lookup_matrix[0][0]
  max_i, max_j = 0,0
  (0..mtx.length-1).to_a.each do |i|
    (0..mtx.first.length-1).to_a.each do |j|
      if max_of_lookup < lookup_matrix[i][j]
        max_of_lookup, max_i, max_j = lookup_matrix[i][j], i, j
      end
    end
  end

  max_i.downto(max_i-max_of_lookup+1) do |i|
    max_j.downto(max_j-max_of_lookup+1) do |j|
      print "#{mtx[i][j]} "
    end
    puts
  end
end

array = [[0,1,1,0,1],
         [1,1,0,1,0],
         [0,1,1,1,0],
         [1,1,1,1,0],
         [1,1,1,1,1],
         [0,0,0,0,0]]
print_max_subarray(array)
