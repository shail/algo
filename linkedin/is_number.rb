def is_number(string)
  sign_occurred = false
  decimal_occurred = false
  started = false

  string.each_char do |c|
    case c
    when '+', '-'
      if started || sign_occurred || decimal_occurred
        return false
      else
        sign_occurred = true
      end
    when '0','1','2','3','4','5','6','7','8','9'
      started = true
    when '.'
      if decimal_occurred
        return false
      else
        decimal_occurred = true
      end
    else
      return false
    end
  end
  return true
end

p is_number('b123')
