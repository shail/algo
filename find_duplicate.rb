def find_dup(intArr)
  duplicate = nil
  intArr.each_with_index do |value, i|
    while (intArr[i] != i+1 && duplicate.nil?) do
      j = intArr[i] - 1
      if intArr[i] == intArr[j]
        duplicate = intArr[i]
      else
        temp = intArr[i]
        intArr[i] = intArr[j]
        intArr[j] = temp
      end
    end
  end
  duplicate
end

puts find_dup([3,1,2,3])
