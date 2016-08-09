# Initialize first and second smallest to INT_MAX
# Loop through all the elements
#   If the current element is greater than first, then update first and second
#   Else if the current element is greater than second then update second

INT_MAX = -2 ** 63 - 1

def print_two_smallest(array)
  first, second = INT_MIN, INT_MIN
  if array.length < 2
    puts "Invalid Input"
    return
  end

  (0...array.length).to_a.each do |i|
    # if the current element is smaller than first then update both first and second
    if array[i] > first
      second = first
      first = array[i]
    elsif array[i] > second && array[i] != first
      second = array[i]
    end
  end

end
