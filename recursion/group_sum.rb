def group_sum(start, numbers, target)
  numbers[start...numbers.length].to_a.each_with_index do |value, index|
    if target - value == 0
      return true
    elsif target - value > 0
      return group_sum(start + index, numbers, target - value)
    else
      next
    end
  end
  return false
end

p group_sum(0, [2,4,8], 10) == true
p group_sum(0, [2,4,8], 14) == true
p group_sum(0, [2,4,8], 9) == false
p group_sum(0, [1,2,3,4,5], 6) == true
