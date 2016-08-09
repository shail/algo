def is_perfect_square(num)
  high = num / 2
  low = 0

  while high >= low do
    mid = (low + high) / 2
    square = mid * mid
    if square == num
      return true
    elsif square > num
      high = mid - 1
    else
      low = mid + 1
    end
  end
  return false
end

is_perfect_square(16)
