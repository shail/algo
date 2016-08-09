def get_max_area(hist)
  stack = []
  max_area = 0

  i = 0
  while i < hist.length do
    if stack.empty? || hist[stack.last] <= hist[i]
      stack << i
      i += 1
    else
      tp = stack.pop
      area_with_top = hist[tp] * (stack.empty? ? i : (i - stack.last - 1))
      max_area = area_with_top if max_area < area_with_top
    end
  end

  while !stack.empty? do
    tp = stack.pop
    area_with_top = hist[tp] * (stack.empty? ? i : (i - stack.last - 1))
    max_area = area_with_top if max_area < area_with_top
  end

  return max_area
end

p get_max_area([6,2,5,4,5,1,6])
