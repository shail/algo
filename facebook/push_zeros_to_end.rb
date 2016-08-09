def push_zeros_to_end(array)
  i, j = 0,0
  while j < array.length do
    if array[j] != 0
      if i < j
        temp = array[i]
        array[i] = array[j]
        array[j] = temp
      end
      i += 1
    end
    j += 1
  end
  array
end

p push_zeros_to_end([1,2,0,0,0,3,4,0,5,0])
