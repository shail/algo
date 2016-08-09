def dominos(dominos, search)
  hash = Hash.new(0)
  dominos.each do |domino|
    return true if hash[[search[0] - domino[0], search[1] - domino[1]]] != 0
    hash[[domino[0], domino[1]]] += 1
  end

  return false
end

p dominos([[1,3], [1,4], [3,3], [5,2]], [6,6])
