def longest_len(string)
  len = string.length
  max_len = 0
  last = -1

  return 0 if len == 0 || len == 1
  stack = []
  (0...len).to_a.each do |i|
    if string[i] == '('
      stack << i
    else
      if stack.empty?
        last = i
      else
        stack.pop
        if stack.empty?
          max_len = [max_len, i - last].max
        else
          max_len = [max_len, i - stack.last].max
        end
      end
    end
  end
  max_len
end

p longest_len('(())()')
