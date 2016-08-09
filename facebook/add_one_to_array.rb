def add_one_to_array(array_number)
  carry = 1
  result = array_number.dup
  (array_number.length-1).downto(0).each do |i|
    val = array_number[i] + carry
    result[i] = val % 10
    carry = val / 10
  end

  if carry == 1
    result = Array.new(result.length + 1) { 0 }
    result[0] = 1
  end

  result
end

p add_one_to_array([1,2,3,4])
p add_one_to_array([9,9,9,9])
