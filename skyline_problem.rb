Building = Struct.new("Building", :left, :ht, :right)

class Strip
  attr_accessor :left, :ht

  def initialize(left, ht)
    @left = left
    @ht = ht
  end
end

class Skyline
  attr_accessor :array, :n

  def initialize()
    @array = []
    @n = @array.length
  end

  def append(strip)
    return if @n > 0 && @array[@n-1].ht == strip.ht
    if @n > 0 && @array[@n-1].left == strip.ht
      @array[@n-1].ht = [@array[@n-1].ht, strip.ht].max
      return
    end

    @array[@n] = strip
    @n += 1
  end
end

def merge(sky1, sky2)
  res = Skyline.new()
  h1, h2 = 0, 0

  i,j = 0, 0

  while (i < sky1.n && j < sky2.n) do
    if sky1.array[i].left < sky2.array[j].left
      x1 = sky1.array[i].left
      h1 = sky1.array[i].ht
      maxh = [h1, h2].max
      res.append(Strip.new(x1, maxh))
      i += 1
    else
      x2 = sky2.array[j].left
      h2 = sky2.array[j].ht
      maxh = [h1, h2].max
      res.append(Strip.new(x2, maxh))
      j += 1
    end
  end

  while (i < sky1.n) do
    res.append(sky1.array[i])
    i += 1
  end

  while (j < sky2.n) do
    res.append(sky2.array[j])
    j += 1
  end
  res
end

def print_skyline(skyline)
  result = []
  skyline.array.each do |strip|
    result << [strip.left, strip.ht]
  end
  result
end

def find_skyline(buildings, l, h)
  if l == h
    res = Skyline.new()
    res.append(Strip.new(buildings[l].left, buildings[l].ht))
    res.append(Strip.new(buildings[l].right, 0))
    return res
  end

  mid = (l + h)/2

  left_sky = find_skyline(buildings, l, mid)
  right_sky = find_skyline(buildings, mid+1, h)
  res = merge(left_sky, right_sky)

  return res
end

def skyline(buildings)
  res = find_skyline(buildings, 0, buildings.length-1)
  p print_skyline(res)
end

buildings = [[1,11,5], [2,6,7], [3,13,9], [12,7,16], [14,3,25], [19,18,22], [23,13,29], [24,4,28]]
buildings.map! do |array|
  Building.new(array[0], array[1], array[2])
end
skyline(buildings)
