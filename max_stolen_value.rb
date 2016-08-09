def maxStolenValue(arrHouseValues)
  return 0 if arrHouseValues.empty?
  value1 = arrHouseValues[0]
  return value1 if arrHouseValues.length == 1

  value2 = [arrHouseValues[0], arrHouseValues[1]].max
  return value2 if arrHouseValues.length == 2
  value = nil
  (2..arrHouseValues.length-1).to_a.each do |i|
    value = [value2, value1 + arrHouseValues[i]].max
    value1 = value2
    value2 = value
  end
  return value
end

puts maxStolenValue([6,1,2,7])
