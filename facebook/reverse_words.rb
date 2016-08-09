def reverse_words(string)
  temp = 0
  word_begin = nil
  # Make sure that the string starts with a valid character (not space) only
  while temp < string.length do
    if word_begin.nil? && string[temp] != ' '
      word_begin = temp
    end

    if word_begin && (string[temp + 1] == ' ' || string[temp+1].nil?)
      string[word_begin..temp] = string[word_begin..temp].reverse
      word_begin = nil
    end
    temp += 1
  end
  string.reverse
end

p reverse_words("hello world")
