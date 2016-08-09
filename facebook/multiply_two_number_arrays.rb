def multiple(array1, array2)
  result = Array.new(array1.length + array2.length) { 0 }
  (0...array1.length).to_a.each do |i|
    result_index = 0
    carry = 0
    array1_operand = array1[i]
    (0...array2.length).to_a.each do |j|
      cr = carry + array1_operand * array2[j] + result[result_index]
      result[result_index] = cr % 10
      carry = cr / 10
      result_index += 1
    end

    while carry != 0 do
      cr = carry + result[result_index]
      result[result_index] = cr % 10
      carry = cr / 10
      result_index += 1
    end
  end
  while !result.empty? && result.last == 0 do
    result.pop
  end
  result
end

p multiple([3], [9,9])
