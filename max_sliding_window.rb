def max_sliding_window(array, w)
  deque = []
  result = []
  (0..w-1).to_a.each do |i|
    while (!deque.empty? && array[i] >= array[deque.last]) do
      deque.pop
    end
    deque << i
  end
  p deque

  (w..array.length-1).to_a.each do |i|
    result[i-w] = array[deque.first]
    while (!deque.empty? && array[i] >= array[deque.last]) do
      deque.pop
    end
    while (!deque.empty? && deque.first <= i - w) do
      deque.shift
    end
    deque << i
  end
  result[array.length-w] = array[deque.first]
  puts result.inspect
end

max_sliding_window([1,8,3,4,5,6,7],3)
