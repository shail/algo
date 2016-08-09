def distance(point1, point2)
  Math.hypot(point2.first - point1.first, point2[1] - point1[1]).to_i
end

def kth_smallest(array, l, r, k)
  result = []
  if k > 0 && k <= r - l + 1
    pos = partition(array, l, r)
    if pos-l == k-1
      result = array[pos].last
    elsif pos-l > k-1
      result = kth_smallest(array, l, pos-1, k).first
    else
      result = kth_smallest(array, pos+1, r, k-pos+l-1).first
    end
  end
  [result,array]
end

def partition(array, l, r)
  x = array[r].last
  i = l
  (l..r-1).to_a.each do |j|
    if array[j].last <= x
      temp = array[i]
      array[i] = array[j]
      array[j] = temp
      i += 1
    end
  end
  temp = array[i]
  array[i] = array[r]
  array[r] = temp
  i
end

def nearest_neighbors(array, p, k)
  found = false
  (0..array.length-1).to_a.each do |i|
    if array[i] == p && !found
      temp = array[i]
      array[i] = array.last
      array[array.length - 1] = temp
      found = true
    end
  end

  (0..array.length-2).to_a.each do |i|
    array[i] << distance(array[i], p)
  end
  array.pop
  kth_smallest(array,0,array.length-1,k)[1][0..k-1].map do |value|
    value[0..1]
  end
end


nearest_neighbors([[1,1],[7,1],[6,1],[8,1],[3,1],[9,1],[10,1]], [8,1], 3)
