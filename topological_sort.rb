require 'set'
class Graph
  attr_accessor :number_of_vertices, :adj_list
  def initialize(v)
    @number_of_vertices = v
    @adj_list = Array.new(v) { [] }
  end

  def add_edge(v, w)
    @adj_list[v] << w
  end

  def topological_sort_util(v, visited, stack)
    visited[v] = true
    @adj_list[v].each do |vertex|
      topological_sort_util(vertex, visited, stack) if !visited[vertex]
    end
    stack << v
  end

  def topological_sort()
    stack = []
    visited = Array.new(@number_of_vertices) { false }
    (0..@number_of_vertices-1).to_a.each do |i|
      topological_sort_util(i, visited, stack) if visited[i] == false
    end

    while stack.empty? == false do
      print ('a'.ord + stack.pop).chr
    end
    puts
  end
end

def print_order(words, n, alpha)
  graph = Graph.new(alpha)
  (0...n-1).to_a.each do |i|
    word1, word2 = words[i], words[i+1]
    min_length = [word1.length, word2.length].min
    (0..min_length-1).to_a.each do |j|
      if word1[j] != word2[j]
        graph.add_edge(word1[j].ord - 'a'.ord, word2[j].ord - 'a'.ord)
        break
      end
    end
  end
  graph.topological_sort()
end

def findOrder(strDict)
  chars = Set.new()
  strDict.each do |word|
    chars.merge(word.split("").uniq)
  end
  print_order(strDict, strDict.length, chars.length)
end

findOrder(["aa", "bb", "cc", "dd", "ee"])
