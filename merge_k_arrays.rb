require './classic_min_heap.rb'
def merge_k_sorted_arrays(arrays)
  k = arrays.length
  # store output array
  output = Array.new(k * arrays.first.length) { 0 }

  # create a min heap with k heap nodes. every heap node has first element of an array
  heap = MinHeap.new()

  (0...k).to_a.each do |i|
    heap
  end
end
