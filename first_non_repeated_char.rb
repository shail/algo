def first_non_repeated_char(string)
  hash = Hash.new(0)
  first_char = ""
  string.split("").each do |char|
    hash[char] += 1
  end
  string.split("").each do |char|
    if hash[char] < 2
      first_char << char
      break
    end
  end
  first_char
end

puts first_non_repeated_char("total") == "o"
puts first_non_repeated_char("teeter") == "r"
