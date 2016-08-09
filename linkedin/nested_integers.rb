def nested_integers(list, depth)
  sum = 0
  nested_integer = nil

  while list.hasNext do
    nested_integer = list.next
    if nested_integer.isInteger
      sum += nested_integer.getInteger * depth
    else
      sum += nested_integers(nested_integer.getList(), depth + 1)
    end
  end
  return sum
end
