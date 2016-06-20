def isMatch(strText, strPattern)
  return false if !strText && !strPattern
  return strText == "" if strPattern == ""

  if strPattern[1] != '*'
    return (strPattern[0] == strText[0] || (strPattern[0] == '.' && strText[0] != "")) &&
      isMatch(strText[1...strText.length], strPattern[1...strPattern.length])
  end

  while (strPattern[0] == strText[0] || (strPattern[0] == '.' && strText[0] != "")) do
    return true if isMatch(strText, strPattern[2...strPattern.length])
    strText[0] = ''
  end

  return isMatch(strText, strPattern[2...strPattern.length])
end

puts isMatch('aab', 'c*a*b')
puts isMatch('aaaaaa', '.a*')
