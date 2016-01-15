def string_permutation(first_string, second_string)
  first_hash = Hash.new(0)
  return_value = true
  first_string.split("").each do |char|
    first_hash[char] += 1
  end
  second_hash = Hash.new(0)
  second_string.split("").each do |char|
    second_hash[char] += 1
  end

  second_hash.keys.each do |key|
    return_value = false if !first_hash[key] <= second_hash[key]
  end
  puts return_value
end

string_permutation("blah", "tree")
string_permutation("treeeeeeee", "ree")


