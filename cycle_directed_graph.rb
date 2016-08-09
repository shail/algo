class Graph
  attr_accessor :number_of_vertices, :adj_list
  def initialize(v)
    @number_of_vertices = v
    @adj_list = Array.new(@number_of_vertices) { [] }
  end

  def add_edge(v, w)
    @adj_list[v] << w
  end

  def is_cyclic_util(vertex, visited, rec_stack)
    if !visited[vertex]
      visited[vertex] = true
      rec_stack[vertex] = true

      @adj_list[vertex].each do |node|
        if !visited[node] && is_cyclic_util(node, visited, rec_stack)
          return true
        elsif rec_stack[node]
          return true
        end
      end
    end
    rec_stack[vertex] = false
    return false
  end

  def is_cyclic()
    visited = Array.new(@number_of_vertices) { false }
    rec_stack = Array.new(@number_of_vertices) { false }
    (0...@number_of_vertices).to_a.each do |i|
      return true if is_cyclic_util(i, visited, rec_stack)
    end
    return false
  end
end

graph = Graph.new(4)
graph.add_edge(0, 1);
graph.add_edge(0, 2);
graph.add_edge(1, 2);
graph.add_edge(2, 0);
graph.add_edge(2, 3);
graph.add_edge(3, 3);

puts graph.is_cyclic()

graph = Graph.new(3)

graph.add_edge(0,1)
graph.add_edge(1,2)
puts graph.is_cyclic()
