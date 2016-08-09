def three_sum(array, sum)
  array.sort!

  # fix the first element one by one and find the other two elements
  (0...array.length - 2).to_a.each do |i|
    # to find the other two elements, start two index variables from two
    # corners of the array and move them toward each other
    left = i + 1
    right = array.length - 1
    while left < right do
      if array[i] + array[left] + array[right] == sum
        puts "Answer: #{array[i]}, #{array[left]}, #{array[right]}"
        return true
      elsif array[i] + array[left] + array[right] < sum
        left += 1
      else
        right -= 1
      end
    end
  end
  return false
end

three_sum([-2,-1,3,4], 5)
