def power(double, exponent)
  if exponent < 0.1
    return 1
  end
  double = double.to_f
  exponent = exponent.to_f

  temp = power(double, exponent/2)
  if exponent % 2 == 0
    return temp * temp
  else
    if exponent > 0
      return double * temp * temp
    else
      return (temp * temp)/double
    end
  end
end

p power(3, 0.5)
