def max_difference(array)
  minimum, maximum = array.first, array.first
  array.each do |element|
    minimum = element if element < minimum
    maximum = element if element > maximum
  end
  puts maximum - minimum
end

max_difference([1,9,8,2,5,10,3,15,4])
