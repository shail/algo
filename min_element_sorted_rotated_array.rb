def minimum_elements(array, low, high)
  return array[0] if high < low
  return array[low] if high == low
  mid = low + (high - low) / 2

  return array[mid+1] if mid < high && array[mid+1] < array[mid]
  return array[mid] if mid > low && array[mid] < array[mid - 1]
  return array[high] > array[mid] ? minimum_elements(array, low, mid-1) : minimum_elements(array, mid+1, high)
end

arr1 = [5,6,1,2,3,4]
arr2 = [1]
p minimum_elements(arr1, 0, arr1.length-1)
p minimum_elements(arr2, 0, arr2.length-1)
