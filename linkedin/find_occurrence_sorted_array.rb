def find_occurences(array, target)
  first = first_occurence(array, 0, array.length - 1, target)
  return first if !first

  last = last_occurence(array, first, array.length - 1, target)
  return last - first + 1
end

def first_occurence(array, low, high, target)
  if high >= low
    mid = (low + high) / 2
    p array[mid]
    p mid
    if (mid == 0 || target > array[mid-1]) && array[mid] == target
      return mid
    elsif target > array[mid]
      return first_occurence(array, mid+1, high, target)
    else
      return first_occurence(array, low, mid - 1, target)
    end
  end
  return false
end

def last_occurence(array, low, high, target)
  if high >= low
    mid = (low + high) / 2
    if (mid == array.length - 1 || target < array[mid+1]) && array[mid] == target
      return mid
    elsif target < array[mid]
      return last_occurence(array, low, mid-1, target)
    else
      return last_occurence(array, mid+1, high, target)
    end
  end
  return false
end

p find_occurences([1,2,2,3,3,3,3], 3)
#p find_occurences([1,2,2,3,3,3,3], 2)
#p find_occurences([1,2,2,3,3,3,3], 1)
#p find_occurences([1,2,2,3,3,3,3], 4)
#p find_occurences([], 1)
