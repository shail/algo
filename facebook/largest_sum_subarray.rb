def largest_sum_subarray(array)
  max_so_far = array[0]
  current_max = array[0]

  (1...array.length).to_a.each do |i|
    current_max = [array[i], current_max + array[i]].max
    max_so_far = [max_so_far, current_max].max
  end

  return max_so_far
end

# look for all positive contiguous segments (max_ending_here) and keep track of the maximum found with
# max_so_far
