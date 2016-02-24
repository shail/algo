def binary_search(array, lower, upper, target)
  index = nil
  range = upper - lower
  center = (range/2) + lower
  if (target == array[center])
    index = center;
  elsif (target < array[center])
    index = binary_search(array, lower, center - 1, target)
  else
    index = binary_search(array, center + 1, upper, target)
  end
  index
end

puts binary_search([1,2,3,4,5,6,7], 0, 6, 6)
