def group_sum(start, numbers, target)
  return target == 0 if start >= numbers.length
  return group_sum(start + 1, numbers, target - numbers[start]) ||
         group_sum(start + 1, numbers, target)
end

p group_sum(0, [2,4,8], 10) == true
p group_sum(0, [2,4,8], 14) == true
p group_sum(0, [2,4,8], 9) == false
p group_sum(0, [1,2,3,4,5], 6) == true
