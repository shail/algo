def print_words(number, curr_digit, output)
  digit_letter_map = [ "", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz" ]
  n = number.length

  # Base case if output word is prepared
  if curr_digit == n
    p output
    return
  end

  # Try all 3 possible characters for current digit in number and recur for remaining digits
  (0...digit_letter_map[number[curr_digit]].length).to_a.each do |i|
    output[curr_digit] = digit_letter_map[number[curr_digit]][i]
    print_words(number, curr_digit + 1, output)
    return if number[curr_digit] == 0 || number[curr_digit] == 1
  end
end

print_words([2,3,4], 0, [])

# Time complexity of 4^n
