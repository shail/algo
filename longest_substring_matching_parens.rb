def longest_substring_parens(strParenExpression)
  stack = []
  max_len = 0
  max_start = 0
  prev_start = 0
  strParenExpression.split("").each_with_index do |value, i|
    if value == '('
      if stack.empty?
        prev_start = i
      end
      stack << i
    else
      if stack.empty?
        prev_start = i + 1
      else
        stack.pop
        start = stack.empty? ? prev_start - 1 : stack.last
        size = i - start
        if size > max_len
          max_start += 1
          max_len = size
        end
      end
    end
  end
  puts max_start.inspect
  puts max_len.inspect
  max_len
end

puts longest_substring_parens('()(())')
# Push onto the stack and
