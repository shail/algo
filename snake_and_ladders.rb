def get_min_throws(board)
  n = board.length
  visited = Array.new(n) { false }
  queue = []
  visited[0] = true
  queue << { :vertex_num => 0, :dist => 0 }
  queue_entry = nil
  while !queue.empty? do
    queue_entry = queue.shift
    v = queue_entry[:vertex_num]
    break if v == n - 1
    j = v + 1
    while j <= (v + 6) && j < n do
      if !visited[j]
        a = { :dist => queue_entry[:dist] + 1 }
        visited[j] = true

        if board[j] != -1
          a[:vertex_num] = board[j]
        else
          a[:vertex_num] = j
        end
        queue << a
      end
      j += 1
    end
  end
  return queue_entry[:dist]
end


board = []
(0...30).to_a.each do |i|
  board[i] = -1
end

board[2] = 21
board[4] = 7
board[10] = 25
board[19] = 28

board[26] = 0
board[20] = 8
board[16] = 3
board[18] = 6

puts get_min_throws(board)
