def split53(start, numbers, sum1, sum2)
  return sum1 == sum2 if start >= numbers.length
  if numbers[start] % 5 == 0
    return split53(start, numbers, sum1 + numbers[start], sum2)
  end
  if numbers[start] % 3 == 0
    return split53(start + 1, numbers, sum1, sum2 + numbers[start])
  end

  return split53(start + 1, numbers, sum1 + numbers[start], sum2) || split53(start + 1, numbers, sum1, sum2 + numbers[start])
end

# Given an array of ints, is it possible to divide the ints into two groups, so that the sum of the two groups is the same, with these constraints: all the values that are multiple of 5 must be in one group, and all the values that are a multiple of 3 (and not a multiple of 5) must be in the other. (No loops needed.)

p split53(0, [1,1], 0 ,0)
