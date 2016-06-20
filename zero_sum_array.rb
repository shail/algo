def sumZero(intArr)
  hash = {}
  result = []
  sum = 0

  (0...intArr.length).to_a.each do |i|
    sum += intArr[i]
    if intArr[i] == 0
      result << intArr[i]
    end

    if sum == 0 && intArr[i] != 0
      result << intArr[0..i]
    end

    if !hash[sum].nil?
      start_index = hash[sum] + 1
      result << intArr[start_index..i]
    end

    hash[sum] = i
  end
  return result.empty? ? [""] : result
end

p sumZero([0,1,2,3,4,-10])
p sumZero([0])
p sumZero([0,1,2,-3])
