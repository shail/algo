def read_n(output, n)
  k = 4 # some predefined value
  temp_buffer = Array.new(k)
  read = 0 # num of char read by current call
  has_read = 0 # running total of char read

  while true do
    read = read_k(temp_buffer)
    to_read = [read, n-has_read].min
    # do the copy here
    (0...to_read).to_a.each do |i|
      output[has_read] = temp_buffer[i]
    end
    return has_read if read < k
    return n if has_read == n
  end
end
