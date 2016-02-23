def add_digits(num)
  counter = 0

  num.to_s.split("").each do |number|
    counter += number.to_i
  end

  if counter < 10
    counter
  else
    add_digits(counter)
  end
end

def digital_root(num)
    num - 9*((num-1)/9.0).to_i
end
