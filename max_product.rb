def max_product(array, n)
  sorted_array = array.sort!
  bottom_half = sorted_array[0..n-2].inject(1, :*)
  top_half = sorted_array[(array.length - n + 1)..-1].inject(1, :*)
  if bottom_half > top_half
    bottom_half * sorted_array.last
  else
    top_half * sorted_array[(array.length - n)]
  end
end

puts max_product([-5, -1, 0, 1, 2], 3)
