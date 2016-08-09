def max_subarray(array)
  max = 0
  current_max = 0

  array.each do |value|
    current_max += value
    current_max = 0 if current_max < 0
    # can be further optimized by only setting max = current_max if current_max > 0 && > max
    max = current_max if current_max > max
  end
  max
end

def dp_max_subarray(array)
  max = array.first
  current_max = array.first
  (1...array.length).to_a.each do |i|
    current_max = [current_max + array[i], array[i]].max
    max = [max, current_max].max
  end
  max
end

def max_subarray_index(array)
  start_index, end_index = 0, 0
  current_start_index = 0
  max = 0
  current_max = 0

  array.each_with_index do |value, index|
    current_max += value
    if current_max > max
      max = current_max
      end_index = index
      start_index = current_start_index
    end
    if current_max < 0
      current_start_index = index + 1
      current_max = 0
    end
  end
  p start_index
  p end_index
  return max
end

#p max_subarray([-2,-3,4,-1,-2,1,5,-3])
#p dp_max_subarray([-2,-3,-4,-1,-2,-1,-5,-3])
p max_subarray_index([-2,-3,4,-1,-2,1,5,-3])

