class Graph
  attr_accessor :adj_list
  def initialize()
    @adj_list = {}
  end

  def add_edge(v, w)
    if v && w
      if @adj_list.key?(v)
        @adj_list[v] << w
      else
        @adj_list[v] = [w]
      end
    end
  end
end

def make_graph(board)
  graph = Graph.new
  board.each_with_index do |row, index|
    row.each_with_index do |element, row_index|
       element = element + index.to_s if graph.adj_list[element]
       graph.add_edge(element, board[index][row_index+1]) if board[index][row_index+1]
       graph.add_edge(element, board[index][row_index-1]) if row_index - 1 >= 0
       graph.add_edge(element, board[index+1][row_index]) if board[index+1]
       graph.add_edge(element, board[index-1][row_index]) if index - 1 >= 0
       graph.add_edge(element, board[index+1][row_index+1]) if board[index+1] && row_index - 1 >= 0
       graph.add_edge(element, board[index+1][row_index-1]) if board[index+1] && row_index - 1 >= 0
       graph.add_edge(element, board[index-1][row_index+1]) if index - 1 >= 0 && board[index-1][row_index+1]
       graph.add_edge(element, board[index-1][row_index-1]) if index - 1 >= 0 && board[index-1][row_index-1]
    end
  end
  graph
end

def findWords(dictionaryList, board)
  graph = make_graph(board)
  result_array = []
  dictionaryList.each do |word|
    array = word.split("")
    result = true
    array.each_with_index do |char, index|
      if index < array.length-1
        result = false if !graph.adj_list[char] || !graph.adj_list[char].include?(array[index+1])
      end
    end
    result_array << word if result
  end
  p result_array
end

dictionary = ["GEEKS", "FOR", "QUIZ", "GO"]
board = [['G', 'I', 'Z'],
         ['U', 'E', 'K'],
         ['Q', 'S', 'E']]

findWords(dictionary, board)
