def init_combinations(set)
  (0..set.length).to_a.each do |i|
    recursive_combinations(set, i, 0, [])
  end
end

def recursive_combinations(set, step_val, array_index, array)
  if step_val == 0
    puts array.inspect
  else
    (array_index..set.length-1).to_a.each do |i|
      # Push the current element into the array
      array.push(set[i])
      # Recursive call to generate all combinations for the remaining "values" in the combination
      recursive_combinations(set, step_val - 1, i + 1, array)
      array.pop()
    end
  end
end

init_combinations([1,2,3])

# Step_val: how many numbers to print out
# [0] ==> 0
# [1], [2], [3] ==> 1

#string parse with + and * alternating
#random weighted number given hash with key value
#  - use random number and then go through hash and do sum - random_number and check which is greater than or equal to
#  - enter ranges in the array and then do a binary search
