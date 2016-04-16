def group_numbers(array)
  even_start = 0
  odd_start = array.length - 1

  while (even_start < odd_start) do
    while (array[even_start] % 2 == 0 && even_start < odd_start) do
      even_start += 1
    end

    while (array[odd_start] % 2 == 1 && even_start < odd_start) do
      odd_start -= 1
    end

    if even_start < odd_start
      temp = array[even_start]
      array[even_start] = array[odd_start]
      array[odd_start] = temp
      even_start += 1
      odd_start -= 1
    end
  end
  array
end

puts group_numbers([1,2,4,6,3,9,10,11,13,15]).inspect

