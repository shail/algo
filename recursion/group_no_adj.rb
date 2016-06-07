def group_no_adj(start, nums, target)
  return target == 0 if start >= nums.length
  return group_no_adj(start + 2, nums, target - nums[start]) ||
         group_no_adj(start + 1, nums, target - nums[start])
end

p group_no_adj(0, [2,5,10,4], 12)
p group_no_adj(0, [2,5,10,4], 14)
p group_no_adj(0, [2,5,10,4], 7)
