def word_break(word, dictionary)
  dp_array = Array.new(word.length+1) { Array.new }
  (0..word.length-1).to_a.each do |i|
    next if dp_array[i].nil?
    dictionary.each do |s|
      length = s.length
      end_value = i + length
      next if end_value > word.length
      if word[i...end_value] == s
        dp_array[end_value] << s
      end
    end
  end
  result, temp = [], []
  puts dp_array.inspect
  dfs(dp_array, word.length, result, temp)
  puts result.inspect
end

def dfs(dp_array, end_value, result, temp)
  puts end_value.inspect
  if end_value <= 0
    path = temp[temp.length-1].to_s
    (temp.length-2).downto(0) do |i|
      path << " " + temp[i]
    end
    result << path
    return
  end

  dp_array[end_value].each do |string|
    temp << string
    dfs(dp_array, end_value - string.length, result, temp)
    temp.delete_at(temp.length-1)
  end
end

word_break("interviewkickstart", ["a", "e", "i", "int", "inter", "interview", "kick", "kicker", "kickstart", "star", "start", "view"])
