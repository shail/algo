def is_adjacent(a, b)
  count_differences = 0
  n = a.length
  (0...n).to_a.each do |i|
    count_differences += 1 if a[i] != b[i]
    return false if count_differences > 1
  end
  return count_differences == 1 ? true : false
end

def shortest_chain_len(start, target, dictionary)
  queue = []
  # store word and minimum chain length to reach the word and previous element
  queue << [start, 1, []]

  while !queue.empty? do
    curr = queue.shift
    delete = []
    dictionary.each do |word|
      if is_adjacent(curr.first, word)
        queue << [word, curr[1] + 1, curr[2] << curr.first]
        delete << word
        if word == target
          puts curr[1] + 1
          puts "Queue: #{queue}"
          return queue.first[2]
        end
      end
    end
    dictionary = dictionary - delete
  end
end

#p shortest_chain_len("toon", "plea", ["poon", "plee", "same", "poie", "plea", "plie", "poin"])
p shortest_chain_len("bat", "had", ["cat", "bat", "hat", "bad", "had"])

