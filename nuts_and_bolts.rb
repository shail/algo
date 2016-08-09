def nuts_and_bolts(nuts, bolts, low, high)
  if low < high
    p "Low: #{low}"
    p "High: #{high}"
    p "Bolts[high]: #{bolts[high]}"
    pivot = partition(nuts, low, high, bolts[high])
    partition(bolts, low, high, nuts[pivot])
    nuts_and_bolts(nuts, bolts, low, pivot-1)
    nuts_and_bolts(nuts, bolts, pivot+1, high)
  end
  [nuts, bolts]
end

def partition(array, low, high, pivot)
  iterator = low
  while (low < high) do
    if array[low] < pivot
      p "array[Low]: #{low} - #{array[low]}"
      p "array[iterator]: #{iterator} - #{array[iterator]}"
      temp = array[iterator]
      array[iterator] = array[low]
      array[low] = temp
      iterator += 1
    elsif array[low] == pivot
      p "array[Low]: #{low} - #{array[low]}"
      p "array[high]: #{high} - #{array[high]}"
      temp = array[low]
      array[low] = array[high]
      array[high] = temp
      low -= 1
      p "array: #{array}"
    end
    low += 1
  end
  p "array[iterator]: #{iterator} - #{array[iterator]}"
  p "array[high]: #{high} - #{array[high]}"
  temp = array[iterator]
  array[iterator] = array[high]
  array[high] = temp
  p "finished_array: #{array}"

  iterator
end

array = nuts_and_bolts([3,2,1,4],[4,2,3,1],0,3)
puts array.first.inspect
puts array[1].inspect
