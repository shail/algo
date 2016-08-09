def is_perfect_square(x)
  return true if x == 0 || x == 1

  start, end_value = 1, x/2

  while start <= end_value do
    mid = (start + end_value) / 2

    if mid*mid == x
      return true
    end

    if mid*mid < x
      start = mid + 1
    else
      end_value = mid - 1
    end
  end
  return false
end

p is_perfect_square(16)
p is_perfect_square(25)
p is_perfect_square(26)
