def subset_sum(set, n, sum)
  return true if sum == 0
  return false if n == 0 && sum != 0

  if set[n-1] > sum
    return subset_sum(set, n-1, sum)
  else
    return subset_sum(set, n-1, sum) || subset_sum(set, n-1, sum-set[n-1])
  end
end

def groupSum(intArr, iTarget)
  subset_sum(intArr, intArr.length, iTarget)
end

array = [3,34,4,12,5,2]
puts groupSum(array, 9)
puts groupSum(array, 10000000)
