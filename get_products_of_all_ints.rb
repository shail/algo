#Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

def get_products_of_all_ints_except_at_index(array)
  new_array = []
  before_value_multiplied = 1
  array.each_with_index do |value, index|
    multiplier = 1
    array[index + 1..array.length].each do |value|
      multiplier *= value
    end
    new_array << multiplier * before_value_multiplied
    before_value_multiplied *= value
  end
  new_array.inspect
end

puts get_products_of_all_ints_except_at_index([1,7,3,4])
