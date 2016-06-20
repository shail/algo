def print_pascal(n)
  (1..n).to_a.each do |line|
    c = 1
    (1..line).to_a.each do |i|
      print "#{c} "
      c = c * (line - i) / i
    end
    puts
  end
end

print_pascal(6)
