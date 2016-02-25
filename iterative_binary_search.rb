def iterative_binary_search(array, target)
  lower = 0
  upper = array.length
  index = 0
  array.length.times do
    range = upper - lower
    center = (range / 2) + lower
    if (target == array[center])
      index = center
    elsif (target < array[center])
      upper = center - 1
    else
      lower = center + 1
    end
  end
  index
end

puts iterative_binary_search([1,2,3,4,5,6,7], 6)
