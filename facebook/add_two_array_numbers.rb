def add_two_array_numbers(array1, array2)
  result = []
  carry = 0
  if array1.length > array2.length
    first = array1
    second = array2
  else
    first = array2
    second = array1
  end
  j = second.length-1
  (first.length-1).downto(0).each do |i|
    if j >= 0
      val = carry + first[i] + second[j]
      result[i] = val % 10
      carry = val / 10
      j -= 1
    else
      val = carry + first[i]
      result[i] = val % 10
      carry = val / 10
    end
  end

  result.unshift(1) if carry == 1
  result
end

p add_two_array_numbers([1,1], [1,1,1,1])
