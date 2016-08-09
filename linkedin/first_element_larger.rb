def binary_search(sorted_array, element)
  low = 0
  high = sorted_array.length

  while low != high do
    mid = (low + high) / 2
    if element >= sorted_array[mid]
      low = mid + 1
    else
      high = mid
    end
  end
  return low
end

p binary_search([1,2,2,2,2,2,3,4,5], 2)
