def unique_chars(string)
  array = string.split("")
  hash = {}
  return_val = true
  array.each do |value|
    if hash[value]
      return_val = false
    else
      hash[value] = 1
    end
  end
  puts return_val
end

def unique_no_extra_struct(string)
  sorted_string = string.chars.sort
  return_val = true
  sorted_string.each_with_index do |val, index|
    if sorted_string[index + 1] == val
      return_val = false
    end
  end
  puts return_val
end

unique_chars("blah")
unique_chars("aaaa")
unique_no_extra_struct("blah")
unique_no_extra_struct("aaaa")
