def merge_sorted_array(array1, array2)
  m = array1.length
  n = array2.length

  (n-1).downto(0).to_a.each do |i|
    # find smallest element greated than ar2[i], move all elements one position ahead till the smallest
    # greater element is not found
    last = array1[m-1]
    j = m - 1
    while j >= 0 && array1[j] > array2[i] do
      array1[j] = array1[j-1]
      j -= 1
    end
    p array1
    p array2

    if j != m - 1
      array1[j+1] = array2[i]
      array2[i] = last
    end
  end
  p array1
  p array2
end

# Iterate through every element of array2 starting from last element.
# => store last element of ar1[i] as last
# => loop from last element of ar1[] while element ar1[j] is smaller than ar2[i]
#   ar1[j+1] = ar1[j]
#   j -= 1
# => if any element of ar1 was moved or j != m - 1
#   ar1[j+1] = ar2[i]
#   ar2[i] = last

merge_sorted_array([1,5,9,10,15,20], [2,3,8,13])
