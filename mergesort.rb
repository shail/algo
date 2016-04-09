def mergesort(array, low, high)
  if low < high
    middle = (low + high)/2
    mergesort(array, low, middle)
    mergesort(array, middle+1, high)
    new_array = merge(array, low, middle, high)
  end
  puts new_array.inspect
end

def merge(array, low, middle, high)
  buffer1 = array[low..middle]
  buffer2 = array[middle+1..high]
  i = low
  while !(buffer1.empty? || buffer2.empty?) do
    if buffer1.first <= buffer2.first
      array[i] = buffer1.shift
      i += 1
    else
      array[i] = buffer2.shift
      i += 1
    end
  end

  while (!buffer1.empty?) do
    array[i] = buffer1.shift
    i+= 1
  end

  while (!buffer2.empty?) do
    array[i] = buffer2.shift
    i+= 1
  end
  array
end

mergesort([1,3,7,2,9,11,4,6],0,7)
