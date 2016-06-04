def convert_to_number(array)
  array.join("").to_i
end

def nextPalindrome(iInputNum)
  array = []
  # Easier to deal with as an array of iInputNums
  while iInputNum > 0 do
    array.unshift(iInputNum % 10)
    iInputNum = iInputNum/10
  end

  if array.uniq.length == 1 && array.uniq.first == 9
    length = array.length
    array = [1]
    array += [0] * (length - 1)
    array << 1
    return convert_to_number(array)
  end

  n = array.length
  mid = n/2
  left_smaller = false
  i = mid - 1
  j = (n % 2) == 0 ? mid : mid + 1

  while i >= 0 && array[i] == array[j] do
    i -= 1
    j += 1
  end

  left_smaller = true if i < 0 || array[i] < array[j]

  while i >= 0 do
    array[j] = array[i]
    j += 1
    i -= 1
  end

  if left_smaller
    carry = 1
    i = mid - 1

    if n % 2 == 1
      array[mid] += carry
      carry = array[mid] / 10
      array[mid] = array[mid] % 10
      j = mid + 1
    else
      j = mid
    end

    while i >= 0 do
      array[i] += carry
      carry = array[i] / 10
      array[i] = array[i] % 10
      array[j] = array[i]
      j += 1
      i -= 1
    end
  end
  return convert_to_number(array)
end

p nextPalindrome(23545) == 23632
p nextPalindrome(99) == 101
p nextPalindrome(1234) == 1331
p nextPalindrome(6789876) == 6790976
p nextPalindrome(8998) == 9009
p nextPalindrome(1) == 2
