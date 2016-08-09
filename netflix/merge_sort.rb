def mergesort(array)
  return array if array.length <= 1

  # Divide and conquer
  #
  # Divide

  mid = array.length / 2
  left_part = mergesort(array.slice(0, mid))
  right_part = mergesort(array.slice(mid, array.length - mid))

  # Conquer
  array = []
  left, right = 0,0

  while left < left_part.length && right < right_part.length do
    a = left_part[left]
    b = right_part[right]

    if a <= b
      array << a
      left += 1
    else
      array << b
      right += 1
    end
  end

  while left < left_part.count
    array << left_part[left]
    left += 1
  end

  while right < right_part.count
    array << right_part[right]
    right += 1
  end

  return array
end

array = [1,2,3,4,5,6,7,8].shuffle
array = mergesort(array)
p array
