def fibonacci(index)
  return 0 if index == 0
  return 1 if index == 1
  return fibonacci(index - 1) + fibonacci(index - 2)
end

def iterative_fib(index)
  a, b = 1, 1
  (0...index).to_a.each do |i|
    temp = a
    a = b
    b = temp + b
  end
  return a
end

p fibonacci(4)
p iterative_fib(4)
