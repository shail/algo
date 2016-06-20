class Node
  attr_accessor :value, :next
  def initialize(value, level)
    @value = value
    @next = Array.new(level)
  end
end


class SkipList
  def initialize()
    @head = Node.new(0,33)
    @levels = 1
  end

  def insert(value)
    level = 0
    # Generate a 32-bit integer
    r = rand(2**31-1)
    while (r & 1) == 1 do
      level += 1
      if level == @levels
        @levels += 1
        break
      end
      r >>= 1
    end

    new_node = Node.new(value, level+1)
    cur = @head
    (@levels-1).downto(0) do |i|
      while cur.next[i] do
        break if cur.next[i].value > value
        cur = cur.next[i]
      end
      if i <= level
        new_node.next[i] = cur.next[i]
        cur.next[i] = new_node
      end
    end
  end

  def contains(value)
    cur = @head
    (@levels-1).downto(0) do |i|
      while cur.next[i] do
        break if cur.next[i].value > value
        return true if cur.next[i].value == value
        cur = cur.next[i]
      end
    end
    return false
  end

  def remove(value)
    cur = @head
    found = false
    (@levels-1).downto(0) do |i|
      while cur.next[i] do
        if cur.next[i].value == value
          found = true
          cur.next[i] = cur.next[i].next[i]
          break
        end
        break if cur.next[i].value > value
        cur = cur.next[i]
      end
    end
    return found
  end

  def enumerate()
    cur = @head.next[0]

    enumerator = Enumerator.new do |yielder|
      while cur do
        yielder << cur.value
        cur = cur.next[0]
      end
    end
    return enumerator
  end
end

skip_list = SkipList.new()
skip_list.insert(8)
skip_list.insert(9)
skip_list.insert(20)
skip_list.insert(10)
skip_list.insert(5)
skip_list.insert(2)
puts skip_list.contains(8) == true
puts skip_list.contains(9) == true

result = []
enumerator = skip_list.enumerate
enumerator.each do |i|
  result << i
end

puts result.inspect
