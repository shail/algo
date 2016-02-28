# Right shift moves over the next digit, you and with 1 to see if it is a 1 or 0 and then XOR it with result
# which will keep track of whether the number of ones is even or odd

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
