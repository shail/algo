def evaluate(numbers, operators, target)
  result = []
  if numbers.empty?
    return
  end
  if operators.length == numbers.length - 1
    numbers = check_value(numbers, operators, target)
    if numbers
      place = operators.map { |x| x if x != "" }.compact
      return [numbers.zip(place).flatten.join("") + "=#{target}"]
    end
  else
    result << evaluate(numbers, operators << "", target)
    operators.pop
    result << evaluate(numbers, operators << "*", target)
    operators.pop
    result << evaluate(numbers, operators << "+", target)
    operators.pop
  end
  print(result)
end

def print(result)
  result.map do |array|
    array.reject { |elem| elem.empty? }
  end.flatten
end

def check_value(numbers, operators, target)
  copy_numbers = numbers.dup
  copy_operators = operators.dup
  iterate(copy_numbers, copy_operators, "", target)
  return_numbers = copy_numbers.dup
  iterate(copy_numbers, copy_operators, "*", target)
  iterate(copy_numbers, copy_operators, "+", target)
  if copy_numbers.first == target
    return return_numbers
  else
    return false
  end
end

def iterate(numbers, operators, check, target)
  i = 0
  while !operators.nil? && i < operators.length do
    if operators[i] == check
      if check == ""
        numbers[i] = numbers[i] * 10 + numbers[i+1]
      elsif check == "*"
        numbers[i] *= numbers[i+1]
      else
        numbers[i] += numbers[i+1]
      end
      numbers.delete_at(i+1)
      operators.delete_at(i)
      i -= 1
    end
    i += 1
  end
end

puts evaluate([1,2,3,4], [], 14)
puts evaluate([2,2,2], [], 24).inspect
puts evaluate([], [], 24)

