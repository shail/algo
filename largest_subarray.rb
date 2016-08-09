def subarray(array)
  global_max = 0
  max_ending_here = 0

  array.each do |element|
    max_ending_here += element
    max_ending_here = 0 if max_ending_here < 0
    global_max = max_ending_here if global_max < max_ending_here
  end
  return global_max
end

puts subarray([-2,-3,4,-1,-2,1,5,-3])

