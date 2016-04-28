def queens(n, array, i)
  if i == n
    puts array.inspect
    return
  end

  (0..n-1).to_a.each do |j|
    array[i] = j
    k = 0
    while k < i do
      if array[k] == array[i] || array[k] - array[i] == k - i || array[k] - array[i] == i - k
        break
      end
      k += 1
    end
    next if k != i
    queens(n, array, i+1)
  end
end

def test
  (0..10).to_a.each do |i|
    queens(i, [], 0)
  end
end

test()
