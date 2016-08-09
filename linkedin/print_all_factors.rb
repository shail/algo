def print_all_factors(number)
  return if number <= 1
  p number.to_s + " * 1"
  print_factors("", number, number)
end

def print_factors(current_expression, dividend, previous_factor)
  (dividend-1).downto(2).to_a.each do |factor|
    if dividend % factor == 0 && factor <= previous_factor
      # found 2 factors
      next_factor = dividend / factor

      # print only if second factor is smaller (descending order)
      if next_factor <= factor
        p "#{current_expression}#{factor} * #{next_factor}"
      end
      print_factors(current_expression + factor.to_s + " * ", next_factor, factor)
    end
  end
end

print_all_factors(32)
