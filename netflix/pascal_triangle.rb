# We know that ith entry in a line number if Binomial Coefficient C(line, i) and call lines start with value
# 1. The idea is to calculate C(line, i) using C(line, i - 1)
# C(line, i) = line! / ( (line-i)! * i! )
# C(line, i-1) = line! / ( (line - i + 1)! * (i-1)! )
# C(line, i) = C(line, i-1) * (line - i + 1) / i

def print_pascal(n)
  (1..n).to_a.each do |line|
    line_value = 1
    (1..line).to_a.each do |i|
      print "#{line_value} "
      line_value = line_value * (line - i) / i
    end
    puts
  end
end

print_pascal(3)
