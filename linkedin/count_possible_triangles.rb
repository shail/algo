def triangles(array)
  array.sort!
  n = array.length
  count = 0
  result = []
  # fix first element, need to run until n - 3 as other two elements are selected
  (0...(n-2)).to_a.each do |i|
    # index of rightmost
    k = i + 2
    # fix second element
    ((i+1)...n).to_a.each do |j|
      # Find rightmost element which is smaller than the sum of two fixed elements. if the value of arr[i] +
      # arr[j-1] was greater than arr[k] then arr[i] + arr[j] > arr[k]
      while (k < n && array[i] + array[j] > array[k]) do
        result << [array[i],array[j],array[k]] if i != j && j != k && i != k
        k += 1
      end

      # Total number of possible triangles that can be formed with the two fixed elements is k - j - 1. Two
      # fixed elements are arr[i] and arr[j]. All elements between j+1 and k-1 can form a triangle with i and
      # j. One is subtracted from k because k is increment one extra in above while loop
      count += k - j - 1
    end
  end
  p result
  count
end

p triangles([10,21,22,100,101,200,300])
