require './min_heap.rb'
INT_MAX = 2**63 - 1

def sort_arrays(arrays)
  new_heap = MinHeap.new()
  k = arrays.length
  n = arrays.first.length
  output = []
  arrays.each_with_index do |array, index|
    new_heap.insert(array.first, index, 1)
  end

  (0..k*n-1).to_a.each do |count|
    root = new_heap.extract_min()
    output[count] = root.first

    if root[2] < n
      new_heap.insert(arrays[root[1]][root[2]], root[1], root[2]+1)
    else
      # If the root was the last element of its array
      new_heap.insert(INT_MAX, INT_MAX, INT_MAX)
    end
  end

  output
end

puts sort_arrays([[2,6,12,34],[1,9,20,1000],[23,34,90,2000]]) == [1,2,6,9,12,20,23,34,34,90,1000,2000]

# Create output array
# Create min heap of size k and insert the 1st element in all arrays into the heap with the index of array,
# and index of next element to be stored from array
# n*k times do
#   - Get minimum element from heap and store into output
#   - Replace heap root with next element from that array. If the array doesn't have any more elements then
#   replace root with infinte, after replacing root, heapify the heap.
