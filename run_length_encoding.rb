def print_all(string)
  (string.length-3).downto(2).each do |i|
    (0..(string.size-2-i)).to_a.each do |k|
      puts "#{string[0...k+1]}#{i}#{string[i+k+1...string.length]}"
    end
  end
end

print_all("nailed")
print_all("batch")
