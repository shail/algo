#!/bin/ruby
n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
  a_t = gets.strip
  a[a_i] = a_t.split(' ').map(&:to_i)
end

first_diagonal = 0
second_diagonal = 0
a.each_with_index do |row, index|
  first_diagonal += row[n - index - 1]
  second_diagonal += row[index]
end
puts (first_diagonal - second_diagonal).abs
