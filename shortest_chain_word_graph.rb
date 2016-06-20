class Graph
  attr_accessor :adj_list
  def initialize()
    @adj_list = {}
  end

  def add_edge(v, w)
    if @adj_list.key?(v)
      @adj_list[v] << w
    else
      @adj_list[v] = [w]
    end
  end
end

def is_adjacent(a, b)
  count_differences = 0
  n = a.length
  (0...n).to_a.each do |i|
    count_differences += 1 if a[i] != b[i]
    return false if count_differences > 1
  end
  return count_differences == 1 ? true : false
end

def find_shortest_path(graph, start, target)
  return_array = nil
  queue = []
  queue << [start]
  while !queue.empty? do
    tmp_path = queue.shift
    last_node = tmp_path.last
    if last_node == target
      if return_array
        return_array = tmp_path if return_array.length > tmp_path.length
      else
        return_array = tmp_path
      end
    end

    graph.adj_list[last_node].each do |link_node|
      if !tmp_path.include?(link_node)
        new_path = []
        new_path = tmp_path + [link_node]
        queue << new_path
      end
    end
  end
  return_array
end

dictionary = ["cat", "bat", "hat", "bad", "had"]
graph = Graph.new()
dictionary.each_with_index do |word, index|
  dictionary.each do |compare_word|
    if word != compare_word
      graph.add_edge(word, compare_word) if is_adjacent(word, compare_word)
    end
  end
end

p find_shortest_path(graph, "cat", "had")
