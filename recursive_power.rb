def power(double, exponent)
  if exponent == 0
    return 1
  elsif exponent % 2 == 0
    value = power(double, exponent/2)
    return value * value
  else
    value = power(double, (exponent-1)/2)
    return value * value * double
  end
end

puts power(3.5,3)
