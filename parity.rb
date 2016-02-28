def parity(n)
  result = 0
  while (n != 0) do
    # n & 1 = will be 0 if it is even, 1 if odd
    # XOR with result, so if there are an even number of 1s then it will be 0
    result ^= (n & 1)
    puts "Result: #{result.inspect}"
    # This right shift is basically dividing the number in 2
    n >>= 1
    puts "N: #{n.inspect}"
  end
  puts result.inspect
end

parity(10)
