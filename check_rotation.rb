# If you double the first string, then it will have all the rotations possible, then you can check substring.
# You are provided a substring method

def is_rotation?(first_string, second_string)
  first_string = first_string + first_string
  is_substring(first_string, second_string)
end

is_rotation?("waterbottle", "erbottlewat")
is_rotation?("waterbottle", "ewaterbottl")
