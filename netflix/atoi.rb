def is_numeric_char(x)
  return x.ord >= '0'.ord && x.ord <= '9'.ord ? true : false
end

def atoi(string)
  return 0 if string.empty?
  result = 0
  sign = string[0] == '-' ? -1 : 1

  string.split("").each_with_index do |char, index|
    if sign == -1 && index == 0
      next
    else
      if is_numeric_char(char)
        result = result * 10 + (char.ord - '0'.ord)
      end
    end
  end

  return sign * result
end

p atoi("8959")
p atoi("-8959")
