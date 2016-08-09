def maxProductFromCutPieces(iRopeLength)
  val = Array.new(iRopeLength+1)
  val[0] = val[1] = 0
  (1..iRopeLength).to_a.each do |i|
    max_val = 0
    (1..i/2).to_a.each do |j|
      max_val = [max_val, (i-j)*j, j*val[i-j]].max
    end
    val[i] = max_val
  end
  return val[iRopeLength]
end

puts maxProductFromCutPieces(10)
