def palindrome(string)
  start = 0
  finish = string.length - 1
  while start < finish do
    if string[start] != string[finish]
      return false
    end
    start += 1
    finish -= 1
  end
  return true
end

p palindrome("blah")
p palindrome("aba")

