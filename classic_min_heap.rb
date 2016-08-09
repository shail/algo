# Need to store value, index position of array, and index position of next element
class MinHeap
  attr_reader :heap
  def initialize
    @heap = []
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

  def insert(n)
    @heap << n
    bubble_up(@heap.length-1)
  end

  def extract_min()
    min = @heap.first
    @heap[0] = @heap.last
    @heap.pop
    bubble_down(0)
    min
  end

  def minimum()
    @heap.first
  end

  def print()
    puts @heap.inspect
  end

  private

  def swap(first_node, second_node)
    temp = @heap[first_node]
    @heap[first_node] = @heap[second_node]
    @heap[second_node] = temp
  end

  def bubble_up(p)
    if parent(p) == -1
    elsif @heap[parent(p)] > @heap[p]
      swap(p, parent(p))
      bubble_up(parent(p))
    end
  end

  def bubble_down(p)
    c = left_child(p)
    min_index = p

    (0..1).to_a.each do |i|
      if (c + i) < @heap.length
        min_index = c+i if @heap[min_index] > @heap[c+i]
      end
    end

    if min_index != p
      swap(p, min_index)
      bubble_down(min_index)
    end
  end
end
