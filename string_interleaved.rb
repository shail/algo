def string_interleaved(string_i, string_a, string_b)
  m = string_a.length
  n = string_b.length

  dp_array = Array.new(m+1) { Array.new(n+1) { false } }

  return false if m + n != string_i.length
  (0..m).to_a.each do |i|
    (0..n).to_a.each do |j|
      if i == 0 && j == 0
        dp_array[i][j] = true
      elsif i == 0 && string_b[j-1] == string_i[j-1]
        dp_array[i][j] = dp_array[i][j-1]
      elsif j == 0 && string_a[i-1] == string_i[i-1]
        dp_array[i][j] = dp_array[i-1][j]
      elsif string_a[i-1] == string_i[i+j-1] && string_b[j-1] != string_i[i+j-1]
          dp_array[i][j] = dp_array[i-1][j]
      elsif string_a[i-1] != string_i[i+j-1] && string_b[j-1] == string_i[i+j-1]
          dp_array[i][j] = dp_array[i][j-1]
      elsif string_a[i-1] == string_i[i+j-1] && string_b[j-1] == string_i[i+j-1]
          dp_array[i][j]= (dp_array[i-1][j] || dp_array[i][j-1])
      end
    end
  end

  dp_array[m][n]
end

puts string_interleaved("1234", "123", "123") == false
puts string_interleaved("112233", "123", "123") == true
puts string_interleaved("123456", "123456", "") == true
puts string_interleaved("123456", "", "123456") == true
puts string_interleaved("12345678", "1233", "5678") == false

