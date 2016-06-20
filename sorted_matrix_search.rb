def bin_part(matrix, m, n, target, l, u, r, d, starting_row, starting_col)
  return false if l > r || u > d
  return false if target < matrix[u][l] || target > matrix[d][r]
  mid = l + (r-l)/2
  row = u
  while row <= d && matrix[row][mid] <= target do
    if matrix[row][mid] == target
      starting_row = row
      starting_col = mid
      return true
    end
    row += 1
  end

  return bin_part(matrix, m, n, target, mid+1, u, r, row-1, starting_row, starting_col) ||
         uin_part(matrix, m, n, target, l, row, mid-1, d, starting_row, starting_col)
end

matrix = [[10,20,30,40,50], [15,25,35,45,55], [27,29,37,48,58], [32,33,39,50,60]]
n = matrix.length
m = matrix.first.length
puts bin_part(matrix, m, n, 48, 0, 0, m-1, n-1,0,0)
puts bin_part(matrix, m, n, 488, 0, 0, m-1, n-1,0,0)

