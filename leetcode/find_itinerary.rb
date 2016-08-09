require 'pqueue'

def find_itinerary(tickets)
  hash = {}
  result = []

  tickets.each do |ticket|
    if !hash.key?(ticket[0])
      q = PQueue.new()
      hash[ticket[0]] = q
    end
    hash[ticket[0]].push(ticket[1])
  end
  dfs("JFK", result, hash)
  return result
end

def dfs(string, result, hash)
  q = hash[string]

  while !q.nil? && q.size != 0 do
    dfs(q.pop, result, hash)
  end

  result.unshift(string)
end

p find_itinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])
p find_itinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
p find_itinerary([["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]])

#An Eulerian path is a trail in a graph which visits every edge exactly once. There are many problems are in the category of finding Eulerian path. For example, given a stack of airplane (bus) ticket stubs, reconstruct the travel journey assuming we know where the journey starts.

  # Hierholzer's algorithm is an elegant and efficient algorithm. It takes linear time.

  # Choose any starting vertex v, and follow a trail of edges from that vertex until returning to v. It is not possible to get stuck at any vertex other than v, because the even degree of all vertices ensures that, when the trail enters another vertex w there must be an unused edge leaving w. The tour formed in this way is a closed tour, but may not cover all the vertices and edges of the initial graph.

  # As long as there exists a vertex v that belongs to the current tour but that has adjacent edges not part of the tour, start another trail from v, following unused edges until returning to v, and join the tour formed in this way to the previous tour.
