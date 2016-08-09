def quicksort(array, low, high)
  if low < high
    p = partition(array, low, high)
    quicksort(array, low, p-1)
    quicksort(array, p+1, high)
  end
end

def partition(array, low, high)
  actual_pivot = low
  array[low..high].each_with_index do |element, index|
    # if the current element is less than the pivot, swap the value with the current index position of where
    # the pivot should be and increment that by 1
    if element < array[high]
      temp = array[actual_pivot]
      array[actual_pivot] = element
      array[low + index] = temp
      actual_pivot += 1
    end
  end
  # swap the pivot with the index position that we ended at
  p "Starting_pivot: #{high}"
  p "Actual_pivot spot #{actual_pivot}"
  temp = array[high]
  array[high] = array[actual_pivot]
  array[actual_pivot] = temp

  puts array.inspect
  return actual_pivot
end

puts quicksort([1,3,4,2,9,6],0,5)

# Quicksort
# Make sure the array is greater than size 1
#
# Partition method
# Go through the subarray and find the index position of where the pivot should go that to the left are the
# elements that are smaller and to the right are the elements that are larger
#
# Then swap the pivot with where that index position is supposed to be, return the index position
# Call quicksort on the resulting arrays
