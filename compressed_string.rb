def compress(string)
  count = 0
  letter = string[0]
  new_string = ""
  string.split("").each_with_index do |char, index|
    if char != letter
      new_string << (letter + count.to_s)
      letter = char
      count = 1
    else
      count += 1
    end
    if index == string.length - 1
      new_string << (letter + count.to_s)
    end
  end
  puts new_string.length > string.length ? string.inspect : new_string.inspect
end

puts compress("abcd")
