class Graph
  def initialize()
    @adj_list = {}
    @prev_vertex = {}
  end

  def add_edge(v, w)
    if @adj_list.key?(v)
      @adj_list[v] << w
    else
      @adj_list[v] = [w]
    end
  end

  def bfs_shortest(start)
    queue = [start]
    @prev_vertex[start] = nil
    while !queue.empty? do
      v = queue.shift
      if @adj_list.key?(v)
        v_adj = @adj_list[v]
      else
        next
      end

      v_adj.each do |nextv|
        if @prev_vertex.key?(nextv)
          next
        else
          queue << nextv
          @prev_vertex[nextv] = v
        end
      end
    end
  end

  def get_path(end_value)
    v = end_value
    path = []
    while @prev_vertex.key?(v) && !@prev_vertex[v].nil? do
      path.unshift(v)
      v = @prev_vertex[v]
    end

    if @prev_vertex.key?(v)
      path.unshift(v)
    else
      puts "Destination not reachable"
    end

    return path
  end
end

class Chessboard
  def initialize(n)
    @size = n
    @board = Graph.new()

    possible_knight_moves = [[2,1], [2,-1], [1,2], [1,-2], [-2,1], [-2,-1], [-1,2], [-1,-2]]
    (0...n).to_a.each do |x|
      (0...n).to_a.each do |y|
        start = self.point_to_index(x, y)
        possible_knight_moves.each do |move|
          nx = x + move[0]
          ny = y + move[1]

          if self.is_valid(nx, ny)
            end_value = self.point_to_index(nx, ny)
            @board.add_edge(start, end_value)
          end
        end
      end
    end
  end

  def solve_knight(start, finish)
    x, y = start[0]-1, start[1]-1
    start = self.point_to_index(x, y)
    end_value = self.point_to_index(finish[0]-1, finish[1]-1)
    @board.bfs_shortest(start)
    path = []
    @board.get_path(end_value).each do |x_value|
      path << self.index_to_point(x_value)
    end
    result = []
    path.each do |move|
      result << [move[0] + 1, move[1] + 1]
    end
    return result.inspect
  end

  def is_valid(x,y)
    return 0 <= x && x < @size && 0 <= y && y < @size
  end

  def point_to_index(x,y)
    return x * @size + y
  end

  def index_to_point(p)
    return [p / @size, p % @size]
  end
end

chess = Chessboard.new(6)
puts chess.solve_knight([1,1], [4,4])
