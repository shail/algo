def evaluate_polish_notation(string)
  array = string.split(" ")
  operators = { "+" => 1, "-" => 1, "\\" => 1, "*" => 1 }
  stack = []
  array.each do |token|
    if operators.key?(token)
      first, second = stack.pop.to_i, stack.pop.to_i
      stack << first.send(token, second)
    else
      stack << token
    end
  end
  p stack.first
end

evaluate_polish_notation("3 3 +")
