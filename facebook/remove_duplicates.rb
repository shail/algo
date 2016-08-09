def remove_duplicates(string)
  string = string.split("").sort.join("")
  duplicate = 1
  i = 0
  while !string[i].nil? do
    if string[i] == string[i + 1]
      string[i...i+1] = ""
    else
      i += 1
    end
  end

  return string
end

p remove_duplicates("geeksforgeeks")

# Use hash if we want linear time
