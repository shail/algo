def triangle_segments(segments)
  segments.sort!
  i, j = 0,1

  (2...segments.length).to_a.each do |k|
    return true if is_triplet(segments[i], segments[j], segments[k])
    i += 1
    j += 1
  end
  return false
end

def is_triplet(a, b, c)
  return (a + b) > c
end

p triangle_segments([6,4,5])
p triangle_segments([10,2,7])
# triangles are more likely to occur when 3 lengths are close to one another so sort that way, 3,4,5 is closer
# than 3,4,6
