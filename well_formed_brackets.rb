def brackets_combo(output, open, close, pairs)
  if open == pairs && close == pairs
    puts output
  else
    brackets_combo(output + "(", open + 1, close, pairs) if open < pairs
    brackets_combo(output + ")", open, close + 1, pairs) if close < open
  end
end

def brackets(n)
  (1..n).to_a.each do |i|
    brackets_combo("", 0, 0, i)
  end
end

brackets(3)
