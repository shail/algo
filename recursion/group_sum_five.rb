def group_sum_five(start, numbers, target)
  return target == 0 if start >= numbers.length
  if numbers[start] % 5 == 0
    if start < numbers.length - 1 && numbers[start + 1] == 1
      return group_sum_five(start + 2, numbers, target - numbers[start])
    else
      return group_sum_five(start + 1, numbers, target - numbers[start])
    end
  end
  return group_sum_five(start + 1, numbers, target - numbers[start]) || group_sum_five(start + 1, numbers, target)
end

p group_sum_five(0, [2,5,10,4], 12) == false
p group_sum_five(0, [2,5,10,4], 17) == true
