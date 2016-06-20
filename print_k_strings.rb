def print_all_k_length(string, k)
  print(string, "", string.length, k)
end

def print(string, prefix, n, k)
  if k == 0
    puts prefix.inspect
    return
  end

  (0..n-1).to_a.each do |i|
    new_prefix = prefix + string[i]
    print(string, new_prefix, n, k-1)
  end
end

print_all_k_length("ab", 3)
