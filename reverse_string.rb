def reverse_string(string)
  return "" if string.length == 0
  last = string[-1]
  reversed = reverse_string(string[0...string.length-1])
  return last + reversed
end

puts reverse_string("bat")
