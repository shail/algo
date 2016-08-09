def numberOfPaths(a)
  m = a.length
  n = a.first.length
  paths = Array.new(m) { Array.new(n) }
  (0..m-1).to_a.each do |i|
    (0..n-1).to_a.each do |j|
      if (i == 0 && j == 0)
        paths[i][j] = 1
        next
      end
      if (a[i][j] == 0)
        paths[i][j] = 0
      else
        paths[i][j] = ((i - 1 >= 0 ? paths[i-1][j] : 0) + (j - 1 >= 0 ? paths[i][j-1] : 0)) % (10**9 + 7)
      end
    end
  end
  return paths[m-1][n-1] % (10**9 + 7)
end

puts numberOfPaths([[1,1,1,1],[1,1,1,1],[1,1,1,1]])
puts numberOfPaths([[1,1],[0,1]])
