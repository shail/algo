# Naive solution is to go through and check all the possibilities, obviously this has an exponential run time
# Longest palindrome sequence(0,5) is the sum of LPS(1,5) and LPS(0,4) which breaks down further and further.
# So you can see a lot of repatition
#

def lps(string)
  n = string.length
  dp_array = Array.new(n) { Array.new(n) { 0 } }

  # Strings of length 1 are palindrome of length 1
  (0...n).to_a.each do |i|
    dp_array[i][i] = 1
  end

  # Lower diagonal values of table are useless because the starting can't be greater than the ending, cl is
  # length of the substring

  (2..n).to_a.each do |len|
    (0...(n-len+1)).to_a.each do |i|
      j = i + len - 1
      if string[i] == string[j] && len == 2
        dp_array[i][j] = 2
      elsif string[i] == string[j]
        dp_array[i][j] = dp_array[i + 1][j - 1] + 2
      else
        dp_array[i][j] = [dp_array[i][j-1], dp_array[i+1][j]].max
      end
    end
  end
  return dp_array[0][n-1]
end

p lps([1,2,4,5,1])
