# Need to store value, index position of array, and index position of next element
class MinHeap
  def initialize
    @heap_array = []
  end

  def parent(n)
    n == 0 ? -1 : n/2
  end

  def left_child(n)
    n * 2 + 1
  end

  def right_child(n)
    n * 2 + 2
  end

  def insert(n, index_pos_array, next_index)
    @heap_array << [n, index_pos_array, next_index]
    bubble_up(@heap_array.length-1)
  end

  def extract_min()
    min = @heap_array.first
    @heap_array[0] = @heap_array.last
    @heap_array.pop
    bubble_down(0)
    min
  end

  def minimum()
    @heap_array.first
  end

  def print()
    result = []
    @heap_array.each do |i|
      result << i[0]
    end
    puts result.inspect
  end

  private

  def swap(first_node, second_node)
    temp = @heap_array[first_node]
    @heap_array[first_node] = @heap_array[second_node]
    @heap_array[second_node] = temp
  end

  def bubble_up(p)
    if parent(p) == -1
    elsif @heap_array[parent(p)].first > @heap_array[p].first
      swap(p, parent(p))
      bubble_up(parent(p))
    end
  end

  def bubble_down(p)
    c = left_child(p)
    min_index = p

    (0..1).to_a.each do |i|
      if (c + i) < @heap_array.length
        min_index = c+i if @heap_array[min_index].first > @heap_array[c+i].first
      end
    end

    if min_index != p
      swap(p, min_index)
      bubble_down(min_index)
    end
  end
end

#new_heap = MinHeap.new()
#new_heap.insert(1,0,1)
#new_heap.print()
#new_heap.insert(5,1,1)
#new_heap.print()
#new_heap.insert(18,2,1)
#new_heap.print()
#new_heap.insert(-2,3,1)
#new_heap.print()
#new_heap.extract_min()
#new_heap.print()
#new_heap.insert(-10,4,1)
#new_heap.print()
#new_heap.extract_min()
#new_heap.print()
