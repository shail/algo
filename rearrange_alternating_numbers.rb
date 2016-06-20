def rearrange(array)
  (0...array.length).to_a.each do |i|
    j = 0
    while j + 2 < array.length do
      temp = [array[j], array[j+1], array[j+2]]
      temp.map! { |x| x >= 0 ? 1 : -1 }
      if temp[0] == temp[1] && temp[1] != temp[2]
        tmp = array[j+1]
        array[j+1] = array[j+2]
        array[j+2] = tmp
      end
      j += 1
    end
  end
  array
end

p rearrange([2,3,-4,-9,-1,-7,1,-5,-6])
