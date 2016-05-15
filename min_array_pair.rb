def min_diff_pair(array)
  result = []
  array.sort!
  array[0..(array.length/2-1)].each_with_index do |value,index|
    result << [value, array[array.length - (index + 1)]]
  end
  puts result.inspect
end

min_diff_pair([1,5,7,2,3,4,6,8])
