#class Graph
  #int V ;; number of vertices
  #adjacency_list : point to an array containing adjacency lists (stored as hash)
#end

def bfs_graph(s)
  visited = Array.new(number_of_nodes) { false }
  queue = []

  visited[s] = true
  queue << s

  while !queue.empty? do
    s = queue.first
    puts s.inspect
    queue.shift

    adj[s].each do |i|
      if !visited[i]
        visited[i] = true
        queue << i
      end
    end
  end
end
