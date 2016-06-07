def split_array(start, numbers, sum1, sum2)
  return sum1 == sum2 if start >= numbers.length
  return split_array(start + 1, numbers, sum1 + numbers[start], sum2) ||
         split_array(start + 1, numbers, sum1, sum2 + numbers[start])
end

p split_array(0, [2,2],0,0)
p split_array(0, [2,3],0,0)
