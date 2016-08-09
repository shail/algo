def dutch_national_flag(array)
  high = array.length - 1
  low = 0
  mid = 0
  while (mid <= high) do
    if array[mid] == 0
      temp = array[mid]
      array[mid] = array[low]
      array[low] = temp
      low += 1
      mid += 1
    elsif array[mid] == 1
      mid += 1
    elsif array[mid] == 2
      temp = array[mid]
      array[mid] = array[high]
      array[high] = temp
      high -= 1
    end
  end
  puts array.inspect
end

dutch_national_flag([0,1,1,0,2,1,2,0,2,0,2,1,1,1,2])

# start low and mid at 0 and high at the last
# while mid is less than high
# invariant: array[1..lo-1] = 0, lo..mid-1 = 1, hi+1..n = 2, mid..hi are unknown
