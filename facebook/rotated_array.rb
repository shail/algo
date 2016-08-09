def rotated_number(array, low, high, element)
  return false if low > high
  mid = (low + high) / 2
  return mid if array[mid] == element

  # if array[low..mid] is sorted
  if array[low] < array[mid]
    if element > array[low] && element < array[mid]
      return rotated_number(array, low, mid - 1, element)
    end
    return rotated_number(array, mid + 1, high, element)
  end

  if element > array[mid] && element < array[high]
    return rotated_number(array, mid + 1, high, element)
  end

  return rotated_number(array, low, mid - 1, element)
end

p rotated_number([4,5,6,7,8,9,1,2,3],0,9, 6)
# Find mid point
# If key is present return
# Else if array[low..mid] is sorted
# => If key to be searched lies in range from array[l] to array[mid], recur for array[l..mid]
# => Else recur for array[mid+1..end]
# Els array[mid+1..high] must be sorted
# => If key to be searched lies in range from array[mid+1] to array[high], recur for array[mid+1..r]
# => Else recur for array[l..mid]
