def min_window(strText, strCharacters)
  return "" if strCharacters.length > strText.length
  result = ""
  hash = Hash.new(0)
  # character count for t
  (0...strCharacters.length).to_a.each do |i|
    char = strCharacters[i]
    hash[char] += 1
  end

  # character counter for s
  map = Hash.new(0)
  left = 0
  min_len = strText.length + 1
  count = 0

  # Skip characters that aren't it T
  (0...strText.length).to_a.each do |i|
    char = strText[i]
    if hash.key?(char)
      if map.key?(char)
        if map[char] < hash[char]
          count += 1
        end
      else
        count += 1
      end
      map[char] += 1
    end

    # Once you've reached the correct number of characters, see how far you can move the first point forward
    # (left)
    if count == strCharacters.length
      next_char = strText[left]
      while !map.key?(next_char) || (map[next_char] > hash[next_char]) do
        if map.key?(next_char) && map[next_char] > hash[next_char]
          map[next_char] -= 1
        end
        left += 1
        next_char = strText[left]
      end
      if i - left + 1 < min_len
        result = strText[left..i+1]
        min_len = i - left + 1
      end
    end
  end
  return result
end
puts min_window("ADOBECODEBANC", "ABC")
puts min_window("ACCCCCCCCCCCCB", "ABC")
