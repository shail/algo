def busiest_time(ranges)
  end_points = []
  ranges.each do |range|
    end_points += [[range[0], 1], [range[1], -1]]
  end
  end_points.sort!
  current, most = 0, 0
  busiest = nil
  end_points.each do |e|
    current += e[1]
    if current > most
      most = current
      busiest = e[0]
    end
  end
  return busiest
end

p busiest_time([[1,3], [4,9], [2,4]]) == 2
p busiest_time([[1,3], [4,9], [3,4]]) == 1
p busiest_time([[1,3], [3,9], [3,4]]) == 3
