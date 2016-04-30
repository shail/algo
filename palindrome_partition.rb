def pal_partition(string)
  if string.empty?
    return [[]]
  end
  result = (1..string.length).each_with_object([]) do |i, array|
    s = string[0,i]
    next unless is_palindrome(s)
    pal_partition(string[i..-1]).each do |b|
      array << [s, *b]
    end
  end
  join(result)
end

def is_palindrome(string)
  result = true
  left = 0
  right = string.length - 1
  while left < right do
    result = false if string[left] != string[right]
    left += 1
    right -= 1
  end
  result
end

def join(array)
  result = []
  array.each do |a|
    result << a.join("|") + "|"
  end
  result
end

puts pal_partition("aab").inspect
