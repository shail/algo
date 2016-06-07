def group_sum_clump(start, numbers, target)
  return target == 0 if start >= numbers.length
  temp = 1
  if numbers[start] == numbers[start+1]
    while numbers[temp] == numbers[start] do
      temp += 1
    end
  end
  return group_sum_clump(start + temp, numbers, target - numbers[start]) ||
         group_sum_clump(start + temp, numbers, target)
end

p group_sum_clump(0, [2,4,8], 10) == true
p group_sum_clump(0, [1,2,4,8,1], 14) == true
p group_sum_clump(0, [2,4,4,8], 14) == false
