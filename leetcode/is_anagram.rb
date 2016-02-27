def is_anagram(s, t)
  result = true
  string_letter_frequency = Hash.new(0)
  s.split("").each do |char|
      string_letter_frequency[char] += 1
  end

  t.split("").each do |char|
      string_letter_frequency[char] -= 1
      result = false if string_letter_frequency[char] < 0
  end

  result = false if t.length != s.length
  result
end
