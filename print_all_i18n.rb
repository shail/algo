def print(string)
  puts "#{string[0]}#{string.length-2}#{string[string.length-1]}"
  (string.length-3).downto(2) do |i|
    (0..string.length-2-i).to_a.each do |k|
      puts "#{string[0...k+1]}#{i}#{string[i+k+1..string.length-1]}"
    end
  end
end

print("nailed")
print("batch")
