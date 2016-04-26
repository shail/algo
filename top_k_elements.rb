require './classic_min_heap.rb'

def top_k_elements(iStream, iK)
  heap = MinHeap.new()
  (0..iK-1).to_a.each do |i|
    heap.insert(iStream[i])
  end

  (iK..(iStream.length-1)).to_a.each do |i|
    if heap.minimum < iStream[i]
      heap.extract_min()
      heap.insert(iStream[i])
    end
  end

  heap.heap
end

puts top_k_elements([0,5,2,1,17,18,24,33,2,4,5,10],3)
