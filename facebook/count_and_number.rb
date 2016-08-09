def count_and_number(number)
  i,j = 0,1
  number = number.split("")
  result = ""
  while i < number.length && j < number.length do
    number_to_push = number[i]
    count = 1
    while number[j] == number_to_push do
      j += 1
      count += 1
    end
    result << "#{count}#{number[i]}"
    i = j
    j += 1
  end
  result
end

puts count_and_number("1122344")
# Basically we keep two pointers, one that increments by one, and then other one moves forward to see how
# many of that number has been found
