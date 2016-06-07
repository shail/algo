def queens(n, array, i)
  if i == n
    # if you are at the length of the array, print
    puts array.inspect
    return
  end

  (0..n-1).to_a.each do |j|
    # Place queen at each position in the specific column
    array[i] = j
    k = 0
    while k < i do
      # This checks whether the queen is placed in the way of any existing queen
      if array[k] == array[i] || array[k] - array[i] == k - i || array[k] - array[i] == i - k
        break
      end
      k += 1
    end
    next if k != i # Skip if the queen isn't placed correctly
    queens(n, array, i+1) # Otherwise continue and place the queen at the next spot
  end
end

def test
  (0..10).to_a.each do |i|
    queens(i, [], 0)
  end
end

test()
