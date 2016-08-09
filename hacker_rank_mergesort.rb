def MergeSort(intArr)
  merge_sort(intArr, 0, intArr.length-1)
end

def merge_sort(array, left, right)
  if left < right
    center = (left + right)/2
    merge_sort(array, left, center)
    merge_sort(array, center+1, right)
    new_array = merge(array, left, center, right)
  end
end

def merge(array, left, middle, high)
  puts "Left: #{left}"
  puts "middle: #{middle}"
  puts "high: #{high}"
  left_array = array[left..middle]
  right_array = array[middle+1..high]
  result_array = []
  while !(left_array.empty? || right_array.empty?) do
    if left_array.first <= right_array.first
      result_array << left_array.shift
    else
      result_array << right_array.shift
    end
  end
  puts "Left_array: #{left_array}"
  puts "Right_array: #{right_array}"
  puts "Array: #{array}"
  puts "Result_array: #{result_array}"


  while (!left_array.empty?) do
    result_array << left_array.shift
  end

  while (!right_array.empty?) do
    result_array << right_array.shift
  end
  result_array
end

puts MergeSort([5,0,-1,-2,5,4])
