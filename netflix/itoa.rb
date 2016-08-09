def itoa(num)
  string = ""
  is_negative = false

  # Handle 0 explictly
  return '0' if num == 0

  # negative numbers are only handled with base 10
  if num < 0
    is_negative = true
    num = -num
  end

  while num != 0 do
    rem = num % 10
    char =  (rem > 9) ? (rem - 10) + 'a'.ord : rem + '0'.ord
    string.prepend(char.chr)
    num = num / 10
  end

  if is_negative
    string.prepend("-")
  end

  return string
end

p itoa(100)
