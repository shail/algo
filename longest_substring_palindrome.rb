def longest_palindrome_substring(strText)
  n = strText.length
  table = Array.new(n) { Array.new(n) { false } }

  max_length = 1
  (0...n).to_a.each do |i|
    table[i][i] = true
  end

  start = 0
  (0...n-1).to_a.each do |i|
    if strText[i].downcase == strText[i+1].downcase
      table[i][i+1] = true
      start = i
      max_length = 2
    end
  end

  (3..n).to_a.each do |k|
    (0...n-k+1).to_a.each do |i|
      j = i + k - 1
      if table[i+1][j-1] && strText[i].downcase == strText[j].downcase
        table[i][j] = true
        if k > max_length
          start = i
          max_length = k
        end
      end
    end
  end
  puts strText[start..start+max_length-1]
end

longest_palindrome_substring("forgeeksskeegfor")
longest_palindrome_substring("AbleWasIEreISawElba")
