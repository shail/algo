def wild_card(string, index)
  if string.length == index
    puts string
  else
    if string[index] == '?'
      string[index] = '0'
      wild_card(string, index + 1)
      string[index] = '1'
      wild_card(string, index + 1)
      string[index] = '?'
    else
      wild_card(string, index + 1)
    end
  end
end

wild_card('10?', 0)
