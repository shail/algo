def is_palindrome(string)
  string == string.reverse
end

def is_rotation_palindrome(string)
  return true if is_palindrome(string)

  n = string.length
  (0...n).to_a.each do |i|
    str1 = string[i+1...n]
    str2 = string[0...i+1]

    return true if is_palindrome((str1 + str2))
  end
  return false
end

p is_rotation_palindrome("klklu")
p is_rotation_palindrome("hjijhgi")
