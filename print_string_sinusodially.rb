def print_string_sinusoidally(string)
  first_string = " " * string.length
  second_string = " " * string.length
  third_string = " " * string.length

  string.split("").each_with_index do |char, index|
    char = "~" if char == " "
    if index % 4 == 0
      third_string[index] = char
    elsif index % 2 != 0
      second_string[index] = char
    else
      first_string[index] = char
    end
  end
  puts first_string
  puts second_string
  puts third_string
end

print_string_sinusoidally("Google Worked")
