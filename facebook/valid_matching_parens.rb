def valid_matching_parens(strExpression)
  stack = []
  result = true
  matching_braces = { ")" => "(", "}"=> "{", "]"=> "["}
  puts strExpression.split("").inspect
  strExpression.split("").each do |value|
    if ["(","{", "["].include?(value)
      stack << value
    elsif [")","}","]"].include?(value)
      result = false if matching_braces[value] != stack.pop
    end
  end
  result
end

puts valid_matching_parens("( ( 1 + 2 ) * 3 )")
puts valid_matching_parens("[([])}")
