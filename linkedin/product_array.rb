def product_array(array)
  product_array = Array.new(array.length) { 1 }

  temp = 1
  array.each_with_index do |value, index|
    product_array[index] = temp
    temp *= array[index]
  end

  p product_array

  temp = 1
  (array.length-1).downto(0).to_a.each do |i|
    product_array[i] = temp
    temp *= array[i]
  end

  product_array
end

p product_array([10,3,5,6,2,0])
