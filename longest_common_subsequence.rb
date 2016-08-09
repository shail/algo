def getLCS(strX, strY)
  lookup_matrix = Array.new(strX.length+1) { Array.new }
  (0..strX.length).to_a.each do |i|
    (0..strY.length).to_a.each do |j|
      if i == 0 || j == 0
        lookup_matrix[i][j] = 0
      elsif strX[i-1] == strY[j-1]
        lookup_matrix[i][j] = lookup_matrix[i-1][j-1] + 1
      else
        lookup_matrix[i][j] = [lookup_matrix[i-1][j], lookup_matrix[i][j-1]].max
      end
    end
  end
  index = lookup_matrix[strX.length][strY.length]
  lcs = " " * (index + 1)
  i, j = strX.length, strY.length
  while i > 0 && j > 0 do
    if strX[i-1] == strY[j-1]
      lcs[index-1] = strX[i-1]
      i -= 1
      j -= 1
      index -= 1
    elsif lookup_matrix[i-1][j] > lookup_matrix[i][j-1]
      i -= 1
    else
      j -= 1
    end
  end
  lcs
end

p getLCS('ABCDGH', 'AEDFHR')

# naive solution is to generate all subsequences of both sequences and find the longest matching subsequence,
# obviously this is exponential in terms of time complexity.
# We can have a lookup table that basically L(X[0..m-1], Y[0..n-1]) be the length of the two sequences X, Y
#
# If last characters of both subequences match then L(X[0..m-1], Y[0..n-1]) = 1 + L(X[0..m-2], Y[0..n-2])
#
# If they don't match
