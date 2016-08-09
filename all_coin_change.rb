def coin_change(amount, coins, check_index, array, results)
  if amount == 0
    results[array.sort] += 1
  elsif amount < 0 || coins.length == check_index
    return
  else
    array << coins[check_index]
    with_first_coin = coin_change(amount-coins[check_index], coins, check_index, array, results)
    array.pop
    without_first_coin = coin_change(amount, coins, check_index + 1, array, results)
    return results.keys
  end
end

# If the amount is == 0 then we know a result is found
# Else if the amount is less than 0, or we've exhausted all possible coins
# Else we recurse by adding the next coin, or not

p coin_change(15, [1,6,7,1], 0, [], Hash.new(0))
