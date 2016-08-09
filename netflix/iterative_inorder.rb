def in_order(root)
  current = root
  stack = []

  done = false

  while !done do
    if !current.nil?
      stack << current
      current = current.left
    else
      if !stack.empty?
        current = stack.pop
        puts current.value
        current = current.right
      else
        done = true
      end
    end
  end
end
