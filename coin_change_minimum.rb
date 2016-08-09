INT_MAX = 2 ** 63 - 1
#best_count = first index
def minimum_coins(total, coins)
  table = Array.new(total + 1) { Array.new(2) }
  table[0] = [0,0]

  (1..total).to_a.each do |i|
    table[i] = [INT_MAX, []]
  end

  (1..total).to_a.each do |i|
    (0..coins.length-1).to_a.each do |j|
      if coins[j] <= i
        sub_res = table[i-coins[j]][0]
        if sub_res != INT_MAX && sub_res + 1 < table[i][0]
          table[i][0] = sub_res + 1
          #table[i][1] = [coins[j]]
        elsif sub_res + 1 == table[i][0]
          table[i][1] << coins[j]
        end
      end
    end
  end
  puts table[10].inspect
end

minimum_coins(10, [2,3,5,6,7,8])
