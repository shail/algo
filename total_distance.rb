def total_distance(intervals)
  distance = 0
  max_value = nil
  intervals.each do |array|
    if max_value.nil?
      distance += array[1] - array[0]
      max_value = array[1]
    elsif array[0] < max_value && array[1] < max_value
      next
    elsif array[0] < max_value && array[1] > max_value
      distance += array[1] - max_value
      max_value = array[1]
    elsif array[0] > max_value
      distance += array[1] - array[0]
      max_value = array[1]
    end
  end
  distance
end

p total_distance([[1,5], [2,3], [4,8]]) == 7
p total_distance([[1,2], [3,4], [5,6]]) == 3
