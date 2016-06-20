def sortCharacters(inString)
  ascii_char = Array.new(256, 0)
  inString.split("").each do |value|
    ascii_char[value.ord] += 1
  end

  count = 0
  inString = ""
  ascii_char.each_with_index do |value, index|
    if value > 0
      letter = index.chr
      inString[count..value-1] = letter * value
      count += value
    end
  end
  inString
end

sortCharacters("The quick brown fox jumps over the lazy dog")
