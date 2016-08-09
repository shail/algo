def kmp(strTest, strPattern)
  m = strPattern.length
  n = strText.length
  found = false
  i,j = 0,0
  lps = Array.new(m)
  preprocess(strPattern, m, lps)
  while i < n do
    if strPattern[j] == strText[i]
      j += 1
      i += 1
    end

    if j == m
      found = true
      j = lps[j-1]
    elsif i < n && strPattern[j] != strText[i]
      if j != 0
        j = lps[j-1]
      else
        i = i + 1
      end
    end
  end
  found
end

def preprocess(pattern, m, lps)
  len = 0
  lps[0] = 0
  i = 1
  while i < m do
    if pattern[i] == pattern[len]
      puts len.inspect
      len += 1
      lps[i] = len
      i += 1
    else
      if len != 0
        len = lps[len-1]
      else
        lps[i] = 0
        i += 1
      end
    end
  end
end

puts kmp("ABABDABACDABABCABAB", "ABABCABAB")
