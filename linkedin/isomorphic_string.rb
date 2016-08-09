def isomorphic_string(string1, string2)
  m = string1.length
  n = string2.length
  return false if m != n
  # mark visited characters in string 2
  visited_array = Array.new(256) { false }
  # store mapping from string1 to string 2
  map = Hash.new(-1)

  (0...n).to_a.each do |i|
    # if current char of str1 seen first time
    if map[string1[i]] == -1
      # if current char of str2 is already seen, one to one mapping isn't possible
      if visited_array[string2[i].ord] == true
        return false
      end

      # mark current char of string2 as visited
      visited_array[string2[i].ord] = true

      # store mapping of current characters
      map[string1[i]] = string2[i]
    elsif map[string1[i]] != string2[i]
      return false
    end
  end
  return true
end

p isomorphic_string('aab', 'xxy')
p isomorphic_string('aab', 'xgy')
# Idea is to create array to store mappings of processed characters
