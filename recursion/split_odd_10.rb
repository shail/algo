def split_odd_10(start, nums, sum1, sum2)
  return sum1 % 10 == 0 && sum2 % 2 == 1 || sum1 % 2 == 1 && sum2 % 10 == 0 if start >= nums.length
  return split_odd_10(start + 1, nums, sum1 + nums[start], sum2) || split_odd_10(start + 1, nums, sum1, sum2 + nums[start])
end

p split_odd_10(0, [5,5,6],0, 0)
p split_odd_10(0, [5,5,1,6], 0, 0)
p split_odd_10(0, [10,1,6],0, 0)
