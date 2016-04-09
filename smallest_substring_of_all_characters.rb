def smallest_substring(arr, str)
  t = 0
  result = []
  unique_counter = 0
  hash = {}
  # initialize the count map
  arr.each do |char|
    hash[char] = 0
  end
  # scan the string
  str.split("").each_with_index do |char, index|
    next if hash[char].nil?
    head_count = hash[char]
    # increment the unique_counter which basically checks if you have seen all the characters in the array
    unique_counter += 1 if head_count == 0
    hash[char] += 1
    # push tail forward once you've reached a valid substring
    while unique_counter == arr.length do
      # length of the current substring
      temp_length = index - t + 1
      # if the substring is the exact length of the arr variable then you can return in immediately
      if temp_length == arr.length
        result = str[t, index]
      end
      # if the current substring is less than the result string then replace current substring
      if (result.nil? || temp_length < result.length)
        result = str[t,index]
      end
      tail = str[t]
      # this basically allows us to push the tail forward and make the correct adjustments for that, maintains
      # the constraint of when the unique_counter equals the variable arr's size
      if !hash[tail].nil?
        tail_count = hash[tail] - 1
        unique_counter -= 1 if tail_count == 0 # this basically says when you move the tail forward the constraint will be broken and you will need to increment the head forward
        hash[tail] = tail_count # updated becuase you are moving the tail forward
      end
      t += 1
    end
  end
  return result.inspect
end

puts smallest_substring(["x","y","z"], 'xyyzyzyx')

# http://articles.leetcode.com/finding-minimum-window-in-s-which
