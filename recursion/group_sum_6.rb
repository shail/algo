def group_sum_6(start, numbers, target)
  return target == 0 if start >= numbers.length
  if numbers[start] == 6
    return group_sum_6(start + 1, numbers, target - numbers[start])
  end
  return group_sum_6(start + 1, numbers, target - numbers[start]) ||
         group_sum_6(start + 1, numbers, target)
end

p group_sum_6(0, [5,6,2], 8) == true
p group_sum_6(0, [5,6,2], 9) == false
p group_sum_6(0, [5,6,2], 7) == false
