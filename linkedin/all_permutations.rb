def swap(string, pos1, pos2)
  temp = string[pos1]
  string[pos1] = string[pos2]
  string[pos2] = temp
end

def permutations(string, left, right)
  if left == right
    p string
  else
    (left..right).to_a.each do |i|
      swap(string, left, i)
      permutations(string, left+1, right)
      swap(string, left, i)
    end
  end
end

permutations('ABC', 0, 2)
