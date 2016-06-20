def three_sum(intArr)
  intArr = intArr.sort
  result = []
  (0..intArr.length-2).to_a.each do |i|
    if i == 0 || intArr[i] > intArr[i - 1]
      left = i + 1
      right = intArr.length - 1
      result_found = false
      while (left < right && !result_found) do
        if intArr[i] + intArr[left] + intArr[right] == 0
          result << [intArr[i], intArr[left], intArr[right]]
          result_found = true
        elsif intArr[i] + intArr[left] + intArr[right] < 0
          left += 1
        else
          right -= 1
        end
      end
    end
  end
  result
end

puts three_sum([6,10,3,-4,1,-6,9])
