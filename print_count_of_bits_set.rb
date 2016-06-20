def popcount(x)
  m1 = 0x55555555
  m2 = 0x33333333
  m4 = 0x0f0f0f0f
  x -= (x >> 1) & m1
  x = (x & m2) + ((x >> 2) & m2)
  x = (x + (x >> 4)) & m4
  x += x >> 8
  return (x + (x >> 16)) & 0x3f
end

def printCountOfBitsSet(intArr)
  hash = {}
  (0..2147483647).to_a.each do |v|
    hash[v] = popcount(v)
  end

  sum = 0
  intArr.each do |i|
    sum += hash[i]
  end
  return sum
end

printCountOfBitsSet([29])
