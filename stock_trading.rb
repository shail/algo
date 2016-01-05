first = [10, 7, 5, 8, 11, 9]
second = [-10, -5, -3, -2, -8]
third = [1, 5, 3, -2, 10]

def optimal_sell(stock_prices)
  index_to_buy = 0
  index_to_sell = 0
  low_price = stock_prices.first
  max_return = stock_prices[0] - stock_prices[1]
  stock_prices.each_with_index do |price, index|
    if price < low_price
      low_price = price
      index_to_buy = index
    end
    if price - low_price > max_return
      max_return = price - low_price
      index_to_sell = index
    end
  end
  puts [index_to_buy, index_to_sell, max_return].inspect
end

optimal_sell(first)
optimal_sell(second)
optimal_sell(third)
