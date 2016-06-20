def add_word(w, words)
  if words[w]
    words[w] += 1
  else
    words[w] = 1
  end
end

def remove_word(w, words)
  return if !words.key?(w)
  if words[w] > 1
    words[w] -= 1
  else
    words.delete(w)
  end
end

def slide_window(s, start_val, word_len, words)
  old = s[start_val...start_val+word_len]
  add_word(old, words)
  return start_val + word_len
end

def concatSubstring(strText, strWords)
  return_indicies = []
  length, word_len = strWords.length, strWords.first.length
  return return_indicies if strWords.length == 0
  expect_words = {}
  strWords.each do |word|
    add_word(word, expect_words)
  end

  (0...word_len).to_a.each do |i|
    count = 0
    collect_words = expect_words.dup
    j = i
    start_val = i
    while j <= (strText.length - (length-count) * word_len) && start_val <= (strText.length - length * word_len) do
      substring = strText[j...j+word_len]
      if !expect_words.key?(substring)
        start_val = j + word_len
        j = start_val
        count = 0
        collect_words = collect_words.merge(expect_words)
      elsif !collect_words.key?(substring)
        start_val = slide_window(strText, start_val, word_len, collect_words)
      else
        remove_word(substring, collect_words)
        j += word_len
        count += 1
        if collect_words.empty?
          return_indicies << start_val
          start_val = slide_window(strText, start_val, word_len, collect_words)
          count -= 1
        end
      end
    end
  end
  return_indicies
end

puts concatSubstring("barfoothefoobarman", ["bar", "foo"])
