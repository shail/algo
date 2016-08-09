def minimum_size_subarray(nums, target)
  return false if nums.empty?

  result = [0,nums.length-1]

  start = 0
  sum = 0
  i = 0
  exists = false

  while i <= nums.length do
    if sum >= target
      exists = true
      return [start, i-1] if start == i - 1 # if you find the value
      result = [start, i-1] if result[1] - result[0] > i - start
      sum = sum - nums[start]
      start += 1
    else
      break if i == nums.length
      sum += nums[i]
      i += 1
    end
  end

  if exists
    return result
  end
end

p minimum_size_subarray([2,3,1,2,4,3], 7)
p minimum_size_subarray([1,2,3,9,9,3], 6)
