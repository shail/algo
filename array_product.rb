def product_array(array)
  products = []

  # Get products below current index
  p = 1
  array.each_with_index do |element, index|
    products[index] = p
    p *= element
  end

  # Get products above current index
  p = 1
  (array.length-1).downto(0).to_a.each do |i|
    products[i] *= p
    p *= array[i]
  end

  products
end

p product_array([1,2,3,4,5])
