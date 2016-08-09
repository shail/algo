def overlapping_intervals(array)
  array.sort!
  min = array[0][0]
  total_difference = 0
  last_max = 0
  total_max = 0

  (0...array.length).to_a.each do |i|
    if i == 0
      last_max = array[i][1]
    else
      temp_min = array[i][0]
      diff = temp_min - last_max
      # only if range is above the last range, negative means no difference
      if diff > 0
        total_difference += diff
      end
      last_max = array[i][1]
    end
    total_max = array[i][1]
  end
  p total_max
  p min
  p total_difference
  total_max - min - total_difference
end

# Since every range has a min and max value, you can find the distance that wasn't covered by subtracting the
# current min from the last max. If that value is negative you know that no difference was found between the
# two ranges

p overlapping_intervals([[1,2], [3,4], [8,9]])
