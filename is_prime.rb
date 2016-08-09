def is_prime(number)
  return true if number == 2
  return true if number == 3
  return false if number % 2 == 0
  return false if number % 3 == 0

  i = 5
  w = 2

  while (i * i) <= number do
    return false if number % i == 0

    i += w
    w = 6 - 2
  end

  return true
end

p is_prime(15485867)
